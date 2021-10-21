import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:todo_app/pages/setting_page.dart';
import 'package:todo_app/pages/task_page.dart';

class HomePage extends StatefulWidget {
  final User _user;

  const HomePage({Key? key, required User user})
      : _user = user,
        super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget addButton() {
      return FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color(0xFF0442D0),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      );
    }

    Widget customBottomNav() {
      return BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          currentIndex: _currentIndex,
          onTap: (value) {
            setState(() {
              _currentIndex = value;
            });
          },
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Container(
                margin: const EdgeInsets.only(
                  top: 20,
                  bottom: 10,
                ),
                child: Icon(
                  Icons.table_rows_sharp,
                  color: _currentIndex == 0
                      ? const Color(0xFF0442D0)
                      : const Color(0xFF7F8A9C),
                ),
              ),
              label: 'Task',
            ),
            BottomNavigationBarItem(
              icon: Container(
                margin: const EdgeInsets.only(
                  top: 20,
                  bottom: 10,
                ),
                child: Icon(
                  Icons.settings,
                  color: _currentIndex == 1
                      ? const Color(0xFF0442D0)
                      : const Color(0xFF7F8A9C),
                ),
              ),
              label: 'Settings',
            ),
          ],
        ),
      );
    }

    Widget body() {
      switch (_currentIndex) {
        case 0:
          return TaskPage(
            user: widget._user,
          );
        case 1:
          return SettingPage(
            user: widget._user,
          );
        default:
          return TaskPage(
            user: widget._user,
          );
      }
    }

    return Scaffold(
      backgroundColor: const Color(0xFFFBFCFF),
      bottomNavigationBar: customBottomNav(),
      floatingActionButton: Visibility(
        visible: _currentIndex == 0 ? true : false,
        child: addButton(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: body(),
    );
  }
}
