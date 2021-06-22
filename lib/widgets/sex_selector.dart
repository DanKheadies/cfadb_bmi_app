import 'package:flutter/material.dart';

class SexSelector extends StatelessWidget {
  final IconData icon;
  final String sext;
  final Color colour;

  SexSelector(this.icon, this.sext, this.colour);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 80,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          sext,
          style: TextStyle(
            fontSize: 18,
            color: colour,
          ),
        ),
      ],
    );
  }
}
