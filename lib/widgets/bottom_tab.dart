
import 'package:flutter_web/cupertino.dart';
import 'package:flutter_web/material.dart';
import 'package:flutter_web/widgets.dart';

class BottomItemBean {
  final Widget page;
  final String name;
  final String iconOff;
  final String iconOn;

  BottomItemBean(
      {@required this.page,
      @required this.name,
      @required this.iconOff,
      @required this.iconOn});
}

class CommonBottomBarPage extends StatefulWidget {
  final List<BottomItemBean> items;

  CommonBottomBarPage(this.items, {Key key}) : super(key: key);

  _CommonBottomBarPageState createState() => _CommonBottomBarPageState();
}

class _CommonBottomBarPageState extends State<CommonBottomBarPage> {
  var _pageController;
  var _index = 0;
  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        onPageChanged: (index) {
          this.setState(() {
            _index = index;
          });
        },
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        itemBuilder: (context, index) {
          return widget.items[index].page;
        },
      ),
      bottomNavigationBar: CupertinoTabBar(
        onTap: (index) {
          _pageController.jumpToPage(index);
        },
        items: _bottomItems(),
      ),
    );
  }

  List<BottomNavigationBarItem> _bottomItems() {
    List<BottomNavigationBarItem> bars = [];
    for (int i = 0; i < widget.items.length; i++) {
      var item = widget.items[i];
      bars.add(BottomNavigationBarItem(
          icon: Image.asset(
            _index == i ? item.iconOn : item.iconOff,
            width: 24.0,
            height: 24.0,
          ),
          title: Text(item.name,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color:
                      _index == i ? Color(0xff1296db) : Color(0xff888888)))));
    }
    return bars;
  }
}
