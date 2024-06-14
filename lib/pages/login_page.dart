import 'package:flutter/material.dart';
import 'package:food_app/components/my_button.dart';
import 'package:food_app/components/my_text_fields.dart';
import 'package:food_app/pages/home_page.dart';
import 'package:food_app/services/auth/auth_service.dart';

// ignore: must_be_immutable
class LoginPage extends StatefulWidget {
  final Function()? onTap;
  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void login() async {
  // Get instance of auth service
  final _authService = AuthService();

  // Try sign in
  try {
    await _authService.signInWithEmailPassword(
      emailController.text, passwordController.text
    );
  } catch (e) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(e.toString()),
      ),
    );
  }
}

void forgotPW() {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      backgroundColor: Theme.of(context).colorScheme.surface,
      title: Text("User Tapped on Forgot Password"),
    ),
  );
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Column(
        children: [
          Icon(Icons.lock_open_rounded,
              size: 100, color: Theme.of(context).colorScheme.inversePrimary),
          const SizedBox(
            height: 25,
          ),
          Text(
            "The Hunger Box",
            style: TextStyle(
              fontSize: 30,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),
          const SizedBox(height: 25),
          MyTextFields(
              controller: emailController,
              hintText: "Email",
              obscureText: false),
          const SizedBox(height: 25),
          MyTextFields(
              controller: passwordController,
              hintText: "Password",
              obscureText: true),
          const SizedBox(
            height: 10,
          ),
          MyButton(
            text: "Sign In",
            onTap: login,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Not a member?",
                style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 8),
              ),
              const SizedBox(width: 4),
              GestureDetector(
                onTap: widget.onTap,
                child: Text(
                  "Register Now",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
