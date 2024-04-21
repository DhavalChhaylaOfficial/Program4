import 'package:examdemo/Login.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  final String sid;
  final String sname;
  final String sage;
  final String group;
  final String qualification;

  ProfilePage({
    required this.sid,
    required this.sname,
    required this.sage,
    required this.group,
    required this.qualification,
  });

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columnSpacing: 20,

                columns: [
                  DataColumn(label: Center(child: Text('ID'))),
                  DataColumn(label: Center(child: Text('Name'))),
                  DataColumn(label: Center(child: Text('Age'))),
                  DataColumn(label: Center(child: Text('Gender'))),
                  DataColumn(label: Center(child: Text('Qualification'))),
                ],
                rows: [
                  DataRow(cells: [
                    DataCell(Center(child: Text(widget.sid))),
                    DataCell(Center(child: Text(widget.sname))),
                    DataCell(Center(child: Text(widget.sage))),
                    DataCell(Center(child: Text(widget.group))),
                    DataCell(Center(child: Text(widget.qualification))),
                  ]),
                ],
                border: TableBorder.all(),

              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to the login page
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginDemo()));
              },
              child: Text('Logout'),
            ),
          ],
        ),
      ),
      );
  }
}
