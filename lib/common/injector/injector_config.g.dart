// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'injector_config.dart';

// **************************************************************************
// KiwiInjectorGenerator
// **************************************************************************

class _$InjectorConfig extends InjectorConfig {
  void _configureBlocs() {
    final KiwiContainer container = KiwiContainer();
    container.registerSingleton((c) => DashboardBloc(dashboardUsecase: c<DashboardUsecase>()));
  }

  void _configureUsecases() {
    final KiwiContainer container = KiwiContainer();
    container.registerSingleton(
            (c) => DashboardUsecase(dashboardRepository: c<DashboardRepository>()));
  }

  void _configureRepositories() {
    final KiwiContainer container = KiwiContainer();
    container.registerSingleton<DashboardRepository>((c) => DashboardRepositoryImpl(
        dashboardRemoteDatasource: c<DashboardRemoteDatasource>())
    );
  }

  void _configureRemoteDataSources() {
    final KiwiContainer container = KiwiContainer();
    container.registerSingleton(
            (c) => DashboardRemoteDatasource(httpClient: c<HttpClient>()));
  }

  void _configureCommon() {
    final KiwiContainer container = KiwiContainer();
    container.registerSingleton((c) => HttpClient.setTodoAPIhost());
  }
}