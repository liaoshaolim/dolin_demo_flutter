/*
 * @Author: shaolin 
 * @Date: 2020-07-03 16:53:19 
 * @Last Modified by: shaolin
 * @Last Modified time: 2020-07-04 15:59:46
 */
import 'dart:async';
import 'package:dolin_demo_flutter/util/event_bus.dart';
import 'package:flutter/material.dart';

/// 倒计时组件
class CountDownWidget extends StatefulWidget {
  const CountDownWidget(
      {Key key,
      this.onTap,
      this.countDownSeconds = 60,
      this.availableStyle = const TextStyle(
        fontSize: 16.0,
        color: Color(0xFF0B82F1),
      ),
      this.unavailableStyle = const TextStyle(
        fontSize: 16.0,
        color: Color(0xFF999999),
      )})
      : super(key: key);

  /// 倒计时秒数
  final int countDownSeconds;

  /// 点击倒计时
  final VoidCallback onTap;

  /// 可点击时样式
  final TextStyle availableStyle;

  /// 不可点击时样式
  final TextStyle unavailableStyle;

  @override
  _CountDownWidgetState createState() => _CountDownWidgetState();
}

class _CountDownWidgetState extends State<CountDownWidget> {
  Timer _timer;
  int _seconds;
  String _verifyStr = '发送验证码';
  bool _isCanTap = true;
  StreamSubscription _countDownSubscription;

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_seconds <= 0) {
        _cancelTimer();
        _seconds = widget.countDownSeconds;
        _verifyStr = '重新发送';
        _isCanTap = true;
        if (mounted) {
          setState(() {});
        }
        return;
      } else {
        _verifyStr = '$_seconds' 's';
        _isCanTap = false;
        if (mounted) {
          setState(() {});
        }
        _seconds--;
      }
    });
  }

  void _cancelTimer() {
    _timer?.cancel();
  }

  @override
  void initState() {
    super.initState();
    _seconds = widget.countDownSeconds;
    // 订阅 eventbus
    _countDownSubscription = eventBus.on<CountDownEvent>().listen((event) {
      _startTimer();
    });
  }

  @override
  void dispose() {
    _cancelTimer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Text(
        '$_verifyStr',
        textAlign: TextAlign.right,
        style: _isCanTap ? widget.availableStyle : widget.unavailableStyle,
      ),
    );
  }
}
