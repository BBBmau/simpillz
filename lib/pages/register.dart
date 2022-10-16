import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class register extends StatelessWidget {
  const register({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            registerForm(),
          ]),
        ),
      ),
    );
  }
}

TextEditingController passController = TextEditingController();

class registerForm extends StatelessWidget {
  registerForm({Key? key}) : super(key: key);

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
