import 'dart:convert';

class TokenModel {
  final String accessToken;
  final String refreshToken;
  final String tokenType;

  TokenModel({
    required this.accessToken,
    required this.refreshToken,
    required this.tokenType,
  });

  factory TokenModel.fromJson(Map<String, dynamic> json) {
    return TokenModel(
      accessToken: json['access_token'] as String,
      refreshToken: json['refresh_token'] as String,
      tokenType: json['token_type'] as String,
    );
  }

  factory TokenModel.fromRawJson(String str) {
    final Map<String, dynamic> json = jsonDecode(str);
    return TokenModel.fromJson(json);
  }

  Map<String, dynamic> toJson() {
    return {
      'access_token': accessToken,
      'refresh_token': refreshToken,
      'token_type': tokenType,
    };
  }

  String toRawJson() => jsonEncode(toJson());
}
