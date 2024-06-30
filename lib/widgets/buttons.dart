import 'package:flutter/material.dart';


class Button1 extends StatelessWidget {
  const Button1({
    super.key, required this.label, this.textColor=Colors.white,this.color

  });

  final color;
  final String label;
  final Color textColor;
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 3,
      color: color,
      borderRadius: BorderRadius.circular(30),
      child: Text(label,
        style: TextStyle(
          color: textColor,
            fontSize: 32,
            fontWeight: FontWeight.w500),)
        
    );
  }
}

