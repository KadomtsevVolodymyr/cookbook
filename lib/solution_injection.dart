import 'package:cookbook/configs/app_config.dart';
import 'package:cookbook/configs/environment/environment_helper.dart';
import 'package:cookbook/configs/environment/environment_service.dart';
import 'package:cookbook/configs/environment/environment_variables.dart';
import 'package:cookbook/data/datasource/local/facade/solution_storage_interface.dart';
import 'package:cookbook/data/datasource/local/shared_storage.dart';
import 'package:cookbook/data/datasource/local/solution_storage.dart';
import 'package:cookbook/data/datasource/network/services/network_service/network_service.dart';
import 'package:cookbook/data/datasource/network/services/network_service/network_service_interface.dart';
import 'package:cookbook/data/repositories/solution_repository.dart';
import 'package:cookbook/domain/repositories/solution_repository_interface.dart';
import 'package:cookbook/utils/hive_helper.dart';
import 'package:flutter/material.dart';
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
    ];
  }

  List<SingleChildWidget> _dependentServices(BuildContext context) {
    return [
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
    ];
  }
}
