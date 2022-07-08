import 'package:dio/dio.dart';
import 'package:live_streaming/res/strings.dart';

class MUXClient {

  Dio _dio = Dio();

  /// the API server
  initializeDio() {
    BaseOptions options = BaseOptions(
      baseUrl: muxServerUrl,
      connectTimeout: 8000,
      receiveTimeout: 5000,
      headers: {
        "Content-Type": contentType, // application/json
      },
    );
    _dio = Dio(options);
  }

}