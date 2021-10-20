import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class NeumBtn extends StatefulWidget {
  const NeumBtn({Key? key}) : super(key: key);

  @override
  _NeumBtnState createState() => _NeumBtnState();
}

class _NeumBtnState extends State<NeumBtn> {
  @override
  Widget build(BuildContext context) {
    return NeumorphicText(
      'Jarry007' ,
      style: const NeumorphicStyle(depth: 4, color: Colors.blueGrey),
      textStyle: NeumorphicTextStyle(fontSize: 40, fontWeight: FontWeight.w700),
    );
  }
}
