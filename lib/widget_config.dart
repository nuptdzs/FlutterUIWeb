import 'package:flutter_ui_web/bean/widget_tree.dart';
import 'package:flutter_ui_web/page/home.dart';
import 'package:flutter_ui_web/page/test.dart';

final WidgetTree widgetTree = WidgetTree("FlutterWeb",
    children: [WidgetTree("介绍", widget: Home()), w_common, w_layout, w_list, w_anim]);

final WidgetTree w_common =
    WidgetTree("常用组件", children: [WidgetTree("1", widget: Test(msg:"1"))]);

final WidgetTree w_layout =
    WidgetTree("布局", children: [WidgetTree("2", widget: Test(msg:"2"))]);

final WidgetTree w_list =
    WidgetTree("列表", children: [WidgetTree("3", widget: Test(msg:"3"))]);

final WidgetTree w_anim =
    WidgetTree("动画", children: [WidgetTree("4", widget: Test(msg:"4"))]);
