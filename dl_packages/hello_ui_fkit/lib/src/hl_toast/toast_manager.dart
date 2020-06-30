part of toast;

/// Class for managing `ToastFuture`.
///
class ToastManager {
  /// Get a singleton of ToastManager.
  factory ToastManager() => _instance ??= ToastManager._();

  ToastManager._();

  static ToastManager _instance;

  final Set<ToastFuture> _toastSet = {};

  void _dismissAll() {
    for (final it in _toastSet) {
      it.dismiss();
    }
  }

  void _removeFuture(ToastFuture future) => _toastSet.remove(future);

  void _addFuture(ToastFuture future) => _toastSet.add(future);
}
