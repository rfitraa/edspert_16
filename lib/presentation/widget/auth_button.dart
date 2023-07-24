import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  final String iconPath;
  final String text;
  final Color color;
  final Color textColor;
  final VoidCallback? onTap;

  const AuthButton(
      {super.key,
      required this.iconPath,
      required this.text,
      required this.color,
      required this.textColor,
      required this.onTap,});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
            backgroundColor: color,
            shadowColor: Colors.black,
            elevation: 7,
            side: BorderSide(
                color:
                    color == Colors.black ? Colors.transparent : Colors.blue)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                iconPath,
                width: 30,
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                text,
                style: TextStyle(color: textColor),
              ),
            ],
          ),
        ));
  }
}
