import 'package:bmi_app/widgets/resuable_card.dart';
import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../widgets/bottom_button.dart';
import '../widgets/resuable_card.dart';

class CalculationPage extends StatelessWidget {
  final String bmiResult;
  final String resultText;
  final String interpretation;

  CalculationPage({
    this.bmiResult,
    this.resultText,
    this.interpretation,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.only(
                top: 15,
              ),
              child: Text(
                'Your Result',
                style: kTitleTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              kActiveContainerColor,
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    resultText.toUpperCase(),
                    style: kResultTextStyle,
                  ),
                  Text(
                    bmiResult,
                    style: kBMITextSTyle,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      interpretation,
                      textAlign: TextAlign.center,
                      style: kBodyTextStyle,
                    ),
                  ),
                ],
              ),
              () {},
            ),
          ),
          BottomButton(
            () {
              Navigator.pop(context);
            },
            'RE-CALCULATE BMI',
          ),
        ],
      ),
    );
  }
}
