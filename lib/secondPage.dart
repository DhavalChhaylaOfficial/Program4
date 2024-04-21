import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:examdemo/ProfilePage.dart';

class SecondPage extends StatefulWidget {
  var name;

  SecondPage(this.name);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  TextEditingController sno = TextEditingController();
  TextEditingController sname = TextEditingController();
  TextEditingController sage = TextEditingController();
  TextEditingController qualification = TextEditingController();
  String male = 'Male';
  String female = 'Female';
  String group = 'g';

  bool isCheck1 = false;
  bool isCheck2 = false;
  bool isCheck3 = false;
  bool isCheck4 = false;

  String buildSelectedGraduations() {
    String selectedGraduations = "";
    if (isCheck1) selectedGraduations += "10, ";
    if (isCheck2) selectedGraduations += "12, ";
    if (isCheck3) selectedGraduations += "Graduate, ";
    if (isCheck4) selectedGraduations += "Post Graduate";
    return selectedGraduations;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false, //2
        home: Scaffold(
            backgroundColor: Colors.white, //3
            appBar: AppBar(
              title: Text("Second Page"),
            ),
            body: SingleChildScrollView(
              child: Center(
                //7
                child: Column(
                    //4
                    //mainAxisAlignment: MainAxisAlignment.center, //6
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Welcome: ' + widget.name,
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 18,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextFormField(
                                  readOnly: true,
                                  decoration: InputDecoration(
                                      icon: Icon(Icons.password),
                                      border: OutlineInputBorder(),
                                      hintText: widget.name),
                                ),
                                SizedBox(
                                  height: 18,
                                ),
                                TextFormField(
                                  controller: sname,
                                  decoration: InputDecoration(
                                    icon: Icon(Icons.account_circle_sharp),
                                    border: OutlineInputBorder(),
                                    labelText: 'Student name',
                                  ),
                                ),
                                SizedBox(
                                  height: 18,
                                ),
                                TextFormField(
                                  keyboardType: TextInputType.number,
                                  controller: sage,
                                  decoration: InputDecoration(
                                    icon: Icon(Icons.access_time),
                                    border: OutlineInputBorder(),
                                    labelText: 'Student age',
                                  ),
                                ),
                                SizedBox(
                                  height: 18,
                                ),
                                Row(
                                  children: [
                                    Checkbox(
                                      value: isCheck1,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          isCheck1 = value!;
                                        });
                                      },
                                    ),
                                    Text("10"),
                                    Checkbox(
                                      value: isCheck2,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          isCheck2 = value!;
                                        });
                                      },
                                    ),
                                    Text("12"),
                                    Checkbox(
                                      value: isCheck3,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          isCheck3 = value!;
                                        });
                                      },
                                    ),
                                    Text("UG"),
                                    Checkbox(
                                      value: isCheck4,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          isCheck4 = value!;
                                        });
                                      },
                                    ),
                                    Text("PG"),
                                  ],
                                ),
                                SizedBox(
                                  height: 18,
                                ),
                                ListTile(
                                  title: Text('Male'),
                                  leading: Radio(
                                      value: male,
                                      groupValue: group,
                                      onChanged: (value) {
                                        setState(() {
                                          group = value!;
                                        });
                                      }),
                                ),
                                ListTile(
                                  title: Text('Female'),
                                  leading: Radio(
                                      value: female,
                                      groupValue: group,
                                      onChanged: (value) {
                                        setState(() {
                                          group = value!;
                                        });
                                      }),
                                ),
                                ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ProfilePage(
                                                        sid: widget.name,
                                                        sname: sname.text
                                                            .toString(),
                                                        sage: sage.text
                                                            .toString(),
                                                        qualification: buildSelectedGraduations(),
                                                        group:
                                                            group.toString())));
                                      });
                                    },
                                    child: Text("Submit")),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ]),
              ),
            )));
  }
}
