import 'package:everlink_lottery_app/domain/value_objects/authentication_state.dart';
import 'package:everlink_lottery_app/data/remote_repository/firebase_auth_repository.dart';
import 'package:everlink_lottery_app/locator.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'authentication_provider.g.dart';

@riverpod
class AuthNotifier extends _$AuthNotifier {
  final FirebaseAuthRepository _authRepository =
      locator<FirebaseAuthRepository>();
  @override
  AuthenticationState build() {
    return const AuthenticationState.initial();
  }

  Future<void> login({required String email, required String password}) async {
    state = const AuthenticationState.loading();
    final response =
        await _authRepository.login(email: email, password: password);
    state = response.fold(
      (error) => AuthenticationState.unauthenticated(message: error),
      (response) => AuthenticationState.authenticated(user: response!),
    );
  }

  void setPasswordMismatch() {
    state = const AuthenticationState.unauthenticated(
        message: "Passwords don't match");
  }

  Future<void> signup({required String email, required String password}) async {
    state = const AuthenticationState.loading();
    final response =
        await _authRepository.signup(email: email, password: password);
    state = response.fold(
      (error) => AuthenticationState.unauthenticated(message: error),
      (response) => AuthenticationState.authenticated(user: response!),
    );
  }

  Future<void> continueWithGoogle() async {
    state = const AuthenticationState.loading();
    final response = await _authRepository.continueWithGoogle();
    state = response.fold(
      (error) => AuthenticationState.unauthenticated(message: error),
      (response) => AuthenticationState.authenticated(user: response),
    );
  }
}
