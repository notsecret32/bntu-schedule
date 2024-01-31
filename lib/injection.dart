import 'package:bntu_schedule/core/network/network_info.dart';
import 'package:bntu_schedule/core/router/redirects/redirects.dart';
import 'package:bntu_schedule/features/admin/data/datasources/admin_authentication_remote_data_source.dart';
import 'package:bntu_schedule/features/admin/data/repositories/repositories.dart';
import 'package:bntu_schedule/features/admin/domain/repositories/repositories.dart';
import 'package:bntu_schedule/features/admin/domain/usecases/usecases.dart';
import 'package:bntu_schedule/features/admin/presentation/cubit/admin_authentication_cubit.dart';
import 'package:bntu_schedule/features/welcome/data/datasources/datasources.dart';
import 'package:bntu_schedule/features/welcome/data/repositories/repositories.dart';
import 'package:bntu_schedule/features/welcome/domain/repositories/repositories.dart';
import 'package:bntu_schedule/features/welcome/domain/usecases/set_welcome_page_viewed_use_case.dart';
import 'package:bntu_schedule/features/welcome/presentation/cubit/welcome_actions_cubit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:talker_flutter/talker_flutter.dart';

/// A global object that stores instances of other classes for
/// independent injection.
final GetIt sl = GetIt.instance;

/// A method for initializing all necessary objects.
Future<void> initializeInjection() async {
  /// ========== [External] ==========
  /// [Logging]
  sl.registerSingleton<Talker>(TalkerFlutter.init());

  /// [Firebase]
  sl.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
  sl.registerLazySingleton<FirebaseAppCheck>(() => FirebaseAppCheck.instance);
  sl.registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance);

  /// [Shared Preferences]
  sl.registerSingletonAsync<SharedPreferences>(
    SharedPreferences.getInstance,
  );

  /// [Network Info]
  sl.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImp(
      sl(),
    ),
  );

  /// [Internet Connection Checker]
  sl.registerLazySingleton<InternetConnectionChecker>(
    InternetConnectionChecker.new,
  );

  /// ========== [Router Redirects] ==========
  /// [AdminAuthenticationRedirect]
  sl.registerLazySingleton<AdminAuthenticationRedirect>(
    () => AdminAuthenticationRedirect(
      auth: sl(),
    ),
  );

  /// [GroupNumberMustBeSelected]
  sl.registerLazySingleton<GroupNumberMustBeSelected>(
    () => GroupNumberMustBeSelected(
      sharedPreferences: sl(),
    ),
  );

  /// [HasWelcomePageViewedGuard]
  sl.registerLazySingleton<HasWelcomePageViewedRedirect>(
    () => HasWelcomePageViewedRedirect(
      auth: sl(),
      sharedPreferences: sl(),
    ),
  );

  /// ========== [Data Sources] ==========
  /// [Auth]
  sl.registerLazySingleton<AdminAuthenticationRemoteDataSource>(
    () => AdminAuthenticationRemoteDataSourceImpl(
      auth: sl(),
    ),
  );

  /// [Welcome]
  sl.registerLazySingleton<WelcomeLocalDataSource>(
    () => WelcomeLocalDataSourceImpl(
      sharedPreferences: sl(),
    ),
  );

  /// ========== [Repositories] ==========
  /// [Auth]
  sl.registerLazySingleton<AdminAuthenticationRepository>(
    () => AdminAuthenticationRepositoryImpl(
      networkInfo: sl(),
      remoteDataSource: sl(),
    ),
  );

  /// [Welcome]
  sl.registerLazySingleton<WelcomeRepository>(
    () => WelcomeRepositoryImpl(
      localDataSource: sl(),
    ),
  );

  /// ========== [UseCases] ==========
  /// [Auth]
  sl.registerLazySingleton<LoginUseCase>(
    () => LoginUseCase(
      authRepository: sl(),
    ),
  );
  sl.registerLazySingleton<LogoutUseCase>(
    () => LogoutUseCase(
      authRepository: sl(),
    ),
  );

  /// [Welcome]
  sl.registerLazySingleton<SetWelcomePageViewedUseCase>(
    () => SetWelcomePageViewedUseCase(
      welcomeRepository: sl(),
    ),
  );

  /// ========== [Bloc & Cubit] ==========
  /// [Admin Login]
  sl.registerFactory<AdminAuthenticationCubit>(
    AdminAuthenticationCubit.new,
  );

  /// [Welcome]
  sl.registerFactory<WelcomeActionsCubit>(
    WelcomeActionsCubit.new,
  );
}
