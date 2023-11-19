import 'package:flutter/material.dart';
import 'package:power_of_pedal/sign_in_page.dart';

import 'custom_widget/custom_function_widgets.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _handleSignUp() {
    if (_formKey.currentState!.validate()) {
      // Perform the sign-up action here
      final userName = userNameController.text;
      final password = passwordController.text;

      // Add your sign-up logic and navigation code here
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.deepPurple),
        actionsIconTheme: const IconThemeData(
          color: Colors.deepPurple
        ),
        title: const Text('Create Account'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextFormField(
                    controller: userNameController,
                    decoration: textFieldInputDecoration('Email'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a Email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: textFieldInputDecoration('Password'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a password';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    controller: confirmPasswordController,
                    obscureText: true,
                    decoration: textFieldInputDecoration('Confirm Password'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please confirm your password';
                      } else if (value != passwordController.text) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16.0),
                  customElevatedButton('Sign Up', _handleSignUp)
                ],
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Text('Already have an account?'),
              TextButton(onPressed: (){
                pushNavigation(context,SignInPage());
              }, child: Text('Sign In',style: TextStyle(decoration: TextDecoration.underline),))
            ],)
          ],
        ),
      ),
    );
  }
}
