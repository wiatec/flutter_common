import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:encrypt/encrypt.dart';


class CommonCrypto{

  /// md5 crypto
  static String toMd5(String source){
    var bytes = utf8.encode(source);
    var d = md5.convert(bytes);
    return "$d";
  }

  /// base64 encode
  static String encodeB64(String source){
    var d = base64Encode(utf8.encode(source));
    return "$d";
  }


  /// base64 decode
  static String decodeB64(String source){
    var d = base64Decode(source);
    return "$d";
  }


  static final iv = IV.fromUtf8('1269571569321021');

  /// AES encrypt
  static String aesEncrypt(String key, String source){
    final en =  Encrypter(AES(Key.fromUtf8(toMd5(key)), mode: AESMode.cbc));
    return en.encrypt(source, iv: iv).base16.toUpperCase();
  }

  /// AES decrypt
  static String aesDecrypt(String key, String data){
    final en =  Encrypter(AES(Key.fromUtf8(toMd5(key)), mode: AESMode.cbc));
    return en.decrypt16(data, iv: iv);
  }

}