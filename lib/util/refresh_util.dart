import 'package:pull_to_refresh/pull_to_refresh.dart';

/// 下拉刷下，上拉加载工具
class RefreshUtil {
  static void loadStatus(DataStatus status, RefreshController controller,
      {bool isRefresh = true}) {
    if (controller == null ||
        controller.headerMode == null ||
        controller.footerMode == null) {
      return;
    }
    switch (status) {
      case DataStatus.success:
        isRefresh
            ? controller.refreshCompleted(resetFooterState: true)
            : controller.loadComplete();
        break;
      case DataStatus.fail:
        if (isRefresh) {
          controller
            ..resetNoData()
            ..refreshFailed();
        } else {
          controller
            ..loadFailed()
            ..resetNoData();
        }
        break;
      case DataStatus.empty:
        isRefresh
            ? controller.refreshCompleted(resetFooterState: true)
            : controller.loadNoData();
        break;

      default:
        break;
    }
  }
}

enum DataStatus { success, fail, empty }
