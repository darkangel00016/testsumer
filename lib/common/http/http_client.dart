import 'dart:convert';
import 'package:http/http.dart';
import '../config/configuration.dart';
import '../constants/http_constants.dart';
import '../utils/http_utils.dart';

class HttpClient {
  Client client;
  String host;
  Map<String, String>? header;

  HttpClient({
    required this.host,
    required this.client,
  });

  factory HttpClient.setTodoAPIhost() => HttpClient(host: Configuration.host, client: Client());

  Uri _getParsedUrl(String path) {
    return Uri.parse('$host$path');
  }

  Map<String, String> _generateAuthorizationHeader() => {
    HttpConstants.contentType: HttpConstants.jsonContentType
  };

  Map<String, String> _generateRequestHeader([
    Map<String, String> overrideHeader = const {},
  ]) =>
      {
        ..._generateAuthorizationHeader(),
        ...overrideHeader,
      };

  dynamic get(String path, { Map<String, String>? parameters }) async {
    final requestHeader = _generateRequestHeader();
    var uri = _getParsedUrl(path);
    Map<String, String> _parameters = {};
    if (parameters != null) {
      _parameters.addAll(parameters);
    }
    _parameters.putIfAbsent("api_key", () => HttpConstants.apiKey);
    uri = uri.replace(queryParameters: _parameters);
    final Response response = await client.get(
      uri,
      headers: requestHeader,
    );

    return HttpUtil.getResponse(
      response,
    );
  }

  dynamic post(String path, dynamic data) async {
    final requestHeader = _generateRequestHeader();

    final Response response = await client.post(
      _getParsedUrl(path),
      body: HttpUtil.encodeRequestBody(
          data, requestHeader[HttpConstants.contentType]!),
      headers: requestHeader,
    );

    return HttpUtil.getResponse(
      response,
    );
  }

  dynamic patch(String path, dynamic data) async {
    final requestHeader = _generateRequestHeader();

    final Response response = await client.patch(
      _getParsedUrl(path),
      body: HttpUtil.encodeRequestBody(
          data, requestHeader[HttpConstants.contentType]!),
      headers: requestHeader,
    );

    return HttpUtil.getResponse(
      response,
    );
  }

  dynamic put(String path, dynamic data) async {
    final requestHeader = _generateRequestHeader();

    final Response response = await client.put(
      _getParsedUrl(path),
      body: json.encode(data),
      headers: requestHeader,
    );

    return HttpUtil.getResponse(
      response,
    );
  }

  dynamic delete(String path) async {
    final requestHeader = _generateRequestHeader();

    final Response response = await client.delete(
      _getParsedUrl(path),
      headers: requestHeader,
    );

    return HttpUtil.getResponse(response);
  }

}