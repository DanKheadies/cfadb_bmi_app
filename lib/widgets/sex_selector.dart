import 'package:flutter/material.dart';

import '../constants/constants.dart';

class SexSelector extends StatelessWidget {
  final IconData icon;
  final String sext;

  SexSelector(this.icon, this.sext);

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
          style: kLabelTextStyle,
        ),
      ],
    );
  }
}
