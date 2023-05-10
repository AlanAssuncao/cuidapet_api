// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cuidapet_api/application/config/database_connection_configuration.dart'
    as _i5;
import 'package:cuidapet_api/application/database/i_database_connection.dart'
    as _i3;
import 'package:cuidapet_api/application/database/i_database_connection_impl.dart'
    as _i4;
import 'package:cuidapet_api/application/facades/push_notification_facade.dart'
    as _i17;
import 'package:cuidapet_api/application/logger/i_logger.dart' as _i8;
import 'package:cuidapet_api/modules/categories/controller/categories_controller.dart'
    as _i32;
import 'package:cuidapet_api/modules/categories/data/i_categories_repository.dart'
    as _i21;
import 'package:cuidapet_api/modules/categories/data/i_categories_repository_impl.dart'
    as _i22;
import 'package:cuidapet_api/modules/categories/service/i_categories_service.dart'
    as _i23;
import 'package:cuidapet_api/modules/categories/service/i_categories_service_impl.dart'
    as _i24;
import 'package:cuidapet_api/modules/chat/controller/chat_controller.dart'
    as _i33;
import 'package:cuidapet_api/modules/chat/data/i_chat_repository.dart' as _i25;
import 'package:cuidapet_api/modules/chat/data/i_chat_repository_impl.dart'
    as _i26;
import 'package:cuidapet_api/modules/chat/service/i_chat_service.dart' as _i27;
import 'package:cuidapet_api/modules/chat/service/i_chat_service_impl.dart'
    as _i28;
import 'package:cuidapet_api/modules/schedules/controller/schedule_controller.dart'
    as _i18;
import 'package:cuidapet_api/modules/schedules/data/i_schedule_repository.dart'
    as _i6;
import 'package:cuidapet_api/modules/schedules/data/i_schedule_repository_impl.dart'
    as _i7;
import 'package:cuidapet_api/modules/schedules/service/i_schedule_service.dart'
    as _i9;
import 'package:cuidapet_api/modules/schedules/service/i_schedule_service_impl.dart'
    as _i10;
import 'package:cuidapet_api/modules/supplier/controller/supplier_controller.dart'
    as _i31;
import 'package:cuidapet_api/modules/supplier/data/i_supplier_repository.dart'
    as _i11;
import 'package:cuidapet_api/modules/supplier/data/i_supplier_repository_impl.dart'
    as _i12;
import 'package:cuidapet_api/modules/supplier/service/i_supplier_service.dart'
    as _i29;
import 'package:cuidapet_api/modules/supplier/service/i_supplier_service_impl.dart'
    as _i30;
import 'package:cuidapet_api/modules/user/controller/auth_controller.dart'
    as _i20;
import 'package:cuidapet_api/modules/user/controller/user_controller.dart'
    as _i19;
import 'package:cuidapet_api/modules/user/data/i_user_repository.dart' as _i13;
import 'package:cuidapet_api/modules/user/data/i_user_repository_impl.dart'
    as _i14;
import 'package:cuidapet_api/modules/user/service/i_user_service.dart' as _i15;
import 'package:cuidapet_api/modules/user/service/i_user_service_impl.dart'
    as _i16;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  gh.lazySingleton<_i3.IDatabaseConnection>(() => _i4.IDatabaseConnectionImpl(
      configuration: gh<_i5.DatabaseConnectionConfiguration>()));
  gh.lazySingleton<_i6.IScheduleRepository>(() => _i7.IScheduleRepositoryImpl(
        connection: gh<_i3.IDatabaseConnection>(),
        log: gh<_i8.ILogger>(),
      ));
  gh.lazySingleton<_i9.IScheduleService>(() =>
      _i10.IScheduleServiceImpl(repository: gh<_i6.IScheduleRepository>()));
  gh.lazySingleton<_i11.ISupplierRepository>(() => _i12.ISupplierRepositoryImpl(
        connection: gh<_i3.IDatabaseConnection>(),
        log: gh<_i8.ILogger>(),
      ));
  gh.lazySingleton<_i13.IUserRepository>(() => _i14.IUserRepositoryImpl(
        connection: gh<_i3.IDatabaseConnection>(),
        log: gh<_i8.ILogger>(),
      ));
  gh.lazySingleton<_i15.IUserService>(() => _i16.IUserServiceImpl(
        userRepository: gh<_i13.IUserRepository>(),
        log: gh<_i8.ILogger>(),
      ));
  gh.lazySingleton<_i17.PushNotificationFacade>(
      () => _i17.PushNotificationFacade(log: gh<_i8.ILogger>()));
  gh.factory<_i18.ScheduleController>(() => _i18.ScheduleController(
        service: gh<_i9.IScheduleService>(),
        log: gh<_i8.ILogger>(),
      ));
  gh.factory<_i19.UserController>(() => _i19.UserController(
        userService: gh<_i15.IUserService>(),
        log: gh<_i8.ILogger>(),
      ));
  gh.factory<_i20.AuthController>(() => _i20.AuthController(
        userService: gh<_i15.IUserService>(),
        log: gh<_i8.ILogger>(),
      ));
  gh.lazySingleton<_i21.ICategoriesRepository>(
      () => _i22.ICategoriesRepositoryImpl(
            connection: gh<_i3.IDatabaseConnection>(),
            log: gh<_i8.ILogger>(),
          ));
  gh.lazySingleton<_i23.ICategoriesService>(() => _i24.ICategoriesServiceImpl(
      repository: gh<_i21.ICategoriesRepository>()));
  gh.lazySingleton<_i25.IChatRepository>(() => _i26.IChatRepositoryImpl(
        connection: gh<_i3.IDatabaseConnection>(),
        log: gh<_i8.ILogger>(),
      ));
  gh.lazySingleton<_i27.IChatService>(() => _i28.IChatServiceImpl(
        repository: gh<_i25.IChatRepository>(),
        pushNotificationFacade: gh<_i17.PushNotificationFacade>(),
      ));
  gh.lazySingleton<_i29.ISupplierService>(() => _i30.ISupplierServiceImpl(
        repository: gh<_i11.ISupplierRepository>(),
        userService: gh<_i15.IUserService>(),
      ));
  gh.factory<_i31.SupplierController>(() => _i31.SupplierController(
        service: gh<_i29.ISupplierService>(),
        log: gh<_i8.ILogger>(),
      ));
  gh.factory<_i32.CategoriesController>(
      () => _i32.CategoriesController(service: gh<_i23.ICategoriesService>()));
  gh.factory<_i33.ChatController>(() => _i33.ChatController(
        service: gh<_i27.IChatService>(),
        log: gh<_i8.ILogger>(),
      ));
  return getIt;
}
