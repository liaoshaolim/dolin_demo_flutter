import 'package:dolin_demo_flutter/config/constants.dart';
import 'package:dolin_demo_flutter/util/event_bus.dart';
import 'package:flutter/material.dart';

import 'package:hello_ui_fkit/hello_ui_fkit.dart';

class ThemeSelectPage extends StatefulWidget {
  const ThemeSelectPage({Key key}) : super(key: key);

  @override
  _ThemeSelectPageState createState() => _ThemeSelectPageState();
}

class _ThemeSelectPageState extends State<ThemeSelectPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HLAppBar(
        '主题颜色',
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      body: GridView.builder(
        primary: false,
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 1,
        ),
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            eventBus.fire(ThemeColorEvent(themeColorMap.keys.toList()[index]));
            Navigator.pop(context);
          },
          child: Container(
            color: themeColorMap[themeColorMap.keys.toList()[index]],
          ),
        ),
        itemCount: themeColorMap.keys.length,
      ),
    );
  }
}
