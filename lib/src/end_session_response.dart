class EndSessionResponse {
  EndSessionResponse(
    this.state,
    this.endSessionAdditionalParameters,
  );

  /// If the "state" parameter was present in the client end-session request. The exact value received from the client
  final String state;

  /// Additional parameters included in the response
  final Map<String, dynamic> endSessionAdditionalParameters;

}