/*
 * @Author: shaolin 
 * @Date: 2020-07-02 17:17:25 
 * @Last Modified by: shaolin
 * @Last Modified time: 2020-07-02 17:33:29
 */
import 'package:flutter/material.dart';

class HorizontalLine extends StatelessWidget {
  const HorizontalLine({Key key, this.indent = 10, this.endIndent = 10})
      : super(key: key);

  final double indent;
  final double endIndent;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      color: Theme.of(context).primaryColor,
      margin: EdgeInsets.only(left: indent, right: endIndent),
    );
  }
}
