import 'answers.dart';

import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  
  final Function resetHandler;
  
  Result(this.resultScore,this.resetHandler);

  String get resultPhrase {
    String resultText;
    
    if (resultScore <= 8) {
      resultText = 'You are awesome and innocent!';
    } else if (resultScore <= 12) {
      resultText = 'Pretty likeable!';
    } else if (resultScore <= 16) {
      resultText = 'You are ... strange?!';
    } else {
      resultText = 'You are so Good!';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          
          SizedBox(height: 25,),
          Text(resultPhrase,
          style: TextStyle(fontSize: 36,fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,

    ),
    SizedBox(height: 25,),
    TextButton(
      onPressed: resetHandler, 
      child: Text('Restart Quiz',style: TextStyle(color: Colors.red,fontSize: 28 ),),
      )
        ],
        
      ));
  }
}
