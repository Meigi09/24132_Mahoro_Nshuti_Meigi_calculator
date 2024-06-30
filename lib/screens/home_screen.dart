import 'package:calculator_app/constant/colors.dart';
import 'package:calculator_app/screens/widget_data.dart';
import 'package:calculator_app/widgets/buttons.dart';
import 'package:flutter/material.dart';

import '../widgets/tab_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var userQuestion='';
  var userAnswer='';
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: AppColors.secondary2Color,
        appBar: AppBar(
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
                child: const TabBar(
                  indicatorSize: TabBarIndicatorSize.tab,
                  dividerColor: Colors.transparent,
                  indicator: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.black54,
                  tabs: [
                    TabItem(title: 'Home', count: 0over),
                    TabItem(title: 'History', count: 3),
                    TabItem(title: 'Deleted', count: 1),
                  ],
                ),
              ),
      ),),),
      
        drawer: Drawer(
          child: Container(
            color: AppColors.primaryColor,
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
                )
             ],
            ),
          ),
        ),
        body: Column(
          children: [
            Expanded(child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children:<Widget> [
                  SizedBox(height: 20,),
                  Container(
                    padding: EdgeInsets.all(20),
                    alignment: Alignment.centerLeft,
                      child: Text(userQuestion,style: TextStyle(fontSize: 20),)),
                  Container(
                      padding: EdgeInsets.all(20),
                      alignment: Alignment.centerLeft,
                      child: Text(userAnswer,style:TextStyle(fontSize: 20),)),
                ],
              ),
            )),
            Expanded(
              flex: 2,
              child: Container(
                // color: AppColors.primaryColor,
                child: GridView.builder(
                  itemCount: buttonList.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
                  itemBuilder: (BuildContext context,int index){
                    if(index==0){
                      return Button1(
                        buttonTapped:(){
                          setState(() {
                            userQuestion='';
                          });
                        },
                        label:buttonList[index],
                        color:Colors.grey,
                        textColor: Colors.black,
                      );
                    }
                    else if(index==1){
                      return Button1(
                        buttonTapped: (){
                          setState(() {
                            userQuestion=userQuestion.substring(0,userQuestion.length-1);
                          });
                        },
                        label:buttonList[index],
                        color:Colors.grey,
                        textColor: Colors.black,
                      );
                    }
                    else if(index==2){
                      return Button1(
                        label:buttonList[index],
                        color:Colors.grey,
                        textColor: Colors.black,
                      );
                    }
                    else{
                      return Button1(
                        buttonTapped: (){
                          setState(() {
                            userQuestion+=buttonList[index];
                          });
                        },
                        label:buttonList[index],
                        color:isOperator(buttonList[index])? AppColors.primaryColor:AppColors.secondaryColor,
                        textColor: isOperator(buttonList[index])? Colors.white70:Colors.black,
                      );
                    }
                  },
      
      )))
          ],
      
        )),
    );
  }
  bool isOperator(String x){
    if(x=='%'||x=='/'||x=='+'||x=='-'||x=='='){
      return false;
    }
    return true;
  }
}