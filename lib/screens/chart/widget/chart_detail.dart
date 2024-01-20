import 'package:flutter/material.dart';
import '../Item/elevated_button.dart';
import 'chart.dart';

class ChartDetail extends StatefulWidget {
  const ChartDetail({super.key});

  @override
  _ChartDetailState createState() => _ChartDetailState();
}

class _ChartDetailState extends State<ChartDetail> {
  String selectedOption = '일'; // Initialize selectedOption with a default value

  void handleOptionChange(String option) {
    setState(() {
      selectedOption = option;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            DropdownButton<String>(
              items: ['1분', '5분', '1틱'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                // Handle the selected chart option here
              },
              value: '1분', // Initial selected value
            ),
            buildOptionButton('일', () {
              // '일' option-specific action
              handleOptionChange('일');
            }, selectedOption == '일'),
            buildOptionButton('주', () {
              // '주' option-specific action
              handleOptionChange('주');
            }, selectedOption == '주'),
            buildOptionButton('월', () {
              // '월' option-specific action
              handleOptionChange('월');
            }, selectedOption == '월'),
            buildOptionButton('년', () {
              // '년' option-specific action
              handleOptionChange('년');
            }, selectedOption == '년'),
          ],
        ),
        Expanded(
            child: Chart()
        ),
      ],
    );
  }
}
