import 'package:dio/dio.dart';

import '/app/network/dio_provider.dart';

class DioRequestRetrier {
  final Dio dioClient = DioProvider.tokenClient;
  final RequestOptions requestOptions;
  final String token; // ⬅️ Injected token

  DioRequestRetrier({
    required this.requestOptions,
    required this.token,
  });

  Future<Response<T>> retry<T>() async {
    final headers = getCustomHeaders();

    return await dioClient.request<T>(
      requestOptions.path,
      cancelToken: requestOptions.cancelToken,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      onReceiveProgress: requestOptions.onReceiveProgress,
      onSendProgress: requestOptions.onSendProgress,
      options: Options(
        headers: headers,
        method: requestOptions.method,
      ),
    );
  }

  Map<String, String> getCustomHeaders() {
    final customHeaders = {'content-type': 'application/json'};

    if (token.trim().isNotEmpty) {
      customHeaders['Authorization'] = 'Bearer $token';
    }

    return customHeaders;
  }
}
