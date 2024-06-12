import 'package:flutter/material.dart';
import 'package:dice_icons/dice_icons.dart';

// class ToggleButtonData{
//   void Function()? onPressed;
//   bool enable=false;
//   IconData iconData;
//   ToggleButtonData({onPressed,enable});
// }

class ToggleButton extends StatefulWidget {
  ToggleButton({super.key, this.onPressed, required this.iconData});
  final void Function()? onPressed;
  bool enable = false;
  final IconData iconData;
  void toggle() {
    enable = !enable;
  }

  @override
  State<ToggleButton> createState() => _ToggleButtonState(onPressed,iconData);
}

class _ToggleButtonState extends State<ToggleButton> {
  _ToggleButtonState(this.onPressed,this.iconData);
  final void Function()? onPressed;
  final IconData iconData;


  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          onPressed!();
        },
        icon: const Icon(DiceIcons.dice4, size: 50));
  }
}
