import 'package:flutter/material.dart';
import 'package:power_of_pedal/custom_widget/custom_function_widgets.dart';
import 'package:power_of_pedal/sign_up.dart';

import 'dashboard.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _handleSignIn() {
    pushNavigation(context,DashboardPage());
    /*if (_formKey.currentState!.validate()) {
      // Perform the sign-in action here
      final userName = userNameController.text;
      final password = passwordController.text;



      // Add your sign-in logic and navigation code here
    }*/
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: userNameController,
                decoration: textFieldInputDecoration('Email'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a user name';
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
              customElevatedButton('Sign In',_handleSignIn),
              customElevatedButton('Sign Up',(){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const SignUpPage()));
              }),
            ],
          ),
        ),
      ),
    );
  }
}
