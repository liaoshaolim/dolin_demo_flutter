// Copyright (c) 14/5/2019, 19:27:58 PM The Hellobike. All rights reserved.
// Created by WeiZhongdan, weizhongdan06291@hellobike.com.
library toast;

import 'dart:async';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

part './toast_future.dart';
part './toast_manager.dart';

/// toast icon 类型
enum HLToastIconType { warning, success, failure }

/// Use the method to dismiss all toast.
///
void dismissAllToast() => ToastManager()._dismissAll();

/// Toast widget.
///
class Toast extends StatefulWidget {
  const Toast({
    Key key,
    this.child,
    this.textStyle,
    this.radius = 4,
    this.position = AlignmentCenterPosition.center,
    this.textDirection,
    this.dismissOtherOnShow = false,
    this.movingOnWindowChange = true,
    Color backgroundColor,
    this.textPadding,
    this.textAlign,
  })  : backgroundColor = backgroundColor ?? const Color(0xDD000000),
        super(key: key);

  final Widget child;

  final TextStyle textStyle;

  final Color backgroundColor;

  final double radius;

  final AlignmentCenterPosition position;

  final TextDirection textDirection;

  final bool dismissOtherOnShow;

  final bool movingOnWindowChange;

  final EdgeInsets textPadding;

  final TextAlign textAlign;

  @override
  _ToastState createState() => _ToastState();
}

class _ToastState extends State<Toast> {
  @override
  void dispose() {
    _contextMap.remove(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final overlay = Overlay(
      initialEntries: [
        OverlayEntry(
          builder: (ctx) {
            _contextMap[this] = ctx;
            return widget.child;
          },
        ),
      ],
    );

    final direction = widget.textDirection ?? TextDirection.ltr;

    final w = Directionality(
      child: Stack(children: <Widget>[
        overlay,
        Positioned(
          left: 0,
          right: 0,
          top: 0,
          bottom: 0,
          child: IgnorePointer(
            child: Container(
              color: Colors.black.withOpacity(0),
            ),
          ),
        )
      ]),
      textDirection: direction,
    );

    final typography = Typography(platform: TargetPlatform.android);
    final defaultTextTheme = typography.white;

    final textStyle = widget.textStyle ??
        defaultTextTheme.body1.copyWith(
          fontSize: 15,
          fontWeight: FontWeight.normal,
          color: Colors.white,
        );

    final textAlign = widget.textAlign ?? TextAlign.center;
    final textPadding = widget.textPadding ??
        const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 4,
        );

    return _ToastTheme(
      child: w,
      backgroundColor: widget.backgroundColor,
      radius: widget.radius,
      textStyle: textStyle,
      position: widget.position,
      dismissOtherOnShow: widget.dismissOtherOnShow,
      movingOnWindowChange: widget.movingOnWindowChange,
      textDirection: direction,
      textAlign: textAlign,
      textPadding: textPadding,
    );
  }
}

/// show toast with [msg],
ToastFuture hlShowToast(
  String msg, {
  HLToastIconType toastIconType,
  BuildContext context,
  Duration duration = _defaultDuration,
  AlignmentCenterPosition position,
  TextStyle textStyle,
  EdgeInsetsGeometry textPadding,
  Color backgroundColor,
  double radius,
  VoidCallback onDismiss,
  TextDirection textDirection,
  bool dismissOtherToast = false,
  TextAlign textAlign,
}) {
  context ??= _contextMap.values.first;

  textStyle ??= _ToastTheme.of(context).textStyle ?? TextStyle(fontSize: 15);

  textAlign ??= _ToastTheme.of(context).textAlign;

  textPadding ??= _ToastTheme.of(context).textPadding;

  position ??= _ToastTheme.of(context).position;
  backgroundColor ??= _ToastTheme.of(context).backgroundColor;
  radius ??= _ToastTheme.of(context).radius;

  final direction = textDirection ??
      _ToastTheme.of(context).textDirection ??
      TextDirection.ltr;

  var _toastIconAssetPath = '';
  switch (toastIconType) {
    case HLToastIconType.success:
      _toastIconAssetPath = 'assets/imgs/icon_toast_success.png';
      break;
    case HLToastIconType.failure:
      _toastIconAssetPath = 'assets/imgs/icon_toast_failure.png';
      break;
    case HLToastIconType.warning:
      _toastIconAssetPath = 'assets/imgs/icon_toast_warning.png';
      break;
    default:
      _toastIconAssetPath = 'assets/imgs/icon_toast_success.png';
  }

  final widget = Align(
    alignment: position,
    child: Container(
      margin: const EdgeInsets.all(50),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(radius),
      ),
      padding: textPadding,
      child: ClipRect(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Offstage(
              offstage: toastIconType == null,
              child: Container(
                padding: const EdgeInsets.only(top: 15, left: 27, right: 27),
                child: Image.asset(
                  '$_toastIconAssetPath',
                  package: 'hello_ui_fkit',
                  width: 36,
                  height: 36,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Text(
                msg,
                style: textStyle,
                textAlign: textAlign,
              ),
            )
          ],
        ),
      ),
    ),
  );

  return showToastWidget(
    widget,
    context: context,
    duration: duration,
    onDismiss: onDismiss,
    position: position,
    dismissOtherToast: dismissOtherToast,
    textDirection: direction,
  );
}

