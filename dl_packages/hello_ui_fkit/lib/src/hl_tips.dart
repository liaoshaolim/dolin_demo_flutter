import 'package:flutter/material.dart';
import 'package:rent_icons/rent_icons.dart';

/// 提示类型：强提示、弱提示 (也就文字颜色不同)
enum HLTipsType { strong, weak }

class HLTips extends StatelessWidget {
  /// Tips：
  /// onTapCloseButton 不为空则显示 x 按钮反之隐藏，onTapDetailButton 同理
  const HLTips(
      {@required this.text,
      Key key,
      this.tipsType = HLTipsType.strong, // 默认强文本
      this.isShowleftIcon = true, // 默认显示左边 icon
      this.onTapCloseButton,
      this.onTapDetailButton})
      : assert(text != null, 'text must not be null'),
        super(key: key);

  final String text;
  final bool isShowleftIcon;
  final VoidCallback onTapCloseButton;
  final VoidCallback onTapDetailButton;
  final HLTipsType tipsType;

  @override
  Widget build(BuildContext context) {
    final textColor = tipsType == HLTipsType.strong
        ? const Color(0xFFFF5600)
        : const Color(0xFF666666);

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
      color: const Color(0xffFEFCEB),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Offstage(
                  offstage: !isShowleftIcon,
                  child: Container(
                    padding: const EdgeInsets.only(right: 10, top: 3),
                    child: const Icon(
                      HRentIcons.msg,
                      color: Color(0xFFFF5600),
                      size: 14,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text('$text',
                      style: TextStyle(
                        fontSize: 15,
                        color: textColor,
                      )),
                ),
              ],
            ),
          ),
          Offstage(
            offstage: onTapCloseButton == null,
            child: InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: onTapCloseButton,
              child: Container(
                padding: const EdgeInsets.only(left: 15),
                alignment: Alignment.center,
                child: const Icon(
                  Icons.close,
                  size: 15,
                  color: Color(0xFFFF5600),
                ),
              ),
            ),
          ),
          Offstage(
            offstage: onTapDetailButton == null,
            child: InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: onTapDetailButton,
              child: Container(
                padding: const EdgeInsets.only(left: 15),
                alignment: Alignment.center,
                child: Text('查看详情 ＞',
                    style: TextStyle(
                      fontSize: 15,
                      color: const Color(0xFF376699),
                    )),
              ),
            ),
          )
        ],
      ),
    );
  }
}
