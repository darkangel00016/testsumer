import 'package:kiwi/kiwi.dart';
import '../../data/datasources/remote/dashboard_remote_datasource.dart';
import '../../data/repositories/dashboard_repository_impl.dart';
import '../../domain/repositories/dashboard_repository.dart';
import '../../domain/usescases/dashboard_usecase.dart';
import '../../presentation/gifs_trending/dashboard/bloc/dashboard_bloc.dart';
import '../http/http_client.dart';

part 'injector_config.g.dart';

class InjectorConfig {

  static late KiwiContainer container;

  static void setup() {
    container = KiwiContainer();
    InjectorConfig()._configure();
  }

  static final resolve = container.resolve;

  void _configure() {
    _configureCommon();
    _configureRemoteDataSources();
    _configureRepositories();
    _configureUsecases();
    _configureBlocs();
  }

  // ============ COMMON ============
  void _configureCommon() {
    container.registerSingleton((container) => HttpClient.setTodoAPIhost());
  }

  // ============ REMOTE DATASOURCES ============
  void _configureRemoteDataSources() {
    container.registerSingleton((container) => DashboardRemoteDatasource(httpClient: container<HttpClient>()));
  }

  // ============ REPOSITORIES ============
  void _configureRepositories() {
    container.registerSingleton<DashboardRepository>((container) => DashboardRepositoryImpl(dashboardRemoteDatasource: container<DashboardRemoteDatasource>()));
  }

  // ============ USECASES ============
  void _configureUsecases() {
    container.registerSingleton((container) => DashboardUsecase(dashboardRepository: container<DashboardRepository>()));
  }

  // ============ BLOCS ============
  void _configureBlocs() {
    container.registerSingleton((container) => DashboardBloc(dashboardUsecase: container.resolve<DashboardUsecase>()), );
  }
}