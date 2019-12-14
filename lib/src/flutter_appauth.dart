import 'dart:io' show Platform;
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'authorization_request.dart';
import 'authorization_response.dart';
import 'authorization_token_request.dart';
import 'authorization_token_response.dart';
import 'end_session_request.dart';
import 'end_session_response.dart';
import 'token_request.dart';
import 'token_response.dart';

class FlutterAppAuth {
  factory FlutterAppAuth() => _instance;

  @visibleForTesting
  FlutterAppAuth.private(MethodChannel channel) : _channel = channel;

  final MethodChannel _channel;

  static final FlutterAppAuth _instance = FlutterAppAuth.private(
      const MethodChannel('crossingthestreams.io/flutter_appauth'));

  /// Convenience method for authorizing and then exchanges code
  Future<AuthorizationTokenResponse> authorizeAndExchangeCode(
      AuthorizationTokenRequest request) async {
    final Map<dynamic, dynamic> result = await _channel.invokeMethod(
        'authorizeAndExchangeCode', request.toMap());
    return AuthorizationTokenResponse(
        result['accessToken'],
        result['refreshToken'],
        result['accessTokenExpirationTime'] == null
            ? null
            : DateTime.fromMillisecondsSinceEpoch(
                result['accessTokenExpirationTime'].toInt()),
        result['idToken'],
        result['tokenType'],
        result['authorizationAdditionalParameters']?.cast<String, dynamic>(),
        result['tokenAdditionalParameters']?.cast<String, dynamic>());
  }

  Future<AuthorizationResponse> authorize(AuthorizationRequest request) async {
    final Map<dynamic, dynamic> result =
        await _channel.invokeMethod('authorize', request.toMap());
    return AuthorizationResponse(
        result['authorizationCode'],
        result['codeVerifier'],
        result['authorizationAdditionalParameters']?.cast<String, dynamic>());
  }

  /// For exchanging tokens
  Future<TokenResponse> token(TokenRequest request) async {
    final Map<dynamic, dynamic> result =
        await _channel.invokeMethod('token', request.toMap());
    return TokenResponse(
        result['accessToken'],
        result['refreshToken'],
        result['accessTokenExpirationTime'] == null
            ? null
            : DateTime.fromMillisecondsSinceEpoch(
                result['accessTokenExpirationTime'].toInt()),
        result['idToken'],
        result['tokenType'],
        result['tokenAdditionalParameters']?.cast<String, String>());
  }

  /// For logging out
  /// AppAuth-Android doesn't implement the endsession endpoint yet.  Instead, use the authorize endpoint but
  /// pass the endsession endpoint as the authorize endpoint url.  Also, add the following addtional properties:
  /// "id_token_hint"
  /// "post_logout_redirect_uri"
  Future<EndSessionResponse> endSession(EndSessionRequest request) async {
    if (Platform.isAndroid) {
      throw 'Use an authorization request';
    } else {
      final Map<dynamic, dynamic> result = await _channel.invokeMethod('endsession', request.toMap());

      return EndSessionResponse(
        result['state'],
        result['endSessionAdditionalParameters']?.cast<String, dynamic>(),
      );
    }
  }
}
