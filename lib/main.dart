import 'package:flutter/material.dart';
import 'package:homework/SecondPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  double height = 140;
  double weight = 70;
  double result=0;

  @override
  Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Colors.deepPurpleAccent,
    appBar: AppBar(
      centerTitle: true,
      backgroundColor: Colors.black,
      title: Text(
        "BMI CALCULATOR",
        style: TextStyle(
          fontSize: 20,
          fontStyle: FontStyle.normal,
        ),
      ),
    ),
    body: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          height: 100,
          width: 450,
          color: Colors.blueAccent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Height in cm: ${height.round()}",
                style: TextStyle(
                  fontSize: 30,
                  fontStyle: FontStyle.normal,
                ),


              ),
             Slider(value: height,min: 50,max: 200,
                 activeColor:Colors.red,
                 inactiveColor:Colors.grey,
                 onChanged: (value){
               setState(
                       () {
                         height =  value;

               }
               );
        }
        )
            ],
          ),
        ),
        Container(
          height: 90,
          width: 250,
          color: Colors.black,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Weight in kg: ${weight.round()}",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontStyle: FontStyle.normal,
                ),
              )
            ],
          ),
        ),
        Container(
          height: 70,
          width: 200,
          color: Colors.black,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(onPressed: (){
                setState(() {
                  weight++;
                });
              },
                  child: Text(
                    "+",
                    style: TextStyle(
                      color: Colors.black,
                      fontStyle: FontStyle.normal,
                      fontSize: 30,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
              ),
                     ElevatedButton(onPressed: () {
                       setState(() {
                         weight--;
                       });
                     },
                         child: Text(
                           "-",
                           style: TextStyle(
                             color: Colors.black,
                             fontSize: 30,
                           ),
                         ),
                         style: ElevatedButton.styleFrom(
                           shape: RoundedRectangleBorder(
                             borderRadius: BorderRadius.circular(30),
                           )
                         ),
                     ),
            ],
          ),
        ),
        Container(
          height: 100,
          width: 200,
          color: Colors.deepPurpleAccent,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      result = weight/(height*height/10000);
                    });
                    Navigator.push(context, MaterialPageRoute
                      (builder: (context)=>
                        SecondPage(result: result,)));

                  }
                  , child: Text(
                        "Calculate",
                        style: TextStyle(
                          color: Colors.black,
                          fontStyle: FontStyle.normal,
                          fontSize: 30,
                        ),
              ),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              )
            ],
          ),
        ),
        Container(
          height: 70,
          width: 300,
          color: Colors.pinkAccent,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "BMI= ${(result).round()}",
                style: TextStyle(
                  fontSize: 50,
                  fontStyle: FontStyle.normal,
                ),
              )
            ],
          ),

        )
      ],
    ),
  );

  }
}
