import 'package:flutter/material.dart';

import 'package:hello_ui_fkit/hello_ui_fkit.dart';

class UnknowPage extends StatelessWidget {
  const UnknowPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HLAppBar(
        'UnknowPage',
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      body: const Center(
        child: Text('Unknown Route'),
      ),
    );
  }
}
