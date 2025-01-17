# 0.6.0
* [Android] **BREAKING CHANGE** Bump Gradle plugin to 3.5.2
* [iOS] Fix issue [63](https://github.com/MaikuB/flutter_appauth/issues/63) where `login_hint` and `promptValues` was only passed when using service discovery
* Update pubspec to match latest version of pub

# 0.5.0
* [Android] **BREAKING CHANGE** Bump compile and target SDK versions to 29
* [Android] **BREAKING CHANGE** Bump Gradle plugin to version 3.5.2
* Bump example app to use Gradle distribution version 5.4.1

# 0.4.2
* [iOS] Update AppAuth SDK dependency to 1.2 so it works on iOS 13. Thanks to the PR from [Aynur Dinmukhametov](https://github.com/ARDcode)

# 0.4.0+1
* Make it clearer in the readme that AndroidX is required

# 0.4.0
* [iOS] Update AppAuth SDK dependency to 1.1
* Update email address in pubspec.yaml
* Add `GrantTypes` class as a convenience for other developers to use
* **BREAKING CHANGE** `authorize` method has been corrected to accept an instance of the `AuthorizationRequest` class as opposed to an instance of the `AuthorizationTokenRequest` class even though a token isn't being requested

# 0.3.0+1
* Update email address in pubspec.yaml

# 0.3.0
* [iOS] Explicitly set to depend on version 1.0 of the AppAuth iOS SDK
* Added Cirrus CI configuration

# 0.2.1+2
* Updated README to fix section on refreshing tokens where `authorizationCode` was shown in code snippet by mistake

# 0.2.1+1
* Updated README to add a note suggesting developers to check the documentation of the identity provider they plan to use

# 0.2.1
* [iOS] Fix issue with `login_hint` OAuth parameter (specified by the `loginHint` field of the `AuthorizationTokenRequest` and `AuthorizationRequest` classes). Example app has also been updated to demonstrate how to specify it
* Added support for specifying the `prompt` OAuth parameter. This can be specified by populating the `promptValues` field in the either the `AuthorizationTokenRequest` or `AuthorizationRequest` class. Updated example app (note: code is commented out) to demonstrate how to use it

# 0.2.0
* **BREAKING CHANGE** Updated the Android Gradle plugin to version 3.4.0. Applies to both the library and sample app
* Updated README with a note for developers to check to see if their development environment on the Android is up to date as this should now be fixed with the release of Android Studio 3.4
* Updated the Gradle distribution used by the example app to 5.1.1

# 0.1.1
* Changed the request codes used internally on the Android side to be less than 16 bits. Thanks to the PR from [Dviejopomata](https://github.com/Dviejopomata)

# 0.1.0
* **BREAKING CHANGE** Updated lower bound of the Dark SDK constraints from 2.0.0-dev.68.0 to 2.1.0
* Added more details to the error messages when platform exceptions are raised e.g. when problems occur exchanging the authorization code. Note that there will be differences in the level of details that will be returned on each platform. This is due the differences between the SDKs on each platform

# 0.0.4+1
* No functional changes in this release. Just remove old comment in the code and changes to format the README more nicely

# 0.0.4
* **BREAKING CHANGE** renamed `authorizeAndExchangeToken` method to `authorizeAndExchangeCode` to reflect what happens behind the scenes
* Added an `authorize` method that performs an authorization request to get an authorization code without exchanging it
* Updated README and sample code to demonstrate the use of the `authorize` method, how to exchange the authorization code for tokens and how to perform an authorization request that will retrieve the disocvery document with an issuer instead of the full discovery endpoint URL.

# 0.0.3+1
* Fix code around inferring grant type.
* Update plugin description

# 0.0.3
* Fix to infer grant type based on what is provided when creating a token request (currently only refresh token is supported);
* Update README to include link to https://appauth.io
* Update example to include (commented out) code where the authorization and token endpoints can be explicit set instead of relying on discovery to fetch those endpoints

# 0.0.2+1
* Switch example to connect to test instance of IdentityServer4

# 0.0.2
* Fix error when either `discoveryUrl` or `issuer` has been passed to the `AuthorizationTokenRequest` constructor

# 0.0.1+1
* Update the README to add sections for setting up on Android and iOS

## 0.0.1

* Initial release of the plugin.
