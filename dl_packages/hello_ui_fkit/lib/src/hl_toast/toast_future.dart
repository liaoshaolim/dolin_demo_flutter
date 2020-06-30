part of toast;

/// Use the [dismiss] to dismiss toast.
class ToastFuture {
  ToastFuture._(this._entry, this._onDismiss);

  final OverlayEntry _entry;
  final VoidCallback _onDismiss;

  bool _isShow = true;

  /// Dismiss toast immediately, and call `onDismiss`.
  void dismiss() {
    if (!_isShow) {
      return;
    }
    _isShow = false;
    _entry.remove();
    _onDismiss?.call();
    ToastManager()._removeFuture(this);
  }
}
