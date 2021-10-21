import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class NeumBtn extends StatefulWidget {
  NeumBtn({Key? key, this.editParent, required this.username})
      : super(key: key);
  final editParent;
  int username;
  @override
  _NeumBtnState createState() => _NeumBtnState();
}

class _NeumBtnState extends State<NeumBtn> {
  // ignore: recursive_getters
  // get username => null;

  @override
  Widget build(BuildContext context) {
    String name_ = widget.username.toString();
    return NeumorphicButton(
        onPressed: () => childClick(),
        margin: const EdgeInsets.only(top: 30),
        child: Text('点击子组件$name_'));
  }

  void childClick() {
    setState(() {
      widget.editParent();
    });
  }
}
