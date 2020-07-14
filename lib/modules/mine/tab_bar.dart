import 'package:dolin_demo_flutter/dart_study/mei_tuan.dart';
import 'package:dolin_demo_flutter/widgets/tab_bar_boost.dart';
import 'package:flutter/material.dart';
import 'package:hello_ui_fkit/hello_ui_fkit.dart';

class TabBarPage extends StatefulWidget {
  const TabBarPage({Key key}) : super(key: key);

  @override
  _TabBarPageState createState() => _TabBarPageState();
}

class _TabBarPageState extends State<TabBarPage> with TickerProviderStateMixin {
  TabController _tabController;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      initialIndex: 1,
      length: 6,
      vsync: this,
    );
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController?.dispose();
    _pageController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // 两种方式对比
    ShoppingCart.withCode(name: '张三', code: '123456')
      ..bookings = [Item('苹果', 10.0), Item('鸭梨', 20.0)]
      ..printInfo();

    ShoppingCart sc2 = ShoppingCart(name: '李四');
    sc2.bookings = [Item('香蕉', 15.0), Item('西瓜', 40.0)];
    print(sc2.getInfo());

    return Scaffold(
      appBar: HLAppBar('tab_bar_study'),
      body: Column(
        children: <Widget>[
          TabBar(
            onTap: (index) {
              _pageController.jumpToPage(index);
            },
            controller: _tabController,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorColor: Theme.of(context).primaryColor,
            labelColor: Theme.of(context).primaryColor,
            labelStyle: const TextStyle(fontSize: 32),
            isScrollable: true,
            unselectedLabelColor: Colors.black,
            tabs: <Widget>[
              Tab(icon: Icon(Icons.plus_one), text: '1111111'),
              const Text('222'),
              // Tab(icon: Icon(Icons.add), text: '222'),
              Tab(icon: Icon(Icons.add), text: '333'),
              Tab(icon: Icon(Icons.add), text: '444'),
              Tab(icon: Icon(Icons.add), text: '555'),
              Tab(icon: Icon(Icons.add), text: '666'),
            ],
          ),
          Expanded(
              child: TabBarBoost(
            tabController: _tabController,
            pageController: _pageController,
            tabChange: (index) {
              print('$index 😀');
            },
            children: const <Widget>[
              Page(msg: '111'),
              Page(msg: '222'),
              Page(msg: '333'),
              Page(msg: '444'),
              Page(msg: '555'),
              Page(msg: '666')
            ],
          ))
        ],
      ),
    );
  }
}

class Page extends StatefulWidget {
  const Page({Key key, this.msg}) : super(key: key);
  final String msg;

  @override
  _PageState createState() => _PageState();
}

class _PageState extends State<Page> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('${widget.msg}'),
    );
  }
}
