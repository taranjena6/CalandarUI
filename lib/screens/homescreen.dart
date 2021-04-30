import 'package:flutter/material.dart';
import 'package:shop_app/screens/calender.dart';
import 'package:shop_app/screens/createschedule.dart';
import 'package:shop_app/screens/sliverappbar.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFDFE2E9),
        floatingActionButton: FloatingActionButton(
          child: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [Colors.deepOrangeAccent, Colors.deepOrange],
              ),
            ),
            child: Icon(
              Icons.add,
              size: 40.0,
            ),
          ),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => CreateSchedule()));
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
            shape: CircularNotchedRectangle(),
            notchMargin: 10,
            child: Container(
              height: size.height * 0.09,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SliverBarApp()));
                    },
                    child: Image.asset(
                      'assets/images/task-list.png',
                      height: size.height * 0.1,
                      width: size.width * 0.100,
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
