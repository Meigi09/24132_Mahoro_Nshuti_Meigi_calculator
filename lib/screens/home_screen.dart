import 'package:calculatorapp/constant/colors.dart';
import 'package:calculatorapp/screens/widget_data.dart';
import 'package:calculatorapp/widgets/buttons.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary2Color,
      body: Column(
        children: [
          Expanded(child: Container()),
          Expanded(
            flex: 2,
            child: Container(
              // color: AppColors.primaryColor,
              child: GridView.builder(
                itemCount: buttonList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
                itemBuilder: (BuildContext context,int index){
                  if(index==0||index==2||index==1){
                    return Button1(
                      label:buttonList[index],
                      color:Colors.grey,
                      textColor: Colors.black,
                    );
                  }
                  else{
                    return Button1(
                      label:buttonList[index],
                      color:isOperator(buttonList[index])? AppColors.primaryColor:AppColors.secondaryColor,
                      textColor: isOperator(buttonList[index])? Colors.white70:Colors.black,
                    );
                  }
                },

    )))
        ],

      ));
  }
  bool isOperator(String x){
    if(x=='%'||x=='/'||x=='+'||x=='-'||x=='='){
      return false;
    }
    return true;
  }
}