part of flutter_appauth;

/// Details required for a combined authorization and code exchange request
class EndSessionRequest implements _Mappable {

  AuthorizationServiceConfiguration serviceConfiguration;
  String idTokenHint;
  String postLogoutRedirectUri;

  EndSessionRequest(String idTokenHint, String postLogoutRedirectUri, AuthorizationServiceConfiguration serviceConfiguration) {
    this.serviceConfiguration = serviceConfiguration;
    this.idTokenHint = idTokenHint;
    this.postLogoutRedirectUri = postLogoutRedirectUri;
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id_token_hint': idTokenHint,
      'post_logout_redirect_uri': postLogoutRedirectUri,
      'serviceConfiguration': serviceConfiguration?.toMap()
    };
  }}
