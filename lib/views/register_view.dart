import 'package:flutter/material.dart';
import 'package:mynotes/constants/routes.dart';
import 'package:mynotes/services/auth/auth_service.dart';
import 'package:mynotes/utilities/show_error_dialog.dart';
import 'package:mynotes/services/auth/auth_exceptions.dart';
import 'dart:developer' as devtools show log;

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: Column(children: [
        TextField(
          controller: _email,
          autocorrect: false,
          enableSuggestions: false,
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(hintText: 'Enter your email here'),
        ),
        TextField(
          controller: _password,
          obscureText: true,
          autocorrect: false,
          enableSuggestions: false,
          decoration: const InputDecoration(
            hintText: 'Enter your password here',
          ),
        ),
        TextButton(
          onPressed: () async {
            final email = _email.text;
            final password = _password.text;
            try {
              final userCredential = await AuthService.firebase().createUser(
                email: email,
                password: password,
              );
              await AuthService.firebase().sendEmailVerification();
              if (!mounted) return;
              Navigator.of(context).pushNamed(verifyEmailRoute);
              devtools.log(userCredential.toString());
            } on WeakPasswordAuthException {
              await showErrorDialog(
                context,
                'Weak password',
              );
            } on EmailAlreadyInUseAuthException {
              await showErrorDialog(
                context,
                'Email already in use',
              );
            } on InvalidEmailAuthException {
              await showErrorDialog(
                context,
                'Invalid email',
              );
            } on GenericAuthException catch (e) {
              await showErrorDialog(
                context,
                'Failed to register',
              );
              devtools.log(e.toString());
            }
          },
          child: const Text('Register'),
        ),
        TextButton(
            onPressed: () {
              Navigator.of(context).pushNamedAndRemoveUntil(
                loginRoute,
                (route) => false,
              );
            },
            child: const Text('Already registered? Login here!'))
      ]),
    );
  }
}
