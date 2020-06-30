import 'dart:async';

import 'package:dolin_demo_flutter/modules/theme_select.dart';
import 'package:dolin_demo_flutter/util/event_bus.dart';
import 'package:dolin_demo_flutter/widgets/tabbar.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'config/constants.dart';

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
    final SharedPreferences sp = await SharedPreferences.getInstance();
    String colorStr = sp.getString(colorKey);
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
      supportedLocales: const [Locale('zh', 'CH'), Locale('en', 'US')],
      builder: (context, child) {
        /// 保证文字大小不受手机系统设置影响 https://www.kikt.top/posts/flutter/layout/dynamic-text/
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: child,
        );
      },
      routes: {
        '/': (context) => const DLTabbar(),
        'theme_select': (context) => const ThemeSelectPage()
      },
      initialRoute: '/',
    );
  }
}
