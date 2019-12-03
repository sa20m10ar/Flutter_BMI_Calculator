

import 'package:bmi_calculator/components/Reusable_card.dart';
import 'package:bmi_calculator/components/constants.dart';
import 'package:bmi_calculator/screens/input_page.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget{

ResultsPage({@required this.bmiResult,@required this.resultText,@required this.interpretation});

  final String bmiResult ;
  final String resultText ;
  final String interpretation ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text('Your Results', style: kTitleTextStyle,),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment:CrossAxisAlignment.center,
                children: <Widget>[
                  Text(resultText.toUpperCase(),style: kResultTextStyle,),
                  Text(bmiResult.toUpperCase(),
                  style:kBMITextStyle),
                  Text(interpretation,
                   style: kBodyTextStyle,
                   textAlign: TextAlign.center,)
                ],
              ),
            ),
          ),
          GestureDetector(
              onTap: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => InputPage()));
              },
              child: Container(
                child: Center(child: Text('Re-Calculate',style: KlargeButtonTextStyle,)),
                color: kBottomContainerColor,
                margin: EdgeInsets.only(top: 10.0),
                width: double.infinity,
                height: kBottomContainerHeight,
              ),
            )
        ],
      ),
    );
  }
}