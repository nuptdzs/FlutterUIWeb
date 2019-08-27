import 'package:flutter_web/widgets.dart';

class WidgetTree {
  String name;
  List<WidgetTree> children;
  Widget widget;
  WidgetTree(this.name,{this.children,this.widget});
}