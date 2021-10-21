import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/pages/sign_in_page.dart';
import 'package:todo_app/utils/authentication.dart';

class SettingPage extends StatefulWidget {
  final User _user;

  const SettingPage({Key? key, required User user})
      : _user = user,
        super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  late User _user;
  bool _isSigningOut = false;

  Route _routeToSignInScreen() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          const SignInPage(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = const Offset(-1.0, 0.0);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _user = widget._user;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16.0,
            right: 16.0,
            bottom: 20.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(),
              _user.photoURL != null
                  ? ClipOval(
                      child: Material(
                        color: Colors.grey.withOpacity(0.3),
                        child: Image.network(
                          _user.photoURL!,
                          fit: BoxFit.fitHeight,
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
              const SizedBox(height: 32.0),
              Text(
                _user.displayName!,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 26,
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                '( ${_user.email!} )',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  letterSpacing: 0.5,
                ),
              ),
              const SizedBox(height: 24.0),
              _isSigningOut
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          Colors.red,
                        ),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      onPressed: () async {
                        setState(() {
                          _isSigningOut = true;
                        });
                        await Authentication.signOut(context: context);
                        setState(() {
                          _isSigningOut = false;
                        });
                        Navigator.of(context)
                            .pushReplacement(_routeToSignInScreen());
                      },
                      child: const Padding(
                        padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                        child: Text(
                          'Sign Out',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            letterSpacing: 2,
                          ),
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
