import 'package:dio/dio.dart';
import 'dio.logger.dart';

class BaseDio {
  // khởi tạo biến
  Dio? _instance;

  //method for getting dio instance
  Dio dio() {
    _instance = createDioInstance();
    return _instance!;
  }

  Dio createDioInstance() {
    late Dio dio;
    const token = 'ea317aea527e67eafd289951f474fd0cd26aed3f';
    if (token == null) {
      dio = Dio(
        BaseOptions(
          headers: {
            'Content-Type': 'application/json',
            'accept': 'application/json',
          },
        ),
      );
    } else {
      dio = Dio(
        BaseOptions(
          baseUrl: 'https://api.kafa.pro',
          headers: {
            'authorization': 'Token $token',
            'content-Type': 'application/json',
            'accept': 'application/json',
          },
        ),
      );
    }

    print(token);

    // (dio.httpClientAdapter as HttpClientAdapter).createHttpClient = () =>
    //   HttpClient()
    //     ..badCertificateCallback =
    //         (X509Certificate cert, String host, int port) => true;

    // dio.options.connectTimeout = 5;
    // dio.options.receiveTimeout = 5;
    dio.interceptors.clear();
    dio.interceptors.addAll([
      InterceptorsWrapper(
        onRequest: (options, handler) {
          // print(AppSharedPreference.instance.getValue(PrefKeys.TOKEN));
          // print(AppSharedPreference.instance.getValue(PrefKeys.TOKEN_REFRESH));
          return handler.next(options);
        },
        onResponse: (response, handler) {
          //on success it is getting called here
          return handler.next(response);
        },
        onError: (error, handler) async {
          if (error.response?.statusCode == 401 ||
              error.response?.statusCode == 403) {
                print(error.response?.statusCode);
            final accessToken = await _getNewToken();

            // Cập nhật token trong bộ nhớ đệm
            _saveTokenToStorage(accessToken);

            // Thử lại yêu cầu gốc
            final RequestOptions requestOptions = error.requestOptions;
            final opts = Options(method: requestOptions.method);
            dio.options.headers['Authorization'] = 'Bearer $accessToken';
            dio.options.headers['Accept'] = '*/*';
            final response = await dio.request(
              requestOptions.path,
              options: opts,
              cancelToken: requestOptions.cancelToken,
              onReceiveProgress: requestOptions.onReceiveProgress,
              data: requestOptions.data,
              queryParameters: requestOptions.queryParameters,
            );
            handler.resolve(response);
          } else {
            handler.next(error);
          }
        },
      ),
      PrettyDioLogger(requestBody: true)
    ]);
    return dio;
  }

  Future<String> _getNewToken() async {
    const refreshToken = 'ss';
    try {
      final payload = {
        'refresh': refreshToken
      };
      final res = await Dio(
        BaseOptions(
          baseUrl: 'https://api.kafa.pro',
          headers: {
            'Content-Type': 'application/json',
            'accept': 'application/json',
          },
        ),
      ).post(refreshToken, data: payload);
      return res.data['access'];
    } catch (e) {
      throw Exception('err : $e');
    }
  }

  void _saveTokenToStorage(String token) {
    // AppSharedPreference.instance.setValue(PrefKeys.token, token);
  }
}