/// show [widget] with oktoast
ToastFuture showToastWidget(
  Widget widget, {
  BuildContext context,
  Duration duration = _defaultDuration,
  VoidCallback onDismiss,
  bool dismissOtherToast,
  TextDirection textDirection,
  AlignmentCenterPosition position,
}) {
  context ??= _contextMap.values.first;
  OverlayEntry entry;
  ToastFuture future;
  position ??= _ToastTheme.of(context).position;

  final movingOnWindowChange =
      _ToastTheme.of(context)?.movingOnWindowChange ?? false;

  final direction = textDirection ??
      _ToastTheme.of(context).textDirection ??
      TextDirection.ltr;

  entry = OverlayEntry(
      builder: (ctx) => IgnorePointer(
            child: _ToastContainer(
              duration: duration,
              position: position,
              movingOnWindowChange: movingOnWindowChange,
              child: Directionality(
                textDirection: direction,
                child: widget,
              ),
            ),
          ));

  dismissOtherToast ??= _ToastTheme.of(context).dismissOtherOnShow ?? false;

  if (dismissOtherToast == true) {
    ToastManager()._dismissAll();
  }

  future = ToastFuture._(entry, onDismiss);

  Future.delayed(duration, () {
    future.dismiss();
  });

  Overlay.of(context).insert(entry);
  ToastManager()._addFuture(future);

  return future;
}

class _ToastContainer extends StatefulWidget {
  const _ToastContainer({
    Key key,
    this.duration,
    this.child,
    this.movingOnWindowChange = false,
    this.position,
  }) : super(key: key);

  final Duration duration;
  final Widget child;
  final bool movingOnWindowChange;
  final AlignmentCenterPosition position;

  @override
  __ToastContainerState createState() => __ToastContainerState();
}

class __ToastContainerState extends State<_ToastContainer>
    with WidgetsBindingObserver {
  double opacity = 0;

  bool get movingOnWindowChange => widget.movingOnWindowChange;

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 30), () {
      if (!mounted) {
        return;
      }
      setState(() {
        opacity = 1.0;
      });
    });

    Future.delayed(widget.duration - _opacityDuration, () {
      if (!mounted) {
        return;
      }
      setState(() {
        opacity = 0.0;
      });
    });

    WidgetsBinding.instance.addObserver(this);

    super.initState();
  }

  @override
  void didChangeMetrics() {
    super.didChangeMetrics();
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final w = AnimatedOpacity(
      duration: _opacityDuration,
      child: widget.child,
      opacity: opacity,
    );

    if (movingOnWindowChange != true) {
      return w;
    }

    final mediaQueryData = MediaQueryData.fromWindow(ui.window);
    Widget container = AnimatedContainer(
      padding: EdgeInsets.only(bottom: mediaQueryData.viewInsets.bottom),
      duration: _opacityDuration,
      child: w,
    );

    if (widget.position.y < 0) {
      container = Padding(
        padding: EdgeInsets.only(
            top: mediaQueryData.viewInsets.top * widget.position.y),
        child: container,
      );
    } else if (widget.position.y > 0) {
      container = Padding(
        padding: EdgeInsets.only(
            bottom: mediaQueryData.viewInsets.bottom * widget.position.y),
        child: container,
      );
    }

    return container;
  }
}

class AlignmentCenterPosition extends AlignmentGeometry {
  const AlignmentCenterPosition(this.y);

  final double y;

  static const AlignmentCenterPosition top = AlignmentCenterPosition(-0.75);

  static const AlignmentCenterPosition center = AlignmentCenterPosition(0);

  static const AlignmentCenterPosition bottom = AlignmentCenterPosition(0.75);

  @override
  AlignmentGeometry add(AlignmentGeometry other) {
    if (other is AlignmentCenterPosition) {
      return this + other;
    }
    return super.add(other);
  }

  /// Returns the difference between two [AlignmentCenterPosition]s.
  AlignmentCenterPosition operator -(AlignmentCenterPosition other) =>
      AlignmentCenterPosition(y - other.y);

  /// Returns the sum of two [AlignmentCenterPosition]s.
  AlignmentCenterPosition operator +(AlignmentCenterPosition other) =>
      AlignmentCenterPosition(y + other.y);

  @override
  AlignmentCenterPosition operator %(double other) =>
      AlignmentCenterPosition(y % other);

  @override
  AlignmentCenterPosition operator *(double other) =>
      AlignmentCenterPosition(y * other);

  @override
  AlignmentCenterPosition operator -() => AlignmentCenterPosition(-y);

  @override
  AlignmentGeometry operator /(double other) =>
      AlignmentCenterPosition(y / other);

  @override
  Alignment resolve(TextDirection direction) {
    assert(direction != null);
    switch (direction) {
      case TextDirection.rtl:
        return Alignment(0, y);
      case TextDirection.ltr:
        return Alignment(0, y);
    }
    return null;
  }

  @override
  AlignmentGeometry operator ~/(double other) =>
      AlignmentCenterPosition(y % other);
}

class _ToastTheme extends InheritedWidget {
  const _ToastTheme({
    this.textStyle,
    this.backgroundColor,
    this.radius,
    this.position,
    this.dismissOtherOnShow,
    this.movingOnWindowChange,
    this.textPadding,
    this.textAlign,
    TextDirection textDirection,
    Widget child,
  })  : textDirection = textDirection ?? TextDirection.ltr,
        super(child: child);

  final TextStyle textStyle;

  final Color backgroundColor;

  final double radius;

  final AlignmentCenterPosition position;

  final bool dismissOtherOnShow;

  final bool movingOnWindowChange;

  final TextDirection textDirection;

  final EdgeInsets textPadding;

  final TextAlign textAlign;

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static _ToastTheme of(BuildContext context) =>
      context.inheritFromWidgetOfExactType(_ToastTheme);
}

Map<_ToastState, BuildContext> _contextMap = {};

const _defaultDuration = Duration(
  milliseconds: 2000,
);

const _opacityDuration = Duration(milliseconds: 250);
