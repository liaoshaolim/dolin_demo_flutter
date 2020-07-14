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

  /// 处理大于 0 的逻辑
  void _dealwithGreaterThan0() {
    if (mounted) {
      setState(() {
        _verifyStr = '$_seconds' 's';
        _isCanTap = false;
      });
      _seconds--;
    }
  }

  /// 处理小于等于 0 的逻辑
  void _dealwithLessThanOrEqualTo0() {
    _cancelTimer();
    _seconds = widget.countDownSeconds;
    _verifyStr = '重新发送';
    _isCanTap = true;
    if (mounted) {
      setState(() {});
    }
  }

  void _startTimer() {
    // 因为 timer 不会上来就执行内部动作,so 先手动处理一次大于 0 的情况
    _dealwithGreaterThan0();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_seconds <= 0) {
        _dealwithLessThanOrEqualTo0();
      } else {
        _dealwithGreaterThan0();
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
    _countDownSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _isCanTap ? widget.onTap : null,
      child: Text(
        '$_verifyStr',
        textAlign: TextAlign.right,
        style: _isCanTap ? widget.availableStyle : widget.unavailableStyle,
      ),
    );
  }
}
