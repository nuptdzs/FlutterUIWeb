import 'package:flutter_web/widgets.dart';

class Test extends StatelessWidget {
  final String msg;

  Test({Key key,this.msg}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(msg),
    );
  }
}