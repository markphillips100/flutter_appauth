part of flutter_appauth;

/// Details required for a combined authorization and code exchange request
class EndSessionRequest implements _Mappable {

  AuthorizationServiceConfiguration serviceConfiguration;
  Map<String, String> additionalParameters;

  EndSessionRequest(String idTokenHint, String postLogoutRedirectUri, AuthorizationServiceConfiguration serviceConfiguration) {
    this.serviceConfiguration = serviceConfiguration;
    this.additionalParameters = toAdditionalParametersMap(idTokenHint, postLogoutRedirectUri);
  }

  Map<String, String> toAdditionalParametersMap(String idTokenHint, String postLogoutRedirectUri) {
    return <String, String>{
      'id_token_hint': idTokenHint,
      'post_logout_redirect_uri': postLogoutRedirectUri
    };
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'clientId': "notused",
      'redirectUrl': "http://notused",
      'serviceConfiguration': serviceConfiguration?.toMap(),
      'additionalParameters': additionalParameters
    };
  }
}
