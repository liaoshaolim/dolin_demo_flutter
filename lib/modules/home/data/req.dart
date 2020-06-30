import 'package:dolin_demo_flutter/config/api.dart';
import 'package:dolin_demo_flutter/http/req.dart';

class DouBan250Req extends Req {
  int start = 0;
  int count = 10;

  @override
  String url() => API.douban250;

  @override
  Map<String, dynamic> params() => {
        'apikey': '0df993c66c0c636e29ecbb5344252a4a',
        'start': '$start',
        'count': '$count'
      };

  Future data({int start, int count}) {
    this.start = start;
    this.count = count;
    return get();
  }
}
