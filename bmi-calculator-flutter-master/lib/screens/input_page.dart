import 'package:bmi_calculator/screens/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/components/Icon_content.dart';
import 'package:bmi_calculator/components/Reusable_card.dart';
import 'package:bmi_calculator/components/constants.dart';
import 'package:bmi_calculator/calculator_brain.dart';


enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 180 ;
  int weight = 40 ;
  int age = 15 ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text('BMI CALCULATOR')),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
                child: Row(
                  children: <Widget>[
                 Expanded(

                  child: ReusableCard(
                      onPressed: (){
                        setState(() {
                          selectedGender = Gender.male;
                        });

                      },
                      colour: selectedGender == Gender.male
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.mars,
                        label: "Male",
                      )),
                ),
                 Expanded(

                  child: ReusableCard(
                      onPressed: (){
                        setState(() {
                        selectedGender = Gender.female;
                        });
                      },
                      colour: selectedGender == Gender.female
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.venus,
                        label: "Female",
                      )),
                ),
              ],
            )),
            Expanded(
                child: Row(children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                    colour: kActiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,

                        children: <Widget>[
                          Text('HEIGHT',style: kLabelTextStyle,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: <Widget>[
                              Text(height.toString(),style:kNumberTextStyle),
                              Text('cm', style: kLabelTextStyle,),
                            ],
                          ),
                          SliderTheme(
                            data:SliderTheme.of(context).copyWith(
                              thumbShape : RoundSliderThumbShape(enabledThumbRadius: 15.0),
                              overlayShape:RoundSliderOverlayShape(overlayRadius: 30.0),
                              overlayColor: Color(0x29EB1555),
                            ),
                            child: Slider(value: height.toDouble(),
                            min: 120.0,
                            max: 220.0,
                            activeColor: Color(0xffEB1555),
                              inactiveColor: Color(0xff8D8E98),
                              onChanged: (double newValue){
                              setState(() {
                                height = newValue.round();
                              });
                              },
                            ),
                          )
                        ],
                      ),


              )),
            ])),
            Expanded(

                child: Row(children: <Widget>[

                 Expanded(child: ReusableCard(
                   colour: kActiveCardColor,
                  cardChild: Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: <Widget>[
                     Text('weight',style: kLabelTextStyle,),
                     Text(weight.toString(),style: kNumberTextStyle,),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: <Widget>[
                         RoundIconButton(icon: FontAwesomeIcons.plus,
                         onPressed:(){
                           setState(() {
                             weight++;
                           });
                         } ,),
                         SizedBox(width: 10.0,),
                         RoundIconButton(icon: FontAwesomeIcons.minus,
                         onPressed: (){
                           setState(() {
                             weight--;
                           });
                         },),
                       ],
                     )
                   ],
                 ),
                 )),

                 Expanded(child: ReusableCard(colour: kActiveCardColor,
                   cardChild: Column(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: <Widget>[
                       Text('Age',style: kLabelTextStyle,),
                       Text(age.toString(),style: kNumberTextStyle,),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: <Widget>[
                           RoundIconButton(icon: FontAwesomeIcons.plus,
                             onPressed:(){
                               setState(() {
                                 age++;
                               });
                             } ,),
                           SizedBox(width: 10.0,),
                           RoundIconButton(icon: FontAwesomeIcons.minus,
                             onPressed: (){
                               setState(() {
                                 age--;
                               });
                             },),
                         ],
                       )
                     ],
                   ),
                 )),
            ])),
            GestureDetector(
              onTap: (){
                CalculatorBrain calc = CalculatorBrain(weight: weight,height: height);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ResultsPage(
                      bmiResult: calc.calculateBmi(),
                      resultText: calc.getResult(),
                      interpretation: calc.getInterpretation(),
                    )));
              },
              child: Container(
                child: Center(child: Text('Calculate',style: KlargeButtonTextStyle,)),
                color: kBottomContainerColor,
                margin: EdgeInsets.only(top: 10.0),
                width: double.infinity,
                height: kBottomContainerHeight,
              ),
            )
          ],
        ));
  }
}


class RoundIconButton extends StatelessWidget {
  RoundIconButton({@required this.icon , @required this.onPressed});
  final IconData icon;
  Function onPressed ;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon) ,
      onPressed: onPressed,
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(
        width: 50.0,
        height: 50.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xff4c4f5E),
    );
  }
}
