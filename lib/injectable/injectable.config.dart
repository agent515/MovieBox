// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:cloud_firestore/cloud_firestore.dart' as _i10;
import 'package:firebase_auth/firebase_auth.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../data/datasources/authentication_data_source_impl.dart' as _i4;
import '../data/datasources/remote_data_source_impl.dart' as _i9;
import '../data/repositories/authentication_repository_impl.dart' as _i7;
import '../domain/data_source/authentication_data_source.dart' as _i3;
import '../domain/data_source/remote_data_source.dart' as _i8;
import '../domain/repositories/authentication_repository.dart' as _i6;
import '../domain/use_cases/authentication/sign_in_with_email_password_use_case.dart'
    as _i11; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.singleton<_i3.AuthenticationDataSource>(
      _i4.AuthenticationDataSourceImpl(get<_i5.FirebaseAuth>()));
  gh.singleton<_i6.AuthenticationRepository>(
      _i7.AuthenticationRepositoryImpl(get<_i3.AuthenticationDataSource>()));
  gh.singleton<_i8.RemoteDataSource>(
      _i9.RemoteDataSourceImpl(get<_i10.FirebaseFirestore>()));
  gh.factory<_i11.SignInWithEmailPasswordUseCase>(() =>
      _i11.SignInWithEmailPasswordUseCase(get<_i6.AuthenticationRepository>()));
  return get;
}
