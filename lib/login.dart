import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          decoration: const InputDecoration(
            icon: Icon(Icons.person),
            hintText: 'Email',
          )
        ),
        TextFormField(
            decoration: const InputDecoration(
              icon: Icon(Icons.person),
              hintText: 'Password',
            )
        ),
        TextButton(
            onPressed: (){

            },
            child: Text("Login")
        )
      ]
    );
  }
}