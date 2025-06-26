import 'dart:async';
import 'dart:developer';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fresh_dio/fresh_dio.dart';

const accessToken = 'access_token';
const refreshToken = 'refresh_token';
const tokenType = 'token_type';

class AuthDataRepository implements TokenStorage<OAuth2Token> {
  final _storage = const FlutterSecureStorage();
  final tokenController = StreamController<OAuth2Token?>.broadcast();

  Stream<OAuth2Token?> get tokenStream => tokenController.stream;

  @override
  Future<void> delete() async {
    tokenController.add(null);
    try {
      await _storage.delete(key: accessToken);
      await _storage.delete(key: refreshToken);
      await _storage.delete(key: tokenType);
    } catch (e) {
      await _storage.deleteAll();
    }
  }
  @override
  Future<OAuth2Token?> read() async {
    try {
      var at = await _storage.read(key: accessToken);
      if (at == null || at.isEmpty) {
        tokenController.add(null);
        return null;
      }

      var rt = await _storage.read(key: refreshToken);
      var tt = await _storage.read(key: tokenType) ?? 'Bearer';

      if (rt == null || rt.isEmpty) {
        tokenController.add(null);
        return null;
      }

      var token = OAuth2Token(accessToken: at, refreshToken: rt, tokenType: tt);
      tokenController.add(token);
      return token;
    } catch (e) {
      tokenController.add(null);
      return null;
    }
  }

  @override
  Future<void> write(OAuth2Token token) async {
    try {
      tokenController.add(token);
      await _storage.write(key: accessToken, value: token.accessToken);
      await _storage.write(key: refreshToken, value: token.refreshToken);
      await _storage.write(key: tokenType, value: token.tokenType);
    } catch (e) {
      log('Error writing tokens: $e');
    }
  }
}