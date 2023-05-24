import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Enviroment {
  static String MarvelPublicKey = dotenv.env['PUBLIC_KEY'] ?? 'No hay public api key';
  static String MarvelPrivateKey = dotenv.env['PRIVATE_KEY'] ?? 'No hay private api key';
  static String ts = '1677784856';

  static String generateHash(String timeStamp, String privateKey, String publicKey) {
  String combinedString = timeStamp + privateKey + publicKey;
  var bytes = utf8.encode(combinedString);
  var digest = md5.convert(bytes);
  return digest.toString();
}
}
