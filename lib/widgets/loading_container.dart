import 'package:flutter/material.dart';

class LoadingContainer extends StatelessWidget {
  const LoadingContainer({
    @required this.isLoading,
    @required this.child,
    Key key,
    this.cover = false,
  }) : super(key: key);

  final Widget child;
  final bool isLoading;
  final bool cover;

  @override
  Widget build(BuildContext context) {
    return !cover
        ? !isLoading ? child : _loadingView(context)
        : Stack(
            children: <Widget>[
              child,
              isLoading ? _loadingView(context) : SizedBox()
            ],
          );
  }

  Widget _loadingView(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation(Theme.of(context).primaryColor),
      ),
    );
  }
}
