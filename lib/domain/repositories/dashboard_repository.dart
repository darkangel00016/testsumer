import '../entities/gif_entity.dart';

abstract class DashboardRepository {

  Future<List<GifEntity>> getAll();

  Future<List<GifEntity>> search(String query);

}