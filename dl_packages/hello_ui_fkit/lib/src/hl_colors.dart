/*
 * @Author: shaolin 
 * @Date: 2020-02-17 18:19:28 
 * @Last Modified by: shaolin
 * @Last Modified time: 2020-02-21 13:53:02
 */
import 'package:flutter/material.dart';

/*
  只抽象业务颜色 reason：品牌色改变的话，只用改对应的brand
  后续抽象的业务颜色可在此扩展
  具体颜色如333、666等不抽象（无意义）
  按钮各种状态下的颜色均见名知意，故省略注释
*/
class HLColors {
  HLColors._();

  /// 品牌
  static const Color brand = Color(0xFF0B82F1);

  /// 失败
  static const Color failure = Color(0xFFFF404C);

  /// 警示
  static const Color warning = Color(0xFFFF5600);

  /// 成功
  static const Color success = Color(0xFF0DB94E);

  /// 链接
  static const Color link = Color(0xFF376699);

  /// 背景
  static const Color background = Color(0xFFF5F5F5);

  /// 分割线
  static const Color separate = Color(0xFFEEEEEE);

  // 主按钮背景色（普通、不可点、按压时）
  static const Color mainButtonBackgroundNormal = HLColors.brand;

  static const Color mainButtonBackgroundDisabled = Color(0xFFCCCCCC);

  static const Color mainButtonBackgroundPress = Color(0xFF006BCF);

  // 主按钮文本色（普通、不可点、按压时）
  static const Color mainButtonTextNormal = Colors.white;

  static const Color mainButtonTextDisabled = Colors.white;

  static const Color mainButtonTextPress = Colors.white;

  // 次按钮背景色（普通、不可点、按压时）
  static const Color subButtonBackgroundNormal = Colors.white;

  static const Color subButtonBackgroundDisabled = Colors.white;

  static const Color subButtonBackgroundPress = Colors.white;

  // 次按钮文本色（普通、不可点、按压时）
  static const Color subButtonTextNormal = HLColors.brand;

  static const Color subButtonTextDisabled = Color(0xFFCCCCCC);

  static const Color subButtonTextPress = Color(0xFF0868C0);

  // 次按钮边框色（普通、不可点、按压时）
  static const Color subButtonBorderNormal = HLColors.brand;

  static const Color subButtonBorderDisabled = Color(0xFFCCCCCC);

  static const Color subButtonBorderPress = HLColors.brand;
}
