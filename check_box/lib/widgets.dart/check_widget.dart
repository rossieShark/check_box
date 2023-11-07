import 'package:flutter/material.dart';

class CheckBox extends StatelessWidget {
  final bool isActive;
  const CheckBox({super.key, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return isActive
        ? const Icon(Icons.check_box_outlined)
        : const Icon(Icons.check_box_outline_blank);
  }
}
