import 'package:flutter/material.dart';
import 'package:shop_app/screens/calender.dart';

class SliverBarApp extends StatefulWidget {
  final String choosenValue;

  SliverBarApp({this.choosenValue});
  @override
  _SliverBarAppState createState() => _SliverBarAppState();
}

class _SliverBarAppState extends State<SliverBarApp> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                    expandedHeight: 350.0,
                    floating: false,
                    pinned: true,
                    flexibleSpace:
                        FlexibleSpaceBar(background: CalenderShow())),
              ];
            },
            body: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0)),
                  gradient: LinearGradient(
                      colors: [Color(0xFF445FD3), Color(0xFFc2e9fb)])),
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: size.width,
                    height: size.height * 0.18,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Color(0xFFDDE3FD)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0, top: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.choosenValue != null
                                ? widget.choosenValue
                                : 'null',
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.w600),
                          ),
                          Row(
                            children: [
                              Image.asset(
                                'assets/images/clock.png',
                                height: size.height * 0.03,
                              ),
                              SizedBox(
                                width: size.width * 0.02,
                              ),
                              Text(
                                'hello',
                                // "${time.hour}:${time.minute}",
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: size.width * 0.45,
                              ),
                              Image.asset(
                                'assets/images/medicine.png',
                                height: size.height * 0.08,
                              ),
                            ],
                          ),
                          Text(
                            "It\'s Medicine Time.",
                            style: TextStyle(fontSize: 20.0),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ]),
            )),
      ),
    );
  }
}
