import 'package:flutter/material.dart';

class CustomTile extends StatelessWidget {
  CustomTile({super.key, this.text, required this.isChecked});

  final String? text;
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.check_circle,
          color: isChecked ? Colors.green : Colors.grey,
        ),
        const SizedBox(width: 5,),
        Text(text ?? "")
      ],
    );
  }
}
