import 'package:flutter/material.dart';

import './screens/calculation_page.dart';
import './screens/input_page.dart';

void main() {
  runApp(BMICalculator());
}

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: InputPage(),
      initialRoute: '/',
      routes: {
        '/': (context) => InputPage(),
        '/calculation': (context) => CalculationPage(),
      },
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0a0e21),
        scaffoldBackgroundColor: Color(0xFF0a0e21),
        // sliderTheme: SliderTheme.of(context).copyWith(
        //   activeTrackColor: Colors.white,
        //   thumbColor: Color(0xFFeb1555),
        //   overlayColor: Color(0x29eb1555),
        //   thumbShape: RoundSliderThumbShape(
        //     enabledThumbRadius: 15,
        //   ),
        //   overlayShape: RoundSliderOverlayShape(
        //     overlayRadius: 30,
        //   ),
        // ),
      ),
    );
  }
}
