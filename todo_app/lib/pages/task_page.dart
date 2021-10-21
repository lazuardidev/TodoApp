import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/widgets/date_item.dart';
import 'package:todo_app/widgets/task_item.dart';

class TaskPage extends StatefulWidget {
  final User _user;

  const TaskPage({Key? key, required User user})
      : _user = user,
        super(key: key);

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  late User _user;

  @override
  void initState() {
    super.initState();
    _user = widget._user;
  }

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        color: const Color(0xFF0442D0),
        padding: const EdgeInsets.only(top: 37, left: 18, bottom: 15),
        child: Row(
          children: [
            _user.photoURL != null
                ? ClipOval(
                    child: Material(
                      color: Colors.grey.withOpacity(0.3),
                      child: Image.network(
                        _user.photoURL!,
                        height: 56,
                      ),
                    ),
                  )
                : ClipOval(
                    child: Material(
                      color: Colors.grey.withOpacity(0.3),
                      child: const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Icon(
                          Icons.person,
                          size: 60,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hello, ${_user.displayName}',
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFFFFFFFF),
                    ),
                  ),
                  const Text(
                    '2 Task for Today',
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 20,
                      color: Color(0xFFFABE2C),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    Widget dateToday() {
      return Container(
        margin: const EdgeInsets.only(
          top: 18,
          bottom: 15,
          left: 16,
        ),
        child: const Text(
          "Sun, Sept 14 2020",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color(0xFF0442D0),
          ),
        ),
      );
    }

    Widget dateItemList() {
      return Container(
        margin: const EdgeInsets.only(bottom: 22),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: const [
              DateItem(
                day: "S",
                dateNumber: "17",
                isHasTodo: true,
                isActive: false,
              ),
              DateItem(
                  day: "M",
                  dateNumber: "18",
                  isHasTodo: false,
                  isActive: false),
              DateItem(
                day: "T",
                dateNumber: "19",
                isHasTodo: true,
                isActive: false,
              ),
              DateItem(
                  day: "W",
                  dateNumber: "20",
                  isHasTodo: false,
                  isActive: false),
              DateItem(
                  day: "T",
                  dateNumber: "21",
                  isHasTodo: false,
                  isActive: false),
              DateItem(
                day: "F",
                dateNumber: "22",
                isHasTodo: false,
                isActive: true,
              ),
              DateItem(
                day: "S",
                dateNumber: "23",
                isHasTodo: true,
                isActive: false,
              ),
              DateItem(
                day: "S",
                dateNumber: "24",
                isHasTodo: true,
                isActive: false,
              ),
              DateItem(
                  day: "M",
                  dateNumber: "25",
                  isHasTodo: false,
                  isActive: false),
              DateItem(
                day: "T",
                dateNumber: "26",
                isHasTodo: true,
                isActive: false,
              ),
              DateItem(
                day: "W",
                dateNumber: "27",
                isHasTodo: true,
                isActive: false,
              ),
              DateItem(
                day: "T",
                dateNumber: "28",
                isHasTodo: true,
                isActive: false,
              ),
              DateItem(
                day: "F",
                dateNumber: "29",
                isHasTodo: false,
                isActive: false,
              ),
              DateItem(
                day: "S",
                dateNumber: "30",
                isHasTodo: true,
                isActive: false,
              ),
            ],
          ),
        ),
      );
    }

    Widget txtTaskList() {
      return Container(
        margin: const EdgeInsets.only(
          top: 18,
          bottom: 15,
          left: 16,
        ),
        child: const Text(
          "Task List",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color(0xFF525C77),
          ),
        ),
      );
    }

    Widget taskItemList() {
      return Container(
        margin: const EdgeInsets.only(left: 18),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: const [
              TaskItem(
                timeHour: "09.00",
                title: "Daily Stand Up",
                timeActivity: "09.00-09.30",
                isComplete: true,
                taskColor: Color(0xFF0442D0),
              ),
              TaskItem(
                timeHour: "10.00",
                title: "Daily Stand Up",
                timeActivity: "10.00-10.30",
                isComplete: false,
                taskColor: Color(0xFFFF9124),
              ),
              TaskItem(
                timeHour: "11.00",
                title: "Daily Stand Up",
                timeActivity: "11.00-1.30",
                isComplete: false,
                taskColor: Color(0xFF0442D0),
              ),
            ],
          ),
        ),
      );
    }

    return ListView(
      children: [
        header(),
        dateToday(),
        dateItemList(),
        const Divider(),
        txtTaskList(),
        taskItemList(),
      ],
    );
  }
}
