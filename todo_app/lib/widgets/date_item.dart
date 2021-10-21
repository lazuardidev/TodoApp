import 'package:flutter/material.dart';

class DateItem extends StatelessWidget {
  final String day;
  final String dateNumber;
  final bool isHasTodo;
  final bool isActive;

  const DateItem(
      {Key? key,
      required this.day,
      required this.dateNumber,
      required this.isHasTodo,
      required this.isActive})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        left: 5,
        right: 5,
      ),
      width: 33,
      height: 83,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: isActive ? const Color(0xFF0442D0) : const Color(0xFFF0F3F8)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          isHasTodo
              ? Container(
                  width: 7,
                  height: 7,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.orange,
                  ),
                )
              : const SizedBox(
                  width: 7,
                  height: 7,
                ),
          const SizedBox(
            height: 7,
          ),
          Text(
            day,
            style: TextStyle(
                color: isActive ? Colors.white : const Color(0xFF596279),
                fontSize: 16),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            dateNumber,
            style: TextStyle(
                color: isActive ? Colors.white : const Color(0xFF7F8A9C),
                fontSize: 13),
          ),
        ],
      ),
    );
  }
}
