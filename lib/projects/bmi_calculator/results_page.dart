import 'package:cv_main_project/projects/bmi_calculator/reusable_card.dart';
import 'package:flutter/material.dart';
import 'bottom_button.dart';
import 'components.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage({super.key, required this.bmiResult, required this.resultText, required this.interpretation});

  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Result  Page')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.bottomLeft,
                    padding: EdgeInsets.all(15),
                    child: Text('Your Result', style: kTitleTextStyle),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: ReusableCard(
                    color: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          //Display health rating. which would be a list of ratings that display the current value.
                          resultText.toUpperCase(),
                          style: kHealthResultTextStyle,
                        ),
                        Text(
                          //Display result of BMI as a double.
                          bmiResult,
                          style: kNumberStyle,
                        ),
                        Text(interpretation, style: kLabelTextStyle),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomBar(onTap: () => Navigator.pop(context), string: 'Re-Calculate Your BMI'),
        ],
      ),
    );
  }
}
