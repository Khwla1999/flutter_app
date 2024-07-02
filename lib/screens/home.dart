import 'package:best_courses/constants/functions.dart';
import 'package:best_courses/languages/ar.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            Ar.appName,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.blueAccent,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.blueGrey[900]),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 20),
                Text(
                  Ar.addStudentToSchool,
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.normal,
                      color: Colors.blueGrey[900]),
                ),
                const SizedBox(height: 20),
                CourseSelectionWidget(),
                const SizedBox(height: 10),
                Text(
                  '${Ar.rating}: 10 من  10',
                  style: TextStyle(fontSize: 20, color: Colors.blueGrey[900]),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        successSnackBar(context, message: Ar.addStudentSuccess);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                        child: Text(
                          Ar.addStudent,
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CourseSelectionWidget extends StatefulWidget {
  @override
  _CourseSelectionWidgetState createState() => _CourseSelectionWidgetState();
}

class _CourseSelectionWidgetState extends State<CourseSelectionWidget> {
  String selectedCourse = 'Mathematics';
  int selectedYear = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(60.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Text(
            Ar.chooseCourse,
            style: TextStyle(fontSize: 18, color: Colors.blueGrey[900]),
          ),
          const SizedBox(height: 10),
          DropdownButton<String>(
            value: selectedCourse,
            onChanged: (String? newValue) {
              setState(() {
                selectedCourse = newValue!;
              });
            },
            items: <String>['Mathematics', 'Science', 'History', 'Literature']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          const SizedBox(height: 20),
          Text(
            Ar.chooseYear,
            style: TextStyle(fontSize: 18, color: Colors.blueGrey[900]),
          ),
          const SizedBox(height: 10),
          DropdownButton<int>(
            value: selectedYear,
            onChanged: (int? newValue) {
              setState(() {
                selectedYear = newValue!;
              });
            },
            items: <int>[1, 2, 3, 4].map<DropdownMenuItem<int>>((int value) {
              return DropdownMenuItem<int>(
                value: value,
                child: Text('${Ar.year} $value'),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
