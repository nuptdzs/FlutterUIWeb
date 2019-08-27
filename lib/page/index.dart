import 'package:flutter_ui_web/bean/widget_tree.dart';
import 'package:flutter_ui_web/page/home.dart';
import 'package:flutter_ui_web/widget_config.dart';
import 'package:flutter_web/material.dart';
import 'package:flutter_web/widgets.dart';

class Index extends StatefulWidget {
  Index({Key key}) : super(key: key);

  _IndexState createState() => _IndexState();
}

class _IndexState extends State<Index> {
  bool isMobile = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, BoxConstraints box) {
        var width = box.maxWidth;
        var height = box.maxHeight;
        var isMobile = width / height < 0.8;
        return Scaffold(
          appBar: AppBar(
            title: Text("Flutter UI WEB"),
          ),
          drawer: isMobile ? _renderDrawer() : null,
          body: Row(
            children: <Widget>[
              isMobile ? Center() : _renderDrawer(),
              _renderExample()
            ],
          ),
        );
      },
    );
  }

  _renderDrawer() {
    return Container(
      width: 200,
      color: Colors.white,
      child: _renderWidgetTree(widgetTree),
    );
  }

  Widget _current = Home();

  Widget _renderWidgetTree(WidgetTree widgetTree) {
    bool isSelect = widgetTree.widget == _current;
    var textStyle = TextStyle(
        fontSize: widgetTree.widget == null ? 15 : 13,
        color: widgetTree.widget == null
            ? Colors.black
            : isSelect ? Colors.blue : Colors.black);
    return Container(
      padding: EdgeInsets.only(left: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          GestureDetector(
              child: Container(
                decoration: isSelect
                    ? BoxDecoration(
                      color: Colors.blue[100],
                        border: Border(
                            right: BorderSide(color: Colors.blue, width: 4.0)))
                    : null,
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widgetTree.name,
                  style: textStyle,
                ),
              ),
              onTap: () {
                if (widgetTree.widget != null) {
                  this.setState(() {
                    _current = widgetTree.widget;
                  });
                }
              }),
          if (widgetTree.children != null)
            ListView.builder(
                itemBuilder: (context, index) {
                  return _renderWidgetTree(widgetTree.children[index]);
                },
                itemCount: widgetTree.children.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics())
        ],
      ),
    );
  }

  _renderExample() {
    return Expanded(
      child: _current,
    );
  }
}
