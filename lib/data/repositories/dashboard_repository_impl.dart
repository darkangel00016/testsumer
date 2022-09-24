import 'package:test_sumer/data/models/gif_model.dart';
import 'package:test_sumer/domain/repositories/dashboard_repository.dart';
import '../datasources/remote/dashboard_remote_datasource.dart';

class DashboardRepositoryImpl extends DashboardRepository {
  final DashboardRemoteDatasource dashboardRemoteDatasource;

  DashboardRepositoryImpl({
    required this.dashboardRemoteDatasource
  });

  @override
  Future<List<GifModel>> getAll() async {
    return await dashboardRemoteDatasource.getAll();
  }

  @override
  Future<List<GifModel>> search(String query) async {
    return await dashboardRemoteDatasource.search(query);
  }

}