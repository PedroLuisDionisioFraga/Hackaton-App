import 'package:flutter/material.dart';
import 'package:flutter_application_1/Presentation/Pages/main_screen.dart';
import 'package:flutter_application_1/Shared/Utils/validators_authentication.dart';
import '../../../Database/firebase_helper.dart';
import '../../../Shared/Widgets/text_form_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Chave para validar formulário
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  // TextFormField base
  final MyTextFormField basicInput = const MyTextFormField.empty();

  // Controllers
  final TextEditingController username = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();
  // FocusNames
  final FocusNode focusUsername = FocusNode();
  final FocusNode focusEmail = FocusNode();
  final FocusNode focusPassword = FocusNode();
  final FocusNode focusConfirmPassword = FocusNode();

  bool isPasswordValid = true;

  // Para mostrar ou não a senha
  bool showPassword = true;
  bool showConfirmPassword = true;
  void changingVisibilityOfPassword(String whereShowPassword) {
    setState(() {
      if (whereShowPassword == "Password") {
        showPassword = !showPassword;
      } else {
        showConfirmPassword = !showConfirmPassword;
      }
    });
  }

  void onFieldSubmitted(String text) {
    if (password.text == confirmPassword.text) {
      if (formKey.currentState!.validate()) {
        formKey.currentState!.save();
        FirebaseHelper.signUp(
          name: username.text,
          email: email.text,
          password: password.text,
        );
      }
    } else {
      // Fazer um aviso aqui
    }
  }

  @override
  Widget build(BuildContext context) {
    //* Email
    final Widget emailField = basicInput
        .copyWith(
          controller: email,
          focusName: focusEmail,
          inputAction: TextInputAction.next,
          inputType: TextInputType.name,
          label: "Email*",
          startIcon: Icons.email,
          validator: EntriesValidator.validateEmail,
        )
        .inputField();
    //* Senha
    final Widget passwordField = basicInput
        .copyWith(
          controller: password,
          focusName: focusPassword,
          inputAction: TextInputAction.next,
          inputType: TextInputType.name,
          label: "Senha*",
          startIcon: Icons.lock,
          validator: EntriesValidator.validatePassword,
          obscureText: showPassword,
          suffixIcon: IconButton(
            color: isPasswordValid ? null : Theme.of(context).colorScheme.error,
            icon: Icon(
              showPassword ? Icons.visibility : Icons.visibility_off,
            ),
            onPressed: () {
              changingVisibilityOfPassword("Password");
            },
          ),
          onEditingComplete: () {
            FocusScope.of(context).requestFocus(focusConfirmPassword);
          },
        )
        .inputField();

    return Scaffold(
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.4,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: Form(
            key: formKey,
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 27.5),
              shrinkWrap: true,
              children: [
                const SizedBox(height: 20),
                Align(
                  child: Text(
                    "Login",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                const SizedBox(height: 30),
                emailField,
                const SizedBox(height: 30),
                passwordField,
                const SizedBox(height: 30),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10, right: 15, top: 20),
                    child: ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                          setState(() {
                            isPasswordValid = true;
                          });
                          FirebaseHelper.loginWithEmail(email: email.text, password: password.text).then((value) {
                            if (value != null && value.emailVerified) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) {
                                  return const MainMenu();
                                }),
                              );
                            }
                          });
                        } else {
                          setState(() {
                            isPasswordValid = false;
                          });
                        }
                      },
                      child: const Text("Login"),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
