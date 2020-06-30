import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class RefreshHeader extends ClassicHeader {
  const RefreshHeader({
    textStyle = const TextStyle(color: Color(0xFF999999), fontSize: 16),
    refreshedText = '刷新完成',
    refreshReadyText = '释放立即刷新',
    refreshingText = '正在刷新...',
    refreshText = '下拉可以刷新',
    failedText = '拉取数据失败',
  }) : super(
            textStyle: textStyle,
            completeText: refreshedText,
            releaseText: refreshReadyText,
            refreshingText: refreshingText,
            failedText: failedText,
            idleText: refreshText);
}

class RefreshFooter extends ClassicFooter {
  const RefreshFooter(
      {textStyle = const TextStyle(color: Color(0xFF999999), fontSize: 16),
      loadingText = '正在加载...',
      loadText = '上拉可以加载',
      noMoreText = '没有更多数据',
      failedText = '拉取数据失败',
      loadStyle = LoadStyle.ShowWhenLoading,
      idleIcon = const Icon(Icons.arrow_upward, color: Colors.grey)})
      : super(
            textStyle: textStyle,
            failedText: failedText,
            loadingText: loadingText,
            idleText: loadText,
            canLoadingText: loadText,
            noDataText: noMoreText,
            loadStyle: loadStyle,
            idleIcon: idleIcon);
}
