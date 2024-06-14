import 'package:flutter/material.dart';
import 'package:food_app/components/my_text_fields.dart';
import 'package:food_app/components/my_button.dart';
import 'package:food_app/services/auth/auth_service.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  const RegisterPage({
    super.key,
    required this.onTap,
  });

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmpasswordController =
      TextEditingController();

  void Register() async {
    //get auth seervice
    final _authService = AuthService();
    //check if pass match
    if (passwordController.text == confirmpasswordController.text) {
      try {
        await _authService.signUpWithEmailPassword(
            emailController.text, passwordController.text);
      } catch (e) {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text(e.toString()),
                ),
                );
      }
    }
    else{
      showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text("Passwords dont match!"),
                ),
                );

    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Column(
        children: [
          Icon(Icons.lock_rounded,
              size: 100, color: Theme.of(context).colorScheme.inversePrimary),
          const SizedBox(
            height: 25,
          ),
          Text(
            "Lets Create an Account for you",
            style: TextStyle(
              fontSize: 16,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),
          //email text field
          const SizedBox(height: 25),
          MyTextFields(
              controller: emailController,
              hintText: "Email",
              obscureText: false),

          //password textfield
          const SizedBox(height: 25),
          MyTextFields(
              controller: passwordController,
              hintText: "Password",
              obscureText: true),

          //confirm textfield
          const SizedBox(height: 25),
          MyTextFields(
              controller: confirmpasswordController,
              hintText: "Confirm Password",
              obscureText: true),

          //sign up button
          const SizedBox(
            height: 10,
          ),

          MyButton(
            text: "Sign UP",
            onTap: widget.onTap,
          ),

          //already have an account? Login Now
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Already have an account??",
                style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary),
              ),
              const SizedBox(width: 4),
              GestureDetector(
                onTap: widget.onTap,
                child: Text(
                  "Login Now",
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
