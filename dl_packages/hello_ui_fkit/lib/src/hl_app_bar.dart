import 'package:flutter/material.dart';
import 'package:rent_icons/rent_icons.dart';

class HLAppBar extends AppBar {
  HLAppBar(this.pageTitle,
      {Key key,
      this.isHasReturn = true,
      this.onPressed,
      this.elevation = 0.5,
      PreferredSizeWidget bottom,
      List<Widget> actions})
      : assert(pageTitle != null, 'pageTitle must not be null'),
        super(
          key: key,
          title: Text(
            pageTitle,
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
          centerTitle: true,
          // backgroundColor: const Color(0xffffffff),
          brightness: Brightness.light,
          elevation: elevation,
          leading: Offstage(
            offstage: !isHasReturn,
            child: IconButton(
                icon: const Icon(
                  HRentIcons.arrow_back_fillet,
                  // color: Colors.black,
                  size: 16,
                ),
                onPressed: onPressed),
          ),
          bottom: bottom,
          actions: actions,
        );

  final String pageTitle;
  final bool isHasReturn;
  final VoidCallback onPressed;
  final double elevation;
}
