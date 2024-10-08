import 'package:flutter/material.dart';
import 'package:food_app/components/my_text_fields.dart';
import 'package:food_app/components/my_button.dart';
import 'package:food_app/pages/login_page.dart';
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
  final TextEditingController confirmPasswordController =
      TextEditingController();

  void register() async {
    // Get instance of auth service
    final authService = AuthService();

    // Check if passwords match
    if (passwordController.text == confirmPasswordController.text) {
      try {
        await authService.signUpWithEmailPassword(
            emailController.text, passwordController.text);
        // Successful registration, navigate back to login page
        widget.onTap?.call(); // Call onTap function to navigate back
      } catch (e) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(e.toString()),
          ),
        );
      }
    } else {
      showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          title: Text("Passwords don't match!"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
           const SizedBox(height: 50),
            Icon(Icons.lock_rounded,
                size: 100, color: Theme.of(context).colorScheme.inversePrimary),
            const SizedBox(
              height: 25,
            ),
            Text(
              "Let's Create an Account for You",
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
            // Email text field
            const SizedBox(height: 25),
            MyTextFields(
              controller: emailController,
              hintText: "Email",
              obscureText: false,
            ),

            // Password text field
            const SizedBox(height: 25),
            MyTextFields(
              controller: passwordController,
              hintText: "Password",
              obscureText: true,
            ),

            // Confirm password text field
            const SizedBox(height: 25),
            MyTextFields(
              controller: confirmPasswordController,
              hintText: "Confirm Password",
              obscureText: true,
            ),

            // Sign up button
            const SizedBox(
              height: 20,
            ),
            MyButton(
              text: "Sign Up",
              onTap: register,
            ),

            // Already have an account? Login Now
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account?",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary),
                ),
                const SizedBox(width: 4),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => LoginPage(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                              )),
                    );
                  },
                  child: Text(
                    "Login Now",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
