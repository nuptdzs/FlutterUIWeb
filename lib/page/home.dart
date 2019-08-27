import 'package:flutter_ui_web/page/test.dart';
import 'package:flutter_ui_web/widgets/bottom_tab.dart';
import 'package:flutter_web/cupertino.dart';
import 'package:flutter_web/material.dart';
import 'package:flutter_web/widgets.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CommonBottomBarPage([
      BottomItemBean(
        name: "首页",
        page: Test(msg: "首页"),
        iconOn: 'images/tab_home_selected.png',
        iconOff: 'images/tab_home.png',
      ),
      BottomItemBean(
        name: "我",
        page: Test(msg: "我"),
        iconOn: 'images/tab_i_selected.png',
        iconOff: 'images/tab_i.png',
      ),
    ]);
  }
}
