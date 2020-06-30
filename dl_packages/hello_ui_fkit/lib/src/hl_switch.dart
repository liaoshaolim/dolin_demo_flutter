/*
 * @Author: shaolin 
 * @Date: 2020-03-15 21:59:18 
 * @Last Modified by: shaolin
 * @Last Modified time: 2020-03-15 22:05:56
 */
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class HLSwitch extends StatefulWidget {
  HLSwitch(
      {Key key, this.isOpen = false, this.disabled = false, this.valueChanged})
      : super(key: key);
  final bool isOpen;
  final bool disabled;
  final ValueChanged<bool> valueChanged;

  @override
  _HLSwitchState createState() => _HLSwitchState();
}

class _HLSwitchState extends State<HLSwitch> {
  bool _isOpen;

  @override
  void initState() {
    super.initState();
    _isOpen = widget.isOpen;
  }

  @override
  Widget build(BuildContext context) => Container(
        child: CupertinoSwitch(
            activeColor: const Color(0xff0084FF),
            value: _isOpen,
            dragStartBehavior: DragStartBehavior.start,
            onChanged: widget.disabled
                ? null
                : (v) {
                    widget.valueChanged(v);
                    if (mounted) {
                      setState(() {
                        _isOpen = !_isOpen;
                      });
                    }
                  }),
      );
}
