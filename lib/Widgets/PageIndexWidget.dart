import 'package:flutter/material.dart';

class PageIndexWidget extends StatelessWidget {
  const PageIndexWidget({this.icon, this.color, this.index, this.onPressed});
  final IconData icon;
  final Color color;
  final int index;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: AnimatedContainer(
        duration: Duration(milliseconds: 400),
        height: 100,
        width: 70,
        child: Center(
          child: Icon(
            icon,
            color: color,
            size: 36,
          ),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28),
          color: color.withOpacity(0.3),
        ),
      ),
      onTap: () {
        onPressed();
      },
    );
  }
}
