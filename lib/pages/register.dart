import 'dart:io';
import 'dart:developer' as dev;
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:motor_flutter_starter/pages/dashboard_page.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:motor_flutter/motor_flutter.dart';
import 'package:fancy_password_field/fancy_password_field.dart';

class register extends StatelessWidget {
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

class registerForm extends StatefulWidget {
  final ResponseCallback<AuthInfo>? onSuccess;
  final ErrorCallback? onError;
  const registerForm({Key? key, this.onSuccess, this.onError})
      : super(key: key);
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<registerForm> createState() => _registerFormState();
}

class _registerFormState extends State<registerForm> {
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        sonrRegister(
          onSuccess: (ai) => _setAuthInfo(ai),
          onError: (e) {
            if (kDebugMode) {
              print(e);
            }
          },
        ),
        buttonPaths()
      ],
    );
  }
}

class buttonPaths extends GetView<RegisterWalletController> {
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
            dev.log("HELLO!");
            controller.createAccount(password: passController.text);
          },
          child: const Text(
            "Register",
            textScaleFactor: 1.2,
          ))
    ]);
  }
}

class sonrRegister extends GetView<RegisterWalletController> {
  final HandleAuthInfoCallback onSuccess;
  final ErrorCallback? onError;

  const sonrRegister({
    Key? key,
    required this.onSuccess,
    this.onError,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return controller.obx(
        (state) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.check_circle,
                  color: Colors.green,
                  size: 100,
                ),
                Text(
                  "Success! Your account has been created.",
                  style: NebulaTextStyles.h2,
                ),
                ElevatedButton(
                  onPressed: () async {
                    final credIdBase64 =
                        await controller.createCredential(state!.address);
                    if (kDebugMode) {
                      print("credIdBase64: $credIdBase64");
                    }
                    onSuccess(state);
                  },
                  child: SizedBox(
                    width: 200,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Create Keyprint",
                          style: NebulaTextStyles.button2,
                        ),
                        Icon(Icons.fingerprint),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
        onLoading: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Center(
              child: Text(
                "Setting Up...",
                style: NebulaTextStyles.display2,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
              // TODO: Replace with - Lottie.asset('assets/loader.json', width: MediaQuery.of(context).size.width * 0.8,),
              child: CircularProgressIndicator(
                  color: Colors.orangeAccent.shade700),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 32),
              child: Obx(
                () => Text(
                    "${controller.phrase} (${controller.timeElapsed.value}s)",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 17,
                      color: Colors.black,
                    )),
              ),
            ),
          ],
        ),
        onEmpty: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 100.0),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
              child: FancyPasswordField(
                decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 3),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    labelText: "Password"),
                validationRules: {
                  SpecialCharacterValidationRule(),
                  UppercaseValidationRule(),
                  MinCharactersValidationRule(8),
                },
                onFieldSubmitted: (String value) =>
                    controller.createAccount(password: value),
              ),
            ),
          ],
        ),
        onError: (error) {
          if (onError != null) {
            onError!(error ?? "Internal Error: Failed to generate wallet.");
          }
          return Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  error.toString(),
                  style: NebulaTextStyles.subtitle2.copyWith(
                      color: NebulaColors.semanticLightThemeTextDefault),
                ),
                ElevatedButton.icon(
                    onPressed: () => Get.back(),
                    icon: const Icon(Icons.arrow_back),
                    label: const Text('Return'))
              ]);
        });
  }
}
