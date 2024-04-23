import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/component/mybutton.dart';
import 'package:flutter_application_1/component/square_title.dart';
import 'package:flutter_application_1/component/textfield.dart';




class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _MyAppState();
}

class _MyAppState extends State<LoginPage> {
  // Text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // sign user in method
  void signUserIn() async {
    // show loading circle
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    // try signin
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      // wrong email
      if (e.code == 'user-not-found') {
        // show error to user
        wrongEmailMessage();
      }
      // wrong password
      else if (e.code == 'wrong-password') {
        // show error to user
        wrongPasswordMessage();
      }
    }
  }

  void wrongEmailMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          title: Text('Incorrect Email'),
        );
      },
    );
  }

  void wrongPasswordMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          title: Text('Incorrect Password'),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        key: const Key('scaffold_key'),
        backgroundColor: const Color(0xFFEFEEEE),
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 50),
                  // Icon
                  const Icon(
                    Icons.lock,
                    size: 100,
                  ),
                  const SizedBox(height: 50),
                  // Welcome message
                  const Text(
                    "Welcome back, you've been missed",
                    style: TextStyle(
                      color: Color.fromARGB(255, 111, 111, 111), // Text color
                      fontSize: 16, // Font size
                    ),
                  ),
                  const SizedBox(height: 25),
                  // Email text field
                  MyTextField(
                    key: const Key('email_text_field'),
                    controller: emailController,
                    hintText: 'Email',
                    obscureText: false,
                  ),
                  const SizedBox(height: 10),
                  // Password text field
                  MyTextField(
                    key: const Key('password_text_field'),
                    controller: passwordController,
                    hintText: 'Password',
                    obscureText: true,
                  ),
                  // forgot password ?
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        Text(
                          'Forgot Password?',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 25),
                  // sign in button
                  MyButton(
                    onTap: signUserIn,
                    key: const Key('sign_in_button'),
                  ),
                  const SizedBox(height: 25),
                  // or continue with
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: const Divider(
                            thickness: 0.5,
                            color: Colors.grey,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: const Text(
                            'or continue with',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                        Expanded(
                          child: const Divider(
                            thickness: 0.5,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 50),
                  // google+apple
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // google button
                      SquareTitle(imagePath: 'lib/images/googlelogo.png'),
                      const SizedBox(width: 10),
                      // apple button
                      SquareTitle(imagePath: 'lib/images/applelogo.png'),
                    ],
                  ),
                  const SizedBox(height: 50),
                  // not a member ? register now
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Not a member ?',
                        style: TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(width: 4),
                      const Text(
                        'Register now',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
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
