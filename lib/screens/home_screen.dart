import 'package:calculator_app/constant/colors.dart';
import 'package:calculator_app/firestore_db/firestore.dart';
import 'package:calculator_app/screens/widget_data.dart';
import 'package:calculator_app/theme/theme_provider.dart';
import 'package:calculator_app/widgets/buttons.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:provider/provider.dart';

import '../widgets/tab_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  final FirestoreService firestoreService=FirestoreService();
  late TabController _tabController=TabController(vsync: this,length: 3);
  var userQuestion='';
  var userAnswer='';
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(

      length: 3,
      child: Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.background,
            title: Text('CALCULATOR APP'),
            actions: [
              IconButton(
                  onPressed: (){
                    Provider.of<ThemeProvider>(context).toggleTheme();
                  },
                  icon: Icon(Icons.brightness_3),
                tooltip: 'Change Theme',
                mouseCursor: SystemMouseCursors.click,
              )
            ],
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(40),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                child: Container(
                  height: 40,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    color: Colors.grey.shade100,
                  ),
                  child: TabBar(
                    controller: _tabController,
                    indicatorSize: TabBarIndicatorSize.tab,
                    dividerColor: Colors.transparent,
                    indicator: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.black54,
                    tabs: [
                      Tab(text:'Home',),
                      Tab(text:'History',),
                      Tab(text:'Deleted',),
                    ],

                  ),

                ),
              ),),

          ),

          drawer: Drawer(
            child: Container(
              color: Theme.of(context).colorScheme.primary,
              child: ListView(
                children: [
                  DrawerHeader(child: Center(
                    child: Text(
                      'C A L C U L A T O R   A P P',
                      style: TextStyle(
                          fontSize: 20
                      ),
                    ),
                  )),
                  ListTile(
                    leading: Icon(Icons.app_shortcut),
                    title: Text('Calculator'),
                    //onTap: Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomeScreen())),
                  ),
                  ListTile(
                    leading: Icon(Icons.change_circle_rounded),
                    title: Text('Theme'),
                    //onTap: Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomeScreen())),
                  )
                ],
              ),
            ),
          ),

          body: TabBarView(
            controller: _tabController,
            children: [
             Column(
              children: [
                Expanded(child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      SizedBox(height: 20,),
                      Container(
                          padding: EdgeInsets.all(20),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            userQuestion, style: TextStyle(fontSize: 20),)),
                      Container(
                          padding: EdgeInsets.all(20),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            userAnswer, style: TextStyle(fontSize: 20),)),
                    ],
                  ),
                )),
                Expanded(
                    flex: 2,
                    child: Container(
                      // color: AppColors.primaryColor,
                        child: GridView.builder(
                          itemCount: buttonList.length,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4),
                          itemBuilder: (BuildContext context, int index) {
                            if (index == 0) {
                              return Button1(
                                buttonTapped: () {
                                  setState(() {
                                    userQuestion = '';
                                    userAnswer='';
                                  });
                                },
                                label: buttonList[index],
                                color: Theme.of(context).colorScheme.secondary,
                                textColor: Colors.black,
                              );
                            }
                            else if (index == 1) {
                              return Button1(
                                buttonTapped: () {
                                  setState(() {
                                    userQuestion = userQuestion.substring(
                                        0, userQuestion.length - 1);
                                  });
                                },
                                label: buttonList[index],
                                color: Theme.of(context).colorScheme.secondary,
                                textColor: Colors.black,
                              );
                            }
                            else if (index == buttonList.length - 1) {
                              return Button1(
                                buttonTapped: () {
                                  setState(() {
                                    equalPressed();
                                  });
                                },
                                label: buttonList[index],
                                color: AppColors.secondaryColor,
                                textColor: Colors.black,
                              );
                            }
                            else {
                              return Button1(
                                buttonTapped: () {
                                  setState(() {
                                    userQuestion += buttonList[index];
                                  });
                                },
                                label: buttonList[index],
                                color: isOperator(buttonList[index]) ? Theme.of(context).colorScheme.onPrimary : Theme.of(context).colorScheme.onSecondary,
                                textColor: isOperator(buttonList[index]) ? Colors.black: Colors.white ,
                              );
                            }
                          },

                        )))
              ],

            ),
              Center(child: Text('History Content')),
              Center(child: Text('Deleted Content')),
            ],
          )
      ),
    );
  }
  bool isOperator(String x){
    if(x=='%'||x=='/'||x=='+'||x=='-'||x=='='||x=="x"){
      return false;
    }
    return true;
  }


void equalPressed() {
  String finalQuestion=userQuestion;
  finalQuestion=finalQuestion.replaceAll('x', '*');
  Parser p = Parser();
  Expression exp = p.parse(finalQuestion);
  ContextModel cm = ContextModel();
  double eval = exp.evaluate(EvaluationType.REAL, cm);
  userAnswer=eval.toString();
}
}