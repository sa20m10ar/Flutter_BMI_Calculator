
import 'dart:math';

class CalculatorBrain {
 
CalculatorBrain({this.weight,this.height});

  final int weight ;
  final int height ;
  double _bmi ;

String calculateBmi (){
 _bmi = weight/pow(height/100, 2);
 return _bmi.toStringAsFixed(1);
}

String getResult (){
  if(_bmi>= 25){return 'Over Weight';}
  else if(_bmi > 18.5){return'Normal';}
  else {return 'Under Weight';}
}

String getInterpretation(){
  if(_bmi>= 25){return 'You have higher than Normal Body weight , you have to exercise more';}
  else if(_bmi > 18.5){return'You have a normal body weight , Good job!!';}
  else {return 'You have lower than Normal body weight , you can eat abit more !';}
}

}