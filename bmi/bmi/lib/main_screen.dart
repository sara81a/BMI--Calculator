import 'dart:math';

import 'package:bmi/container_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' ;
import 'container_box.dart';
const activeColor= Color(0xFF566de5);
const inActiveColor=Color(0xFFffffff);

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}



enum SingingCharacter { Boy, Girl }
  class _MainScreenState extends State<MainScreen> {
    int height =180 ;
    int weight =70 ;
    int age=25 ;
    String result ="" ;
    String resultDetails ="result here" ;
    double bmi=0 ;
  @override
  SingingCharacter? _character = SingingCharacter.Boy;
  Color maleBoxColor = activeColor ;
  Color femaleBoxColor = inActiveColor ;
  void updateBoxColor(int gender) {
    if (gender == 1) {
      if (maleBoxColor == inActiveColor) {
        maleBoxColor = activeColor;
        femaleBoxColor=inActiveColor ;
      } else {
        maleBoxColor = inActiveColor;
      }
    } else {
      if (femaleBoxColor == inActiveColor) {
        femaleBoxColor = activeColor;
        maleBoxColor = inActiveColor;

      } else {
        maleBoxColor = inActiveColor;
      }
    }
  }

  String calculateBmi(int weight,int height){
     bmi =weight/pow(height/100,2) ;
    return bmi.toStringAsFixed(1)  ;
  }
  String getresult(double bmi){
    if(bmi>=25){
      return 'you have a higher than normal weight,Try to exercise more' ;
    }else if(bmi> 18.5){
      return 'you have normal weight, God job !' ;
    }
    else{
      return 'you have lowe than normal body weight , you can eat bit more' ;
    }

  }

@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI calculator"),
      ),
      body: Column(
          children: <Widget>[
      Expanded( //فيه هذا 1 بوردر جواته بس الرديو بوتن
      child: Row(
          children: <Widget>[
          Expanded(
              child:GestureDetector(
                onTap: (){
                  setState(() {
                  updateBoxColor(1) ;
            });
    } ,
          child: ContainerBox(
          boxColor: Color(0xFFffffff),
      childWidget: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[

          const Text("Please let us know your gender?"),
          ListTile(
            title: const Text('MALE'),
            leading: Radio<SingingCharacter>(
              value: SingingCharacter.Boy,
              groupValue: _character,
              onChanged: (SingingCharacter? value) {
                setState(() {
                  _character = value;
                });
              },
            ),
          ),
          ListTile(
            title: const Text('FEMAIL'),
            leading: Radio<SingingCharacter>(
              value: SingingCharacter.Girl,
              groupValue: _character,
              onChanged: (SingingCharacter? value) {
                setState(() {
                  _character = value;
                });
              },
            ),
          ),


        ],
      ),
    ),
    ),
          )

  ]
    )),

            Expanded( // هنا فيه 1 بوردر اللي بتسويه تحط الهايت بس
                    child: ContainerBox(
                      boxColor: Color(0xFFffffff),
                      childWidget: Column(
                        mainAxisAlignment:MainAxisAlignment.center ,
                        children: <Widget>[
                          Text('Height',)
                          ,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline ,
                            textBaseline:TextBaseline.alphabetic  ,
                            children: <Widget> [
                              Text(height.toString()),
                              Text('cm'), ]

                              ),
                          Slider(
                              value: height.toDouble(),
                              min: 120,
                              max: 220,
                            activeColor: activeColor,
                            inactiveColor: inActiveColor,
                            onChanged: (double newValue){
                                setState(() {
                                  height=newValue.round() ;
                                });
                            },
                              )
                            ],
                               ),
  ),
            ),



            Expanded( // هذا فيه 2 بوردر ينحط فيه الوايت والايج
                child: Row(
                  children: <Widget>[
                    Expanded( //first boarder for weight
                      child: ContainerBox(
                        boxColor: Color(0xFFffffff),
                        childWidget: Column(
                          children: <Widget>[
                            SizedBox(height: 15.0),
                            Text('weight',
                            ),
                            Text(
                              weight.toString()

                            ),
                           Row(
                              mainAxisAlignment:MainAxisAlignment.center ,
                              children:<Widget> [
                                FloatingActionButton(
                                  onPressed: (){
                                    setState((){
                                      weight++ ;
  }) ;
                                },
                                backgroundColor: activeColor,
                                child:Icon(Icons.add,color:Colors.white),
                               ),
                               SizedBox(width: 10.0,
                               ),
                               FloatingActionButton(
                                 onPressed: (){
                                   setState((){
                                     if(weight>0)
                                     weight-- ;
                                   }) ;
                                 },
                                  backgroundColor: activeColor,
                                 child:Icon(Icons.minimize,color:Colors.white),
                               ),
                             ],
                            ),
                          ]
                        ),
                      ),
                    ),

                    Expanded( // second boarder for age
                      child: ContainerBox(
                        boxColor: Color(0xFFffffff),
                        childWidget: Column(
                            children: <Widget>[
                              SizedBox(height: 15.0),
                              Text('Age',
                              ),
                              Text(
                                  age.toString()

                              ),
                              Row(
                                mainAxisAlignment:MainAxisAlignment.center ,
                                children:<Widget> [
                                  FloatingActionButton(
                                    onPressed: (){
                                      setState((){
                                        age++ ;
                                      }) ;
                                    },
                                    backgroundColor: activeColor,
                                    child:Icon(Icons.add,color:Colors.white),
                                  ),
                                  SizedBox(width: 10.0,
                                  ),
                                  FloatingActionButton(
                                    onPressed: (){
                                      setState((){
                                        if(age>0)
                                          age-- ;
                                      }) ;
                                    },
                                    backgroundColor: activeColor,
                                    child:Icon(Icons.minimize,color:Colors.white),
                                  ),
                                ],
                              ),
                            ]
                        ),
                      ),
                    ),


                  ],
                )),
//all boarder done
GestureDetector(
  onTap: () {
    setState(() {
      result= calculateBmi(weight, height) ;
      resultDetails= getresult(bmi) ;

      showDialog(
          context: context,
          builder: (BuildContext contex){
            return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),

              ),
              child:Container(
                height: 200.0,
                margin: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Result'
                    ),
                    Text(result.toString()
                    ),
                    Text(resultDetails
                    )
                  ],
                ),
              ) ,
            );
          }
      ) ;
    });

  } ,

  child:Container(
        child: Center(
          child: Text("Calculate"),

        ),
        width: double.infinity ,
        height: 80.0,
        color:activeColor,
        margin: EdgeInsets.only(top:10))

)

            //هذا حق كل الصفحة كاملة
          ],
      ),
    );
  }

  }