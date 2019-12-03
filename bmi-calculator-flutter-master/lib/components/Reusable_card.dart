import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({@required this.colour , this.cardChild , this.onPressed});
  final Color colour ;
  final Widget cardChild ;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.all(8.0),
        child: cardChild,
        decoration: BoxDecoration(
          color:colour,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
