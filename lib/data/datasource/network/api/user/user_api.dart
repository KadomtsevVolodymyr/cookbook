import 'dart:io';

import 'package:balancebyte/data/datasource/network/api/user/user_api_interface.dart';
import 'package:balancebyte/data/datasource/network/exchange_models/request.dart';
import 'package:balancebyte/data/datasource/network/exchange_models/response.dart';
import 'package:balancebyte/data/datasource/network/services/network_service/network_service_interface.dart';
import 'package:balancebyte/data/model/user_model.dart';
import 'package:balancebyte/data/model/user_settings.dart';
import 'package:dio/dio.dart';

class UserApi implements IUserApi {
  UserApi({
    required INetworkService networkService,
  }) : _networkService = networkService;

  final INetworkService _networkService;

  static const String _usersPath = "users";
  static const String _mePath = "$_usersPath/me";

  static const String _dietsPath = "$_mePath/diets";
  static const String _goalsPath = "$_mePath/goals";
  static const String _intolerancesPath = "$_mePath/intolerances";
  static const String _profilePath = "$_mePath/profile";
  static const String _avatarPath = "$_mePath/avatar";

  @override
  Future<NetworkResponse<UserSettings>> getDiet() {
    return _networkService.request(
      const NetworkRequest(
        method: NetworkRequestType.get,
        path: _dietsPath,
      ),
      onParse: (response) {
        final data = response.data as Map<String, dynamic>;
        return UserSettings.fromJson(data, "diets");
      },
    );
  }

  @override
  Future<NetworkResponse<void>> setDiet(UserSettings diets) {
    print(diets.items);
    return _networkService.request(
      NetworkRequest(
        method: NetworkRequestType.patch,
        path: _dietsPath,
        data: {
          "diets": ["ASD"],
        },
      ),
      onParse: (response) {
        return response;
      },
    );
  }

  @override
  Future<NetworkResponse<UserSettings>> getGoals() {
    return _networkService.request(
      const NetworkRequest(
        method: NetworkRequestType.get,
        path: _goalsPath,
      ),
      onParse: (response) {
        final data = response.data as Map<String, dynamic>;
        return UserSettings.fromJson(data, "goals");
      },
    );
  }

  @override
  Future<NetworkResponse<void>> setGoals(UserSettings goals) {
    return _networkService.request(
      NetworkRequest(
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
        },
        method: NetworkRequestType.patch,
        path: _goalsPath,
        data: {
          "goals": goals,
        },
      ),
      onParse: (response) {
        return response;
      },
    );
  }

  @override
  Future<NetworkResponse<UserSettings>> getIntolerances() {
    return _networkService.request(
      const NetworkRequest(
        method: NetworkRequestType.get,
        path: _intolerancesPath,
      ),
      onParse: (response) {
        final data = response.data as Map<String, dynamic>;
        return UserSettings.fromJson(data, "intolerances");
      },
    );
  }

  @override
  Future<NetworkResponse<void>> setIntolerances(UserSettings intolerances) {
    return _networkService.request(
      NetworkRequest(
        method: NetworkRequestType.patch,
        path: _intolerancesPath,
        data: {
          "intolerances": intolerances,
        },
      ),
      onParse: (response) {
        return response;
      },
    );
  }

  @override
  Future<NetworkResponse<UserModel>> getMe() {
    return _networkService.request(
      const NetworkRequest(
        method: NetworkRequestType.get,
        path: _mePath,
      ),
      onParse: (response) {
        final data = response.data as Map<String, dynamic>;
        return UserModel.fromJson(data);
      },
    );
  }

  @override
  Future<NetworkResponse<void>> updateProfile({
    required String name,
    required String username,
    required String address,
  }) {
    return _networkService.request(
      NetworkRequest(
        method: NetworkRequestType.patch,
        path: _profilePath,
        data: {
          "name": name,
          "username": username,
          "address": address,
        },
      ),
      onParse: (response) {
        return response;
      },
    );
  }

  @override
  Future<NetworkResponse<void>> uploadAvatar({
    required String filePath,
  }) async {
    print(filePath);
    FormData formData = FormData.fromMap({
      "file": await MultipartFile.fromFile(
        filePath,
      ),
    });

    print(formData.fields);
    print(formData.files);

    return _networkService.request(
      NetworkRequest(
        method: NetworkRequestType.post,
        path: _avatarPath,
        data: formData,
      ),
      onParse: (response) {
        return response;
      },
    );
  }
}
