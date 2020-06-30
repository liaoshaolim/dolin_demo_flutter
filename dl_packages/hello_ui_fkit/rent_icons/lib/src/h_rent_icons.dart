// ignore_for_file: constant_identifier_names
import 'package:flutter/widgets.dart';

class HRentIcons {
  HRentIcons._();

  // 通用图标
  /// 向左箭头直角
  static const IconData arrow_back = _IconData(0x001);

  /// 向右箭头直角
  static const IconData arrow_next = _IconData(0x002);

  /// 向左箭头圆角
  static const IconData arrow_back_fillet = _IconData(0x003);

  /// 向右箭头圆角
  static const IconData arrow_next_fillet = _IconData(0x004);

  /// 删除
  static const IconData delete = _IconData(0x005);

  /// 添加
  static const IconData add = _IconData(0x006);

  /// 单选选中圆形
  static const IconData check_round = _IconData(0x007);

  /// 单选圆形边框
  static const IconData check_round_outline = _IconData(0x0013);

  /// 拒绝圆形
  static const IconData invalidate_round = _IconData(0x008);

  /// 相机
  static const IconData camera = _IconData(0x009);

  /// 地址
  static const IconData address = _IconData(0x0010);

  /// 减号
  static const IconData less = _IconData(0x0011);

  /// 加号
  static const IconData plus = _IconData(0x0012);

  /// 无网图标
  static const IconData no_net = _IconData(0x014);

  /// 关闭
  static const IconData close = _IconData(0x015);

  /// 搜索
  static const IconData search = _IconData(0x016);

  /// 提示
  static const IconData wran_round = _IconData(0x017);

  /// 时间
  static const IconData time_round = _IconData(0x018);

  /// 问号
  static const IconData doubt_round = _IconData(0x019);

  /// 编辑
  static const IconData edit = _IconData(0x020);

  /// 隐藏
  static const IconData eye_hide = _IconData(0x021);

  /// 显示
  static const IconData eye_show = _IconData(0x022);

  /// 添加 圆形
  static const IconData add_round = _IconData(0x023);

  // 业务图标
  /// 电话
  static const IconData call = _IconData(0x201);

  /// 扫描
  static const IconData scan = _IconData(0x202);

  /// 图章圆圈
  static const IconData stamp_round = _IconData(0x203);

  /// 电动车 包
  static const IconData e_bike_bag_fillet = _IconData(0x204);

  /// 列表 包
  static const IconData list_bag_fillet = _IconData(0x205);

  /// 喇叭
  static const IconData msg = _IconData(0x206);

  /// 电动车
  static const IconData e_bike = _IconData(0x207);

  /// 错误 圆形
  static const IconData error = _IconData(0x208);

  /// 成功圆形
  static const IconData success = _IconData(0x209);

  /// 配件采购
  static const IconData e_bike_part_bag_fillet = _IconData(0x210);

  /// 拒绝
  static const IconData reducing = _IconData(0x211);

  /// 合同新建
  static const IconData menu_contract_add = _IconData(0x212);

  /// 列表收藏
  static const IconData list_collection_fillet = _IconData(0x213);

  /// 合同模版
  static const IconData menu_contract_templates = _IconData(0x214);

  /// 列表
  static const IconData list_bag_fillet_2 = _IconData(0x215);

  /// 列表等待
  static const IconData list_wait_fillet = _IconData(0x216);

  /// 钱包
  static const IconData wallet = _IconData(0x217);

  /// 收入
  static const IconData menu_income = _IconData(0x218);

  /// 银行卡
  static const IconData bank_card = _IconData(0x219);
}

class _IconData extends IconData {
  const _IconData(int index)
      : super(
          0xe000 + index,
          fontFamily: 'HRentIcon',
          fontPackage: 'rent_icons',
        );
}
