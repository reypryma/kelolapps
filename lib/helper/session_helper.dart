import 'package:flutter/widgets.dart';
import 'package:jaguar_jwt/jaguar_jwt.dart';

import '../config/kelolaku/constant.dart';

String getToken() {
  final claimSet =
  JwtClaim(issuer: 'erestro',expiry: DateTime.now().add(const Duration(days: 365)),
      issuedAt: DateTime.now().toUtc());

  String token = issueJwtHS256(claimSet, jwtKey);
  print("token***************$token");
  return token;
}

Map<String, String> get headers => {
  "Authorization": 'Bearer ${getToken()}',
};

//======================= Language Translate  ==================================

// String? getTranslated(BuildContext context, String key) {
//   return DemoLocalization.of(context)!.translate(key);
// }

