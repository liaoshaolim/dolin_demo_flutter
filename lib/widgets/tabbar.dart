import 'package:dolin_demo_flutter/modules/douban/home/home.dart';
import 'package:dolin_demo_flutter/modules/mine.dart';
import 'package:flutter/material.dart';

typedef TapItemCallback = void Function(int index);

class DLTabbar extends StatefulWidget {
  const DLTabbar({Key key}) : super(key: key);

  @override
  _DLTabbarState createState() => _DLTabbarState();
}

class _DLTabbarState extends State<DLTabbar> {
  int _currentIndex = 0;
  final PageController _pageController = PageController(initialPage: 0);

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: _pageChanged,
        children: const <Widget>[
          HomePage(),
          MinePage(),
        ],
      ),
      bottomNavigationBar: BottomSafeBar(
        selIndex: _currentIndex,
        tapItem: _pageChanged,
      ),
    );
  }

  void _pageChanged(int index) {
    _pageController.jumpToPage(index);
    if (mounted) {
      setState(() {
        _currentIndex = index;
      });
    }
  }
}

class BottomSafeBar extends StatelessWidget {
  const BottomSafeBar({Key key, this.selIndex, this.tapItem}) : super(key: key);
  final int selIndex;
  final TapItemCallback tapItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: SafeArea(
        child: BottomAppBar(
          elevation: 0,
          child: Container(
            color: Theme.of(context).primaryColor,
            height: 50,
            child: BottomBar(
              selectIndex: selIndex,
              tapItem: tapItem,
            ),
          ),
        ),
      ),
    );
  }
}

class BottomBar extends StatefulWidget {
  const BottomBar({Key key, this.selectIndex, this.tapItem}) : super(key: key);

  final int selectIndex;
  final TapItemCallback tapItem;

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  List<bool> selected = <bool>[];

  @override
  Widget build(BuildContext context) {
    final rpx = MediaQuery.of(context).size.width / 375;
    selected.clear();
    for (var i = 0; i < 2; i++) {
      selected.add(false);
    }
    selected[widget.selectIndex] = true;

    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Expanded(
              flex: 1,
              child: getBtmTextWidget(
                  title: '首页',
                  isSelected: selected[0],
                  tapFunc: () {
                    widget.tapItem(0);
                  },
                  rpx: rpx)),
          Expanded(
              flex: 1,
              child: getBtmTextWidget(
                  title: '我的',
                  isSelected: selected[1],
                  tapFunc: () {
                    widget.tapItem(1);
                  },
                  rpx: rpx)),
        ],
      ),
    );
  }

  Widget getBtmTextWidget(
      {String title, bool isSelected, VoidCallback tapFunc, double rpx}) {
    return InkWell(
        onTap: tapFunc,
        child: Text('$title',
            textAlign: TextAlign.center,
            style: isSelected
                ? TextStyle(
                    fontSize: 18 * rpx,
                    color: Colors.white,
                    fontWeight: FontWeight.w900)
                : TextStyle(
                    fontSize: 15 * rpx,
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w900)));
  }
}
