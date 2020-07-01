import 'package:dolin_demo_flutter/config/api.dart';
import 'package:dolin_demo_flutter/http/req.dart';

class DouBanDetailReq extends Req {
  int movieId;

  @override
  String url() => '${API.doubanDetail}$movieId';

  @override
  Map<String, dynamic> params() => {
        'apikey': '0df993c66c0c636e29ecbb5344252a4a',
      };

  Future data({int movieId}) {
    this.movieId = movieId;
    return get();
  }
}
