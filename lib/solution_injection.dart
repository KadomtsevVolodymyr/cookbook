import 'package:balancebyte/configs/app_config.dart';
import 'package:balancebyte/configs/environment/environment_helper.dart';
import 'package:balancebyte/configs/environment/environment_service.dart';
import 'package:balancebyte/configs/environment/environment_variables.dart';
import 'package:balancebyte/data/datasource/local/facade/secure_storage_interface.dart';
import 'package:balancebyte/data/datasource/local/facade/solution_storage_interface.dart';
import 'package:balancebyte/data/datasource/local/secure_storage.dart';
import 'package:balancebyte/data/datasource/local/shared_storage.dart';
import 'package:balancebyte/data/datasource/local/solution_storage.dart';
import 'package:balancebyte/data/datasource/network/api/authentication/authentication_api.dart';
import 'package:balancebyte/data/datasource/network/api/authentication/authentication_api_interface.dart';
import 'package:balancebyte/data/datasource/network/api/user/user_api.dart';
import 'package:balancebyte/data/datasource/network/api/user/user_api_interface.dart';
import 'package:balancebyte/data/datasource/network/interceptors/token_interceptor.dart';
import 'package:balancebyte/data/datasource/network/services/firebase_auth_service/firebase_auth_service.dart';
import 'package:balancebyte/data/datasource/network/services/firebase_auth_service/firebase_auth_service_interface.dart';
import 'package:balancebyte/data/datasource/network/services/network_service/network_service.dart';
import 'package:balancebyte/data/datasource/network/services/network_service/network_service_interface.dart';
import 'package:balancebyte/data/repositories/auth_repository.dart';
import 'package:balancebyte/data/repositories/solution_repository.dart';
import 'package:balancebyte/data/repositories/user_repository.dart';
import 'package:balancebyte/domain/repositories/auth_repository_interface.dart';
import 'package:balancebyte/domain/repositories/solution_repository_interface.dart';
import 'package:balancebyte/domain/repositories/user_repository_interface.dart';
import 'package:balancebyte/utils/hive_helper.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class SolutionInjection {
  static List<SingleChildWidget> getDiList(
    BuildContext context,
  ) {
    final SolutionInjection injection = SolutionInjection();
    return injection.diFactory(context);
  }

  List<SingleChildWidget> diFactory(
    BuildContext context,
  ) {
    return [
      ..._buildIndependentServices(),
      ..._dependentServices(context),
    ];
  }

  //Feel free to expand this
  List<SingleChildWidget> _buildIndependentServices() {
    return [
      Provider.value(value: AppConfig()),
      Provider.value(value: HiveHelper()),
      Provider.value(value: SharedStorage()),
      Provider.value(value: const FlutterSecureStorage()),
    ];
  }

  List<SingleChildWidget> _dependentServices(BuildContext context) {
    return [
      ProxyProvider<FlutterSecureStorage, ISecureStorage>(
        update: (
          BuildContext context,
          FlutterSecureStorage flutterSecureStorage,
          ISecureStorage? secureStorage,
        ) =>
            SecureStorage(secureStorage: flutterSecureStorage),
      ),
      ProxyProvider<AppConfig, EnvironmentHelper>(
        update: (
          BuildContext context,
          AppConfig appConfig,
          EnvironmentHelper? greetingService,
        ) =>
            EnvironmentHelper(
          appConfig: appConfig,
          environmentValue: EnvironmentVariables.environmentValue,
          mockValue: EnvironmentVariables.mockValue,
        ),
      ),
      ProxyProvider2<AppConfig, EnvironmentHelper, EnvironmentService>(
        update: (
          BuildContext context,
          AppConfig appConfig,
          EnvironmentHelper envHelper,
          EnvironmentService? greetingService,
        ) =>
            EnvironmentService(
          environment: envHelper.currentEnvironment(),
          appConfig: appConfig,
        ),
      ),
      ProxyProvider2<EnvironmentService, HiveHelper, ISolutionStorage>(
        update: (
          BuildContext context,
          EnvironmentService environmentService,
          HiveHelper hiveHelper,
          ISolutionStorage? configurationStore,
        ) {
          final HiveInterface hive = Hive;
          return SolutionStorage(
            hive: hive,
            boxPrefix: environmentService.config.hiveBoxPrefix,
            hiveHelper: hiveHelper,
          );
        },
      ),
      ProxyProvider<EnvironmentService, INetworkService>(
        update: (
          BuildContext context,
          EnvironmentService environmentService,
          INetworkService? networkService,
        ) {
          return NetworkService(
            baseUrl: environmentService.config.portalUrl,
          );
        },
      ),
      ProxyProvider3<EnvironmentService, EnvironmentHelper, ISecureStorage,
          INetworkService>(
        update: (
          BuildContext context,
          EnvironmentService environmentService,
          EnvironmentHelper environmentHelper,
          ISecureStorage authStore,
          INetworkService? networkService,
        ) {
          final interceptors = [
            LogInterceptor(),
            TokenInterceptor(
              authStore: authStore,
              environmentHelper: environmentHelper,
            ),
          ];
          return NetworkService(
            baseUrl: environmentService.config.portalUrl,
            interceptors: interceptors,
          );
        },
      ),
      ProxyProvider<ISolutionStorage, ISolutionRepository>(
        update: (
          BuildContext context,
          ISolutionStorage storage,
          ISolutionRepository? solutionRepository,
        ) =>
            SolutionRepository(
          storage: storage,
        ),
      ),
      ProxyProvider<INetworkService, IAuthenticationApi>(
        update: (
          BuildContext context,
          INetworkService networkService,
          IAuthenticationApi? authApi,
        ) {
          return AuthenticationApi(
            networkService: networkService,
          );
        },
      ),
      ProxyProvider<INetworkService, IUserApi>(
        update: (
          BuildContext context,
          INetworkService networkService,
          IUserApi? userApi,
        ) {
          return UserApi(
            networkService: networkService,
          );
        },
      ),
      ProxyProvider<IUserApi, IUserRepository>(
        update: (
          BuildContext context,
          IUserApi userApi,
          IUserRepository? userRepository,
        ) {
          return UserRepository(
            userApi: userApi,
          );
        },
      ),
      ProxyProvider<INetworkService, IFirebaseAuthService>(
        update: (
          BuildContext context,
          INetworkService networkService,
          IFirebaseAuthService? authApi,
        ) {
          final firebaseAuth = FirebaseAuth.instance;
          return FirebaseAuthService(
            firebaseAuth,
          );
        },
      ),
      ProxyProvider3<ISecureStorage, IAuthenticationApi, IFirebaseAuthService,
          IAuthRepository>(
        update: (
          BuildContext context,
          ISecureStorage secureStorage,
          IAuthenticationApi authApi,
          IFirebaseAuthService firebaseService,
          IAuthRepository? solutionRepository,
        ) {
          return AuthRepository(
            firebaseAuthService: firebaseService,
            authenticationApi: authApi,
            secureStorage: secureStorage,
          );
        },
      ),
    ];
  }
}
