import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Lets go')),
      backgroundColor: Theme.of(context).colorScheme.surface,
    );
  }
}
