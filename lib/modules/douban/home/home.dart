import 'package:cached_network_image/cached_network_image.dart';
import 'package:dolin_demo_flutter/modules/douban/detail/detail.dart';
import 'package:dolin_demo_flutter/modules/douban/home/data/model.dart';
import 'package:dolin_demo_flutter/modules/douban/home/data/req.dart';
import 'package:dolin_demo_flutter/util/refresh_util.dart';
import 'package:dolin_demo_flutter/widgets/horizontal_line.dart';
import 'package:dolin_demo_flutter/widgets/refresh_header_footer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'package:hello_ui_fkit/hello_ui_fkit.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  final RefreshController _refreshController =
      RefreshController(initialRefresh: true);
  bool _isCanPullUp = true;
  Model _model;
  final List<Subject> _subjects = [];

  Future _req(bool isRefresh) async {
    final start = isRefresh || _subjects == null || _subjects.isEmpty
        ? 0
        : _subjects.length;
    final data = await DouBan250Req().data(start: start, count: 10);
    _model = Model.fromJson(data);
    loadStatus(DataStatus.success, isRefresh: isRefresh);

    if (isRefresh) {
      _subjects.clear();
    }
    _subjects.addAll(_model?.subjects ?? []);
    _isCanPullUp = (_model?.total ?? 0) > _subjects.length;

    if (mounted) {
      setState(() {});
    }
  }

  /// 处理 refreshController 状态
  void loadStatus(DataStatus status, {bool isRefresh = true}) {
    if (!mounted) {
      return;
    }
    RefreshUtil.loadStatus(status, _refreshController, isRefresh: isRefresh);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      appBar: HLAppBar(
        _model?.title ?? '首页',
        isHasReturn: false,
      ),
      body: SmartRefresher(
        controller: _refreshController,
        enablePullDown: true,
        enablePullUp: _isCanPullUp,
        header: const RefreshHeader(),
        footer: const RefreshFooter(),
        onRefresh: () {
          _req(true);
        },
        onLoading: () {
          _req(false);
        },
        child: ListView.separated(
            itemBuilder: (context, index) {
              return _Item(subject: _subjects[index]);
            },
            separatorBuilder: (context, index) {
              return const HorizontalLine();
            },
            itemCount: _subjects?.length ?? 0),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class _Item extends StatelessWidget {
  const _Item({Key key, this.subject}) : super(key: key);
  final Subject subject;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext context) {
          return DoubanDetail(movieId: subject.id);
        }));
      },
      child: Container(
        width: double.infinity,
        height: 170,
        padding: const EdgeInsets.all(10),
        child: Row(
          children: <Widget>[
            Container(
              width: 100,
              height: 150,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(2)),
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl: '${subject?.images?.medium ?? ''}',
                  placeholder: (context, url) => const Center(
                    child: SizedBox(
                      width: 50,
                      height: 50,
                      child: CircularProgressIndicator(),
                    ),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    '${subject?.title ?? '-'}/${subject?.originalTitle ?? '-'}',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    '导演：${subject?.directors?.isEmpty ?? true ? '-' : subject?.directors[0].name} / ${subject?.directors?.isEmpty ?? true ? '-' : subject?.directors[0].nameEn}',
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    // ignore: lines_longer_than_80_chars
                    '主演：${subject?.casts?.isEmpty ?? true ? '-' : subject?.casts[0].name}',
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    '评分：${subject?.rating?.average ?? ''}',
                    style: TextStyle(
                        fontSize: 15,
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
