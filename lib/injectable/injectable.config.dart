// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../data/datasources/authentication_data_source_impl.dart' as _i4;
import '../data/datasources/remote_data_source_impl.dart' as _i6;
import '../data/repositories/authentication_repository_impl.dart' as _i8;
import '../domain/data_source/authentication_data_source.dart' as _i3;
import '../domain/data_source/remote_data_source.dart' as _i5;
import '../domain/repositories/authentication_repository.dart' as _i7;
import '../domain/use_cases/authentication/sign_in_with_email_password_use_case.dart'
    as _i9; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.singleton<_i3.AuthenticationDataSource>(
      _i4.AuthenticationDataSourceImpl());
  gh.singleton<_i5.RemoteDataSource>(_i6.RemoteDataSourceImpl());
  gh.singleton<_i7.AuthenticationRepository>(_i8.AuthenticationRepositoryImpl(
      get<_i3.AuthenticationDataSource>(), get<_i5.RemoteDataSource>()));
  gh.factory<_i9.SignInWithEmailPasswordUseCase>(() =>
      _i9.SignInWithEmailPasswordUseCase(get<_i7.AuthenticationRepository>()));
  return get;
}
