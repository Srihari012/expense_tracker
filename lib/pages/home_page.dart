import 'dart:math';

import 'package:expenses_tracker/pages/addexpense.dart';
import 'package:expenses_tracker/pages/main_page.dart';
import 'package:expenses_tracker/pages/stats_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  // var widgetList=[
  //   MainPage(),
  //   StatsPage(),
  // ];

  int index=0;
  late Color selected=Colors.blue;
  late Color unselected=Colors.grey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.grey[300],
      // ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30),
        ),
        child: BottomNavigationBar(
          onTap: (value){
            setState(() {
              index=value;
            });
            print(value);
          },
          backgroundColor: Colors.grey[300],
          showSelectedLabels: false,
          showUnselectedLabels: false,
          elevation: 3,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                CupertinoIcons.home,
                color: index==0?selected:unselected,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  CupertinoIcons.graph_square_fill,
                  color: index==1?selected:unselected,
                ),
                label: 'Stats'
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed:() {
          Navigator.push(
            context,
            MaterialPageRoute<void>(
              builder:(BuildContext context)=> const AddExpense_page(),
            ),
          );
        },
        shape: CircleBorder(),
        child: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors:[
                Theme.of(context).colorScheme.tertiary,
                Theme.of(context).colorScheme.secondary,
                Theme.of(context).colorScheme.primary,
              ],
              transform: const GradientRotation(pi/4),
            ),
          ),
          child: Icon(CupertinoIcons.add),
        ),
      ),
      body: index==0?MainPage():StatsPage(),
    );
  }
}