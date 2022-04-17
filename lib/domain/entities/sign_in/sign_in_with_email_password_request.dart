import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_in_with_email_password_request.freezed.dart';

@freezed
class SignInWithEmailPasswordRequest with _$SignInWithEmailPasswordRequest {
  const factory SignInWithEmailPasswordRequest({
    required String email,
    required String password,
  }) = _SignInWithEmailPasswordRequest;
}
