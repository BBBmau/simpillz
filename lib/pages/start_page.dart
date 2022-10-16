import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:motor_flutter/motor_flutter.dart';
import 'package:motor_flutter_starter/pages/dashboard_page.dart';
import 'register.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  final box = GetStorage();
  AuthInfo? _authInfo;

  void _setAuthInfo(AuthInfo? authInfo) {
    if (authInfo != null) {
      box.write('authInfo', authInfo.writeToJson());
      setState(() {
        _authInfo = authInfo;
      });
      Future.delayed(const Duration(milliseconds: 400), () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const DashboardPage()));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: Stack(children: [
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.blue,
                    Colors.green,
                  ],
                ),
              ),
            ),
            loginForm(),
          ]),
        ),
      ),
    );
  }
}

TextEditingController passController = TextEditingController();

class loginForm extends StatelessWidget {
  loginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(80, 15, 80, 25),
          child: TextField(
            keyboardType: TextInputType.number,
            controller: passController,
            decoration: const InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 3),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                labelText: "Password"),
          ),
        ),
        buttonPaths()
      ],
    );
  }
}

class buttonPaths extends StatelessWidget {
  buttonPaths({Key? key}) : super(key: key);

  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    minimumSize: const Size(80, 50),
    padding: const EdgeInsets.symmetric(horizontal: 16),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(2)),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      ElevatedButton(
          style: raisedButtonStyle,
          onPressed: () async {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const DashboardPage()),
            );
            // if (MotorFlutter.isReady) {
            //   final resp = await showDialog<AuthInfo>(
            //     context: context,
            //     builder: (BuildContext context) {
            //       final completer = Completer<AuthInfo>();
            //       return CreatePasswordPage(
            //         onError: onError,
            //         onSuccess: (ai) {
            //           Future.delayed(Duration(milliseconds: 750), () {
            //             completer.complete(ai);
            //             Navigator.of(context).pop(ai);
            //           });
            //         },
            //       );
            //     },
            //   );
            //   onSuccess?.call(resp);
            // }
          },
          child: const Text(
            "Login",
            textScaleFactor: 1.2,
          )),
      const SizedBox(height: 40),
      ElevatedButton(
          style: raisedButtonStyle,
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => register()));
          },
          child: const Text(
            "Register",
            textScaleFactor: 1.2,
          ))
    ]);
  }
}
