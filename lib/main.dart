/*
 * @Author: shaolin 
 * @Date: 2020-07-02 17:17:35 
 * @Last Modified by:   shaolin 
 * @Last Modified time: 2020-07-02 17:17:35 
 */
import 'dart:async';

import 'package:dolin_demo_flutter/modules/mine/tab_bar.dart';
import 'package:dolin_demo_flutter/modules/mine/theme_select.dart';
import 'package:dolin_demo_flutter/util/event_bus.dart';
import 'package:dolin_demo_flutter/widgets/tabbar.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'config/constants.dart';
import 'modules/douban/detail/detail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Color _primaryColor;
  // 订阅者
  StreamSubscription _colorSubscription;

  Future<String> _getCacheColor(String colorKey) async {
    // ignore: omit_local_variable_types
    final SharedPreferences sp = await SharedPreferences.getInstance();
    var colorStr = sp.getString(colorKey);
    // ignore: prefer_conditional_assignment
    if (colorStr == null) {
      colorStr = 'green';
    }
    return colorStr;
  }

  // ignore: avoid_void_async
  void _setThemeColor() async {
    final cacheColorStr = await _getCacheColor('themeColorStr');
    if (mounted) {
      setState(() {
        _primaryColor = themeColorMap[cacheColorStr];
      });
    }
  }

  // ignore: avoid_void_async
  void _cacheColor(String colorStr) async {
    // ignore: omit_local_variable_types
    final SharedPreferences sp = await SharedPreferences.getInstance();
    await sp.setString('themeColorStr', colorStr);
  }

  @override
  void initState() {
    super.initState();
    _setThemeColor();
    // 订阅 eventbus
    _colorSubscription = eventBus.on<ThemeColorEvent>().listen((event) {
      // 缓存主题色
      _cacheColor(event.colorStr);
      // ignore: omit_local_variable_types
      final Color color = themeColorMap[event.colorStr];
      setState(() {
        _primaryColor = color;
      });
    });
  }

  @override
  void dispose() {
    // 取消订阅
    _colorSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'dolin_demo',
      theme: ThemeData(
        // 凯尔特人绿（ToolBar、Tabbar 背景色）
        primaryColor: _primaryColor,
        // 分割线颜色
        dividerColor: Colors.black, //const Color(0xFFEEEEEE),
        // scaffold 背景色
        scaffoldBackgroundColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // TODO：国际化，暂时注释掉，启动有短暂红屏 2020年07月03日
      // supportedLocales: const [Locale('zh', 'CH'), Locale('en', 'US')],
      builder: (context, child) {
        /// 保证文字大小不受手机系统设置影响 https://www.kikt.top/posts/flutter/layout/dynamic-text/
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: child,
        );
      },
      routes: {
        '/': (context) => const DLTabbar(),
        'theme_select': (context) => const ThemeSelectPage(),
        'douban_detail': (context) => const DoubanDetail(),
        'tab_bar_page': (context) => const TabBarPage()
      },
      initialRoute: '/',
    );
  }
}
