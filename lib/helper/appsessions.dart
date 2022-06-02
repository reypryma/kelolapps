import 'package:jaguar_jwt/jaguar_jwt.dart';

import '../config/kelolaku/constant.dart';

String getToken() {
  final claimSet = JwtClaim(
      issuer: 'kelolapps',
      expiry: DateTime.now().add(const Duration(days: 365)),
      issuedAt: DateTime.now().toUtc());

  String token = issueJwtHS256(claimSet, jwtKey);
  print("token***************$token");
  return token;
}

Map<String, String> get headers => {
      "Authorization": 'Bearer ${getToken()}',
    };
