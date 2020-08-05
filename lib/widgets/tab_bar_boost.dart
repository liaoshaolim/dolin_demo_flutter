import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

typedef TabChange = Function(int index);

/// boost：促进、支援、推动
class TabBarBoost extends StatefulWidget {
  const TabBarBoost(
      {@required this.children,
      @required this.tabController,
      @required this.pageController,
      this.tabChange,
      this.physics,
      this.dragStartBehavior = DragStartBehavior.start,
      Key key})
      : assert(children != null, 'children must not be null'),
        assert(dragStartBehavior != null, 'dragStartBehavior must not be null'),
        super(key: key);

  final TabController tabController;
  final PageController pageController;
  final List<Widget> children;
  final ScrollPhysics physics;
  final DragStartBehavior dragStartBehavior;
  final TabChange tabChange;

  @override
  _TabBarBoostState createState() => _TabBarBoostState();
}

class _TabBarBoostState extends State<TabBarBoost> {
  @override
  Widget build(BuildContext context) {
    return PageView(
      dragStartBehavior: widget.dragStartBehavior,
      physics: widget.physics,
      controller: widget.pageController,
      onPageChanged: (index) {
        widget.tabController?.animateTo(index);
        if (widget.tabChange != null) {
          widget.tabChange(index);
        }
      },
      children: widget.children,
    );
  }
}
