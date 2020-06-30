import 'package:dio/dio.dart';

class DioUtil {
  DioUtil._internal() {
    var options = BaseOptions(
      connectTimeout: 10 * 1000,
      receiveTimeout: 10 * 1000,
      //responseType: ResponseType.plain,
      headers: {
        'content-type': 'application/json',
      },
      validateStatus: (status) {
        // 不使用 http 状态码判断状态，使用 AdapterInterceptor 来处理（适用于标准REST风格）
        return true;
      },
      // baseUrl: API.reqUrl,
//      contentType: ContentType('application', 'x-www-form-urlencoded', charset: 'utf-8'),
    );
    _dio = Dio(options);
    _dio.interceptors.add(AuthInterceptor());
  }

  factory DioUtil() {
    return _singleton;
  }

  static Dio _dio;

  static final DioUtil _singleton = DioUtil._internal();

  static DioUtil get instance => DioUtil();

  Dio getDio() {
    return _dio;
  }
}

class AuthInterceptor extends Interceptor {
  @override
  onRequest(RequestOptions options) {
    // options.headers['Authorization'] = 'token'; //UserInfoData.instance.token;
    return super.onRequest(options);
  }
}
