import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main(){
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);
 

  @override
  Widget build(BuildContext context) {
     
    return MaterialApp(
      title: "Simple Calculator",
      debugShowCheckedModeBanner: false,
      home: Calculator(),
    );

  }
}

class Calculator extends StatefulWidget {
  

  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  @override
  Widget build(BuildContext context) {
    
    //double height=MediaQuery.of(context).size.height;
    //double width=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("Calculator",
        style: TextStyle(fontSize: 26,color: Colors.black,fontWeight: FontWeight.bold),
        ),
        elevation: 0.0,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(10.0),
              alignment: Alignment.bottomRight,
              child: Text(text,
              style: TextStyle(
                fontSize: 26,fontWeight: FontWeight.w800,
              ),
              ),
            )
            ),
          Row(
              children: [
                customOutlineButton("CLEAR"),
                customOutlineButton("DEL"),
                
              ],
            ),
          Row(
              children: [
                customOutlineButton("7"),
                customOutlineButton("8"),
                customOutlineButton("9"),
                customOutlineButton("+"),
              ],
            ),
          Row(
              children: [
                customOutlineButton("4"),
                customOutlineButton("5"),
                customOutlineButton("6"),
                customOutlineButton("-"),
              ],
            ),
          Row(
              children: [
                customOutlineButton("1"),
                customOutlineButton("2"),
                customOutlineButton("3"),
                customOutlineButton("x"),
              ],
            ),
          Row(
              children: [
                customOutlineButton("0"),
                customOutlineButton("."),
                customOutlineButton("/"),
                customOutlineButton("="),
              ],
            ),
          
        SizedBox(height: 20,)   
          

        ]

      ),
    );
  }

  Widget customOutlineButton(String val) {
    return Expanded(
      child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            padding: EdgeInsets.all(20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            backgroundColor: Colors.black12
          ),
          //padding: EdgeInsets.all(25),   
          onPressed: ()=>btnClicked(val),
          child: Text(val,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700),),
          ),
    );
  }

  String text="";

  String res="0";

  void btnClicked(String val){
      if(val=="CLEAR"){
        res="";
        
      }
      else if(val=="DEL"){
        res=text.substring(0,text.length-1);
      }
      else if(val=="="){
        try{
          Parser p = new Parser();
          Expression exp= p.parse(text);
          ContextModel cn=ContextModel();
          res= '${exp.evaluate(EvaluationType.REAL, cn)}';
          
        }catch(e){
          res="Error";
        }
      }
      else{
      res=text+val;
      }
      setState((){
        text=res;
      });
  }
}

