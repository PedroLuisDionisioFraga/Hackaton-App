import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../../Database/firebase_helper.dart';
import '../../../Shared/Widgets/text_form_field.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  // TextFormField base
  final MyTextFormField basicInput = MyTextFormField.empty();

  // Controllers
  final TextEditingController username = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  // FocusNames
  final FocusNode focusUsername = FocusNode();
  final FocusNode focusEmail = FocusNode();
  final FocusNode focusPassword = FocusNode();

  void onFieldSubmitted(String text) {
    if (kDebugMode) {
      print("Email: ${email.text} e senha ${password.text}");
      print("Texto: ${text}");
      FirebaseHelper.signUp(name: username.text, email: email.text, password: password.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    final Widget usernameField = basicInput
        .copyWith(
          controller: username,
          focusName: focusUsername,
          inputAction: TextInputAction.next,
          inputType: TextInputType.name,
          capitalization: TextCapitalization.sentences,
          label: "Usuário*",
          startIcon: Icons.person,
          onFieldSubmitted: onFieldSubmitted,
        )
        .inputField();

    final Widget emailField = basicInput
        .copyWith(
          controller: email,
          focusName: focusEmail,
          inputAction: TextInputAction.next,
          inputType: TextInputType.name,
          label: "Email*",
          startIcon: Icons.email,
        )
        .inputField();

    final Widget passwordField = basicInput
        .copyWith(
          controller: password,
          focusName: focusPassword,
          inputAction: TextInputAction.done,
          inputType: TextInputType.name,
          label: "Senha*",
          startIcon: Icons.lock,
          onFieldSubmitted: onFieldSubmitted,
        )
        .inputField();
        
    return Scaffold(
      body: Center(
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8.0),
          children: [
            const SizedBox(height: 30),
            usernameField,
            const SizedBox(height: 10),
            emailField,
            const SizedBox(height: 10),
            passwordField,
          ],
        ),
      ),
    );
  }
}
