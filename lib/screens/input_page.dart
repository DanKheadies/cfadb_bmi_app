import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants/constants.dart';
import '../models/calculator_brain.dart';
import './calculation_page.dart';
import '../widgets/bottom_button.dart';
import '../widgets/resuable_card.dart';
import '../widgets/sex_selector.dart';
import '../widgets/stat_incrementor.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPagePageState createState() => _InputPagePageState();
}

class _InputPagePageState extends State<InputPage> {
  Gender selectedGender;
  int height = 180;
  int weight = 60;
  int age = 30;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    selectedGender == Gender.male
                        ? kActiveContainerColor
                        : kInactiveContainerColor,
                    SexSelector(
                      FontAwesomeIcons.mars,
                      'MALE',
                    ),
                    () {
                      setState(() {
                        selectedGender == Gender.male
                            ? selectedGender = null
                            : selectedGender = Gender.male;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    selectedGender == Gender.female
                        ? kActiveContainerColor
                        : kInactiveContainerColor,
                    SexSelector(
                      FontAwesomeIcons.venus,
                      'FEMALE',
                    ),
                    () {
                      setState(() {
                        selectedGender == Gender.female
                            ? selectedGender = null
                            : selectedGender = Gender.female;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              kActiveContainerColor,
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT (CM)',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: kStatsTextStyle,
                      ),
                      // SizedBox(
                      //   width: 5,
                      // ),
                      // Text(
                      //   'cm',
                      //   style: kLabelTextStyle,
                      // ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Color(0xFF8d8e98),
                      thumbColor: Color(0xFFeb1555),
                      overlayColor: Color(0x29eb1555),
                      thumbShape: RoundSliderThumbShape(
                        enabledThumbRadius: 15,
                      ),
                      overlayShape: RoundSliderOverlayShape(
                        overlayRadius: 30,
                      ),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120,
                      max: 220,
                      // activeColor: Color(0xFFeb1555),
                      // inactiveColor: Color(0xFF8d8e98),
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
              () {},
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                StatIncrementor(
                  'WEIGHT (KG)',
                  weight,
                  () {
                    setState(() {
                      weight--;
                    });
                  },
                  () {
                    setState(() {
                      weight++;
                    });
                  },
                ),
                StatIncrementor(
                  'AGE',
                  age,
                  () {
                    setState(() {
                      age--;
                    });
                  },
                  () {
                    setState(() {
                      age++;
                    });
                  },
                ),
              ],
            ),
          ),
          BottomButton(
            () {
              CalculatorBrain calc = CalculatorBrain(height, weight);

              calc.calculateBMI();

              // Doesn't work with agruments like that
              // Navigator.pushNamed(
              //   context,
              //   '/calculation',
              //   arguments: {
              //     calc.calculateBMI(),
              //     calc.getResult(),
              //     calc.getInterpretation(),
              //   },
              // );

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (ctx) => CalculationPage(
                    bmiResult: calc.calculateBMI(),
                    resultText: calc.getResult(),
                    interpretation: calc.getInterpretation(),
                  ),
                ),
              );
            },
            'CALCULATION',
          ),
        ],
      ),
    );
  }
}
