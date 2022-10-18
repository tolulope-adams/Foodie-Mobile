import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:foodie/login.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();

}
class _SignUpFormState extends State<SignUpForm>{
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    emailTextController.dispose();
    passwordTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(
              icon: Icon(Icons.person),
              hintText: 'Email',
            ),
            controller: emailTextController,
          ),
          TextFormField(
            decoration: const InputDecoration(
              icon: Icon(Icons.lock),
              hintText: 'Password',
            ),
            controller: passwordTextController,
          ),
          TextFormField(
            decoration: const InputDecoration(
              icon: Icon(Icons.lock),
              hintText: 'Confirm Password',
            ),
            controller: passwordTextController,
          ),
          TextButton(
              onPressed: (){
                signup(emailTextController.text, passwordTextController.text);
              },
              child: const Text("Login")
          )
        ]
    );
  }

  void signup(String email, String password) {
    FirebaseAuth.instance
        .authStateChanges()
        .listen((user) {
          if(user != null){
            Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginForm()));
          }
        });
    try {
      FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }
}