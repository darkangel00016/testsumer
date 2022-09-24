import '../entities/gif_entity.dart';
import '../repositories/dashboard_repository.dart';

class DashboardUsecase {

  final DashboardRepository dashboardRepository;

  DashboardUsecase({required this.dashboardRepository});

  Future<List<GifEntity>> getAll() async =>
      dashboardRepository.getAll();

  Future<List<GifEntity>> search(String query) async =>
      dashboardRepository.search(query);

}