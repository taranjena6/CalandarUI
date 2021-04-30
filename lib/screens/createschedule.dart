import 'package:flutter/material.dart';
import 'package:shop_app/screens/sliverappbar.dart';

class CreateSchedule extends StatefulWidget {
  @override
  _CreateSchedule createState() => _CreateSchedule();
}

class _CreateSchedule extends State<CreateSchedule> {
  DateTime pickedDate;
  String choosenValue;

  TimeOfDay time;

  @override
  void initState() {
    super.initState();
    pickedDate = DateTime.now();
    time = TimeOfDay.now();
  }

  pickDate() async {
    DateTime date = await showDatePicker(
        context: context,
        initialDate: pickedDate,
        firstDate: DateTime(DateTime.now().year - 5),
        lastDate: DateTime(DateTime.now().year + 5));

    if (date != null) {
      setState(() {
        pickedDate = date;
      });
    }
  }

  pickTime() async {
    TimeOfDay t = await showTimePicker(
      context: context,
      initialTime: time,
    );

    if (t != null) {
      setState(() {
        time = t;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    size: 35,
                    color: Colors.deepOrange,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              Padding(
                padding:
                    const EdgeInsets.only(top: 10, left: 18.0, bottom: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Create \nYour Schedule',
                      style: TextStyle(
                          fontSize: 30.0, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    Container(
                      width: size.width * 0.9,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18.0),
                          color: Color(0xFFDDE3FD)),
                      child: TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(18.0)),
                            hintText: 'Enter Description'),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    Row(
                      children: [
                        Container(
                          height: size.height * 0.07,
                          width: size.width * 0.12,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 5.0,
                              )
                            ],
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: IconButton(
                              icon: Icon(
                                Icons.calendar_today_rounded,
                                size: 30.0,
                                color: Color(0xFFFFB057),
                              ),
                              onPressed: pickDate),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Text(
                          " ${pickedDate.day}:${pickedDate.month}:${pickedDate.year}",
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Row(
                      children: [
                        Container(
                          height: size.height * 0.07,
                          width: size.width * 0.12,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 5.0,
                              )
                            ],
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: IconButton(
                            icon: Icon(
                              Icons.access_time,
                              size: 30.0,
                            ),
                            onPressed: pickTime,
                            color: Color(0xFF2BC7D7),
                          ),
                        ),
                        SizedBox(
                          width: 35,
                        ),
                        Text(
                          "${time.hour}:${time.minute}",
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.05,
                    ),
                    Text(
                      'Category',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Container(
                      width: size.width * 0.9,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18.0),
                          color: Color(0xFFDDE3FD)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                        child: DropdownButton<String>(
                          focusColor: Colors.white,
                          value: choosenValue,
                          elevation: 5,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w600),
                          iconEnabledColor: Colors.black,
                          items: <String>[
                            'Meeting',
                            'Medicine',
                            'Food',
                            'Excercise',
                            'Playing',
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: TextStyle(color: Colors.black),
                              ),
                            );
                          }).toList(),
                          hint: Text(
                            "Choose your category",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                          onChanged: (String value) {
                            setState(() {
                              choosenValue = value;
                            });
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.12,
                    ),
                    Container(
                      width: size.width * 0.9,
                      height: size.height * 0.06,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                      child: TextButton(
                        child: Text(
                          'Create',
                          style: TextStyle(fontSize: 20),
                        ),
                        style: TextButton.styleFrom(
                          primary: Colors.white,
                          backgroundColor: Colors.deepOrange,
                          onSurface: Colors.grey,
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SliverBarApp(
                                        choosenValue: choosenValue,
                                      )));
                        },
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.09,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
