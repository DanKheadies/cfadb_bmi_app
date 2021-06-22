import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import './widgets/resuable_card.dart';
import './widgets/sex_selector.dart';

const bottomContainerHeight = 80.0;
const activeContainerColor = Color(0xFF1d1e33);
const inactiveContainerColor = Color(0xFF111328);
const bottomContainerColor = Color(0xFFEB1555);
const statsTextStyle = TextStyle(
  fontSize: 50,
  fontWeight: FontWeight.w900,
);
const grey = Color(0xFF8d8e98);

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
                        ? activeContainerColor
                        : inactiveContainerColor,
                    SexSelector(
                      FontAwesomeIcons.mars,
                      'MALE',
                      grey,
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
                        ? activeContainerColor
                        : inactiveContainerColor,
                    SexSelector(
                      FontAwesomeIcons.venus,
                      'FEMALE',
                      grey,
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
              activeContainerColor,
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    height.toString(),
                    style: TextStyle(
                      color: grey,
                      fontSize: 18,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        '180',
                        style: statsTextStyle,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'cm',
                        style: TextStyle(
                          color: grey,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  // Slider(
                  //   value: height.toDouble(),
                  //   min: 120,
                  //   max: 220,
                  //   onChanged: ,
                  // ),
                ],
              ),
              () {},
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    activeContainerColor,
                    null,
                    () {},
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    activeContainerColor,
                    null,
                    () {},
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: bottomContainerColor,
            margin: EdgeInsets.only(
              top: 10,
            ),
            width: double.infinity,
            height: bottomContainerHeight,
          ),
        ],
      ),
    );
  }
}
