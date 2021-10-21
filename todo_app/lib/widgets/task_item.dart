import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TaskItem extends StatelessWidget {
  final String timeHour;
  final String title;
  final String timeActivity;
  final bool isComplete;
  final Color taskColor;

  const TaskItem(
      {Key? key,
      required this.timeHour,
      required this.title,
      required this.timeActivity,
      required this.isComplete,
      required this.taskColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  timeHour,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFF525C77),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                const Text("-"),
              ],
            ),
            const SizedBox(
              width: 60,
            ),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: taskColor.withOpacity(0.4),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          color: taskColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        timeActivity,
                        style: TextStyle(color: taskColor, fontSize: 10),
                      ),
                    ],
                  ),
                  const Icon(
                    Icons.more_vert,
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: isComplete ? Colors.red[200] : Colors.grey[200],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.done,
                    color: isComplete ? Colors.red[800] : Colors.grey[800],
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Complete",
                    style: TextStyle(
                      color: isComplete ? Colors.red[800] : Colors.grey[800],
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const Divider(
          color: Color(0xFF0442D0),
        ),
      ],
    );
  }
}
