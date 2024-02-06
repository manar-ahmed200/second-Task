import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../shared/components/app_button.dart';
import '../shared/components/app_settings.dart';
import '../shared/components/component.dart';
import 'home_page_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var formKey = GlobalKey<FormState>();

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  bool isPasswordShow = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  Image.network(
                    "https://w7.pngwing.com/pngs/537/866/png-transparent-flutter-hd-logo.png",
                    width: 300,
                    height: 150,
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  defaultTextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    label: 'Email',
                    prefix: Icons.email,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  defaultTextFormField(
                    controller: passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    label: 'Password',
                    prefix: Icons.lock,
                    isPassword: isPasswordShow,
                    suffix: isPasswordShow
                        ? Icons.visibility
                        : Icons.visibility_off,
                    suffixPressed: () {
                      setState(() {
                        isPasswordShow = !isPasswordShow;
                      });
                    },
                  ),
                  SizedBox(height: 16.0),
                  AppButton(
                    label: "Log in",
                    color: Colors.blue[300]!,
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                        if (kDebugMode) {
                          print("Logged in");
                        }
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) => WelcomePage(
                        //             phoneNumber: phoneNumberController.text,
                        //           )),
                        // );
                        final SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        await prefs.setString(
                            AppSettings.emailSharedPrefsKey,
                            emailController.text);
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomePage()),
                        );
                        // phoneNumberController.clear();
                        passwordController.clear();
                      }
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Text(
                    'Forgot Password? No Tap me',
                    style: TextStyle(fontSize: 18),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  AppButton(
                    label: "No account, sign up",
                    color: Colors.grey,
                    onTap: () {
                      if (kDebugMode) {
                        print("Sign up");
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
