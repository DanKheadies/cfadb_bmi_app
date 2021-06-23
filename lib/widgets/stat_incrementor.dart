import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants/constants.dart';
import './resuable_card.dart';
import './round_icon_button.dart';

class StatIncrementor extends StatelessWidget {
  final String statName;
  final int statAmount;
  final Function decrement;
  final Function increment;

  StatIncrementor(
    this.statName,
    this.statAmount,
    this.decrement,
    this.increment,
  );

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ReusableCard(
        kActiveContainerColor,
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              statName,
              style: kLabelTextStyle,
            ),
            Text(
              statAmount.toString(),
              style: kStatsTextStyle,
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RoundIconButton(
                  FontAwesomeIcons.minus,
                  decrement,
                ),
                SizedBox(width: 10),
                RoundIconButton(
                  FontAwesomeIcons.plus,
                  increment,
                ),
              ],
            ),
          ],
        ),
        () {},
      ),
    );
  }
}
