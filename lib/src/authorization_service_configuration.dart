class AuthorizationServiceConfiguration {
  AuthorizationServiceConfiguration(
      this.authorizationEndpoint, this.tokenEndpoint, this.endSessionEndpoint)
      : assert(tokenEndpoint != null && authorizationEndpoint != null,
            'Must specify both the authorization and token endpoints');

  final String authorizationEndpoint;

  final String tokenEndpoint;

  final String endSessionEndpoint;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'tokenEndpoint': tokenEndpoint,
      'authorizationEndpoint': authorizationEndpoint,
      'endSessionEndpoint': endSessionEndpoint
    };
  }
}
