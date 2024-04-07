import 'package:flutter/widgets.dart';
import 'package:zhanggui_pos/model/zhanggui_annotation.dart';

class ZhangGuiPOSScrollPhysics extends ScrollBehavior {
  @override
  @ZhangGuiPOS("buildOverscrollIndicator", "custom_scroll_physic")
  Widget buildOverscrollIndicator(context, child, details) => child;
}
