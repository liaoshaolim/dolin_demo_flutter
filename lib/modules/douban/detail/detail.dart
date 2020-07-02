import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'data/model.dart';
import 'data/req.dart';

class DoubanDetail extends StatefulWidget {
  const DoubanDetail({Key key, this.movieId}) : super(key: key);
  final String movieId;

  @override
  _DoubanDetailState createState() => _DoubanDetailState();
}

class _DoubanDetailState extends State<DoubanDetail> {
  Model _model;

  void _req() async {
    final data = await DouBanDetailReq().data(movieId: widget?.movieId ?? '');

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
      backgroundColor: const Color(0xFF65594F),
      appBar: AppBar(
        title: const Text(
          '电影',
        ),
        backgroundColor: const Color(0xFF65594F),
        elevation: 0,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _Header(
                model: _model,
                heroTag: widget.movieId,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                '剧情简介',
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.normal),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                '${_model?.summary ?? 'xxx'}',
                // maxLines: 4,
                // overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.normal),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                '演职员',
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.normal),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                  width: double.infinity,
                  height: 165,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (context, index) => const SizedBox(
                      width: 10,
                    ),
                    itemBuilder: (context, index) {
                      final Casts obj = _model.casts[index];
                      return _CastItem(
                        imgUrl: obj?.avatars?.small ?? '',
                        name: obj?.name ?? '',
                      );
                    },
                    itemCount: _model?.casts?.length ?? 0,
                  )),
            ],
          ),
        ),
      )),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({Key key, this.model, this.heroTag}) : super(key: key);
  final Model model;
  final String heroTag;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 170,
      child: Row(
        children: <Widget>[
          Hero(
            tag: heroTag,
            transitionOnUserGestures: true,
            child: Container(
              width: 100,
              height: 170,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(2)),
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl: '${model?.images?.medium ?? ''}',
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
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '${model?.title ?? '-'}',
                  style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  '${model?.originalTitle ?? '-'}',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  '${model?.tags?.toString() ?? '-'}',
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFFA9A49F),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// 演员阵容 Item
class _CastItem extends StatelessWidget {
  const _CastItem({Key key, this.imgUrl, this.name, this.title})
      : super(key: key);
  final String imgUrl;
  final String name;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      child: Column(
        children: <Widget>[
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(2)),
            child: CachedNetworkImage(
              fit: BoxFit.cover,
              imageUrl: '$imgUrl',
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
          const SizedBox(
            height: 5,
          ),
          Text(
            '$name',
            maxLines: 1,
            style: TextStyle(
                fontSize: 12,
                color: Colors.white,
                fontWeight: FontWeight.normal),
          ),
        ],
      ),
    );
  }
}
