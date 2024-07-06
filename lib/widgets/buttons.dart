import 'package:flutter/material.dart';


class Button1 extends StatelessWidget {
  const Button1({
    super.key, required this.label, this.textColor=Colors.white,this.color,this.buttonTapped
  });

  final color;
  final String label;
  final Color textColor;
  final buttonTapped;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:buttonTapped,

      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: Container(
              color: color,
              child: Center(
                child: Text(label,
                  style: TextStyle(
                    color: textColor,
                      fontSize: 34,
                      fontWeight: FontWeight.w500),),
              ),
            ),
          )
            
        ),
      ),
    );
  }
}

