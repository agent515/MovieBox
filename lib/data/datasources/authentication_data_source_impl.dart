import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_box/core/failure/failure.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:dartz/dartz.dart';
import 'package:movie_box/domain/data_source/authentication_data_source.dart';
import 'package:movie_box/domain/entities/sign_in/sign_in_with_email_password_request.dart';

@Singleton(as: AuthenticationDataSource)
class AuthenticationDataSourceImpl implements AuthenticationDataSource {
  final FirebaseAuth _firebaseAuth;

  AuthenticationDataSourceImpl(this._firebaseAuth);

  @override
  Future<Either<Failure, void>> signInWithEmailPassword(
      SignInWithEmailPasswordRequest request) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: request.email,
        password: request.password,
      );
      return const Right(null);
    } catch (e, stack) {
      return errorHandler(e, stack);
    }
  }

  @override
  Future<Either<Failure, void>> signInWithCredential(
      AuthCredential credential) async {
    try {
      await _firebaseAuth.signInWithCredential(credential);
      return const Right(null);
    } catch (e, stack) {
      return errorHandler(e, stack);
    }
  }

  @override
  Future<Either<Failure, void>> signOut() async {
    try {
      await _firebaseAuth.signOut();
      return const Right(null);
    } catch (e, stack) {
      return errorHandler(e, stack);
    }
  }

  Either<Failure, void> errorHandler(e, stack) {
    logException(e, stack);
    String message = getMessageFromErrorCode(e);

    return Left(
      Failure(
        title: 'Authentication error',
        subtitle: message,
      ),
    );
  }

  void logException(e, stack) {
    if (!kReleaseMode) {
      log(e);
      log(stack);
    }
  }

  String getMessageFromErrorCode(e, {changePassword = false}) {
    switch (e.code) {
      case "ERROR_EMAIL_ALREADY_IN_USE":
      case "account-exists-with-different-credential":
      case "email-already-in-use":
        return "Email already used. Go to login page.";
      case "ERROR_WRONG_PASSWORD":
      case "wrong-password":
        if (changePassword) return "Incorrect current password.";
        return "Wrong email/password combination.";
      case "weak-password":
        return "Password is weak. Must contain at least 6 characters.";
      case "ERROR_USER_NOT_FOUND":
      case "user-not-found":
        return "No user found with this email.";
      case "ERROR_USER_DISABLED":
      case "user-disabled":
        return "User disabled.";
      case "ERROR_TOO_MANY_REQUESTS":
      case "operation-not-allowed":
        return "Too many requests to log into this account.";
      case "ERROR_OPERATION_NOT_ALLOWED":
        return "Server error, please try again later.";
      case "ERROR_INVALID_EMAIL":
      case "invalid-email":
        return "Email address is invalid.";
      case "auth/user-not-found":
        return "No user found with this email";
      default:
        return "Login failed. Please try again.";
    }
  }

  @override
  Stream<User?> get authChanges => _firebaseAuth.authStateChanges();
}
