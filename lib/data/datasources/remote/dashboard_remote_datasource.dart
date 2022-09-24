import '../../../common/http/http_client.dart';
import '../../models/gif_model.dart';
import 'constants/dashboard_remote_datasource_constants.dart';

class DashboardRemoteDatasource {
  late final HttpClient httpClient;
  DashboardRemoteDatasource({required this.httpClient});

  Future<List<GifModel>> getAll() async {
    final List<dynamic> data =
    await httpClient.get(DashboardEndpoints.getListPath);
    return GifModel.fromJsonResponse(data);
  }

  Future<List<GifModel>> search(String query) async {
    final List<dynamic> data =
    await httpClient.get(DashboardEndpoints.getSearchPath, parameters: { "q": query });
    return GifModel.fromJsonResponse(data);
  }

}