import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:forsat/application/classes/errors/common_error.dart';
import 'package:forsat/application/forsat_api.dart';

abstract class AuthRepository {
  Future signIn({
    @required String email,
    @required String password,
  });

  Future signUp({
    @required String firstName,
    @required String lastName,
    @required String email,
    @required String password,
    @required String passwordConfirmation,
  });
}

class AuthRepositoryImpl implements AuthRepository {
  @override
  Future signIn({
    String email,
    String password,
  }) async {
    try {
      var response = await ForsatApi.dio.post(
        "/api/auth/login",
        data: {"email": email, "password": password},
      );
    } on DioError catch (e) {
      showNetworkError(e);
    }
  }

  @override
  Future signUp({
    String firstName,
    String lastName,
    String email,
    String password,
    String passwordConfirmation,
  }) async {
    try {
      var response = await ForsatApi.dio.post(
        "/api/auth/register",
        data: {
          "firstName": firstName,
          "lastName": lastName,
          "email": email,
          "password": password,
          "password_confirmation": passwordConfirmation,
        },
      );
      print(response);
    } on DioError catch (e) {
      showNetworkError(e);
    }
  }
}
