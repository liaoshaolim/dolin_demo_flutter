import 'package:dolin_demo_flutter/modules/douban/home/data/model.dart';
import 'package:flutter/material.dart';
import 'data/req.dart';

class DoubanDetail extends StatefulWidget {
  const DoubanDetail({Key key}) : super(key: key);

  @override
  _DoubanDetailState createState() => _DoubanDetailState();
}

class _DoubanDetailState extends State<DoubanDetail> {
  Model _model;

  void _req() async {
    final data = await DouBanDetailReq().data(movieId: 25924056);
    // TODO：获取 model 更新页面
    _model = Model.fromJson(data);
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _req();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('${_model?.subjects ?? []}'),
    );
  }
}
