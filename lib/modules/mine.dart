import 'package:dolin_demo_flutter/widgets/horizontal_line.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class MinePage extends StatefulWidget {
  const MinePage({Key key}) : super(key: key);

  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const _Header(),
              const SizedBox(
                height: 30,
              ),
              const HorizontalLine(),
              _Item(
                title: '主题',
                onTapItem: () {
                  Navigator.pushNamed(context, 'theme_select');
                },
              ),
              const HorizontalLine(),
              _Item(
                title: 'TODO',
                onTapItem: () {
                  // Navigator.pushNamed(context, 'theme_select');
                },
              ),
              const HorizontalLine(),
            ],
          ),
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      child: Row(
        children: <Widget>[
          Image.asset(
            'assets/imgs/dolin.jpeg',
            width: 100,
            height: 100,
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Shimmer.fromColors(
                  baseColor: Colors.black,
                  highlightColor: Colors.green,
                  child: Text(
                    'Dolin',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  'GitHub:',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Item extends StatelessWidget {
  const _Item({Key key, this.title = '', this.onTapItem}) : super(key: key);
  final String title;
  final VoidCallback onTapItem;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapItem,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        height: 44,
        child: Row(
          children: <Widget>[
            Expanded(
              child: Text(
                '$title',
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 12,
              color: Theme.of(context).primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
