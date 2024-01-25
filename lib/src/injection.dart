import 'package:bntu_schedule/src/core/network/network_info.dart';
import 'package:bntu_schedule/src/core/router/guards.dart';
import 'package:bntu_schedule/src/data/datasources/datasources.dart';
import 'package:bntu_schedule/src/data/repositories/repositories.dart';
import 'package:bntu_schedule/src/domain/repositories/repositories.dart';
import 'package:bntu_schedule/src/domain/usecases/usecases.dart';
import 'package:bntu_schedule/src/presentations/select-group/bloc/select_group_bloc.dart';
import 'package:bntu_schedule/src/presentations/settings/bloc/settings_bloc.dart';
import 'package:bntu_schedule/src/presentations/welcome/cubit/welcome_actions_cubit.dart';
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

  /// [Router Guards]
  sl.registerLazySingleton<GroupMustBeSelectedGuard>(
    () => GroupMustBeSelectedGuard(
      sharedPreferences: sl(),
    ),
  );

  sl.registerLazySingleton<HasWelcomePageViewedGuard>(
    () => HasWelcomePageViewedGuard(
      sharedPreferences: sl(),
    ),
  );

  /// ========== [Data Sources] ==========
  /// [Group]
  sl.registerLazySingleton<GroupRemoteDataSource>(
    () => GroupRemoteDataSourceImpl(
      firestore: sl(),
    ),
  );

  sl.registerLazySingleton<GroupLocalDataSource>(
    () => GroupLocalDataSourceImpl(
      sharedPreferences: sl(),
    ),
  );

  /// [Welcome]
  sl.registerLazySingleton<WelcomeLocalDataSource>(
    () => WelcomeLocalDataSourceImpl(
      sharedPreferences: sl(),
    ),
  );

  /// ========== [Repositories] ==========
  /// [Group]
  sl.registerLazySingleton<GroupRepository>(
    () => GroupRepositoryImpl(
      remoteDataSource: sl(),
      localDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  /// [Welcome]
  sl.registerLazySingleton<WelcomeRepository>(
    () => WelcomeRepositoryImpl(
      localDataSource: sl(),
    ),
  );

  /// ========== [UseCases] ==========
  /// [Select Group]
  sl.registerLazySingleton<GetAllGroupsNumberUseCase>(
    () => GetAllGroupsNumberUseCase(
      groupRepository: sl(),
    ),
  );

  sl.registerLazySingleton<SetGroupNumberUseCase>(
    () => SetGroupNumberUseCase(
      groupRepository: sl(),
    ),
  );

  /// [Settings]
  sl.registerLazySingleton<RemoveSelectedGroupUseCase>(
    () => RemoveSelectedGroupUseCase(
      groupRepository: sl(),
    ),
  );

  /// [Welcome]
  sl.registerLazySingleton<SetWelcomePageViewedUseCase>(
    () => SetWelcomePageViewedUseCase(
      welcomeRepository: sl(),
    ),
  );

  /// ========== [Bloc & Cubit] ==========
  /// [SelectGroup]
  sl.registerFactory<SelectGroupBloc>(
    SelectGroupBloc.new,
  );

  /// [Settings]
  sl.registerFactory<SettingsBloc>(
    SettingsBloc.new,
  );

  /// [Welcome]
  sl.registerFactory<WelcomeActionsCubit>(
    WelcomeActionsCubit.new,
  );
}
