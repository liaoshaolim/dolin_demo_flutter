import 'package:dio/dio.dart';
import 'package:dolin_demo_flutter/util/dio_util.dart';

/// 请求类型
enum ReqType { GET, POST }

class Req {
  String url() => null;

  Map<String, dynamic> params() => {};

  String encodeData() => null;

  CancelToken cancelToken;

  Future<dynamic> get() async {
    return _req(
      url: url(),
      reqType: ReqType.GET,
      params: params(),
    );
  }

  Future<dynamic> post() async {
    return _req(
      url: url(),
      reqType: ReqType.POST,
      params: params(),
    );
  }

  Future _req(
      {String url,
      ReqType reqType,
      Map params,
      FormData formData,
      ProgressCallback progressCallback}) async {
    print('req url 😀😀😀 :\n $url');
    int statusCode;
    Response res;
    try {
      if (reqType == ReqType.GET) {
        if (params != null && params.isNotEmpty) {
          res = await DioUtil.instance
              .getDio()
              .get(url, queryParameters: params, cancelToken: cancelToken);
        } else {
          res = await DioUtil.instance
              .getDio()
              .get(url, cancelToken: cancelToken);
        }
      } else if (reqType == ReqType.POST) {
        if (params != null && params.isNotEmpty) {
          res = await DioUtil.instance.getDio().post(url,
              queryParameters: params,
              data: formData,
              // onSendProgress: progressCallBack,
              cancelToken: cancelToken);
        } else {
          res = await DioUtil.instance
              .getDio()
              .post(url, data: encodeData(), cancelToken: cancelToken);
        }
      }
    } catch (e) {
      // TODO: 异常处理
    }

    statusCode = res.statusCode;
    if (res != null && statusCode == 200) {
      print('res:😀😀😀');
      print(res.data);
      return res.data;
    }
  }
}
