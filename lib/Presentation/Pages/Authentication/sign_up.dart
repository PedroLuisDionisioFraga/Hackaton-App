import 'package:flutter/material.dart';
import 'package:flutter_application_1/Shared/Utils/task.dart';
import 'package:flutter_application_1/Shared/Utils/validators_authentication.dart';
import '../../../Database/firebase_helper.dart';
import '../../../Shared/Widgets/text_form_field.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
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

  // Tasks de senha
  List<Task> tasks = [
    Task("Contém pelo menos um caractere especial", isCompleted: false),
    Task("Contém pelo menos um número", isCompleted: false),
    Task("Contém pelo menos uma letra maiúscula", isCompleted: false),
    Task("Contém no mínimo 7 caracteres", isCompleted: false),
  ];

  bool isPasswordValid = true;

  void checkTasks(String value) {
    setState(() {
      for (Task task in tasks) {
        switch (task.description) {
          case "Mínimo de 7 caracteres":
            task.isCompleted = value.length >= 7;
            break;
          case "Pelo menos um caractere maiúsculo":
            task.isCompleted = value.contains(RegExp(r"[A-Z]"));
            break;
          case "Pelo menos um número":
            task.isCompleted = value.contains(RegExp(r"[0-9]"));
            break;
          case "Pelo menos um caractere especial":
            task.isCompleted = value.contains(RegExp(r"[!@#$%/\^&*~(),.-?:{}|<=>]"));
            break;
        }
      }
    });
  }

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
    //* Username
    final Widget usernameField = basicInput
        .copyWith(
          controller: username,
          focusName: focusUsername,
          inputAction: TextInputAction.next,
          inputType: TextInputType.name,
          capitalization: TextCapitalization.sentences,
          label: "Usuário*",
          startIcon: Icons.person,
          validator: EntriesValidator.validateUsername,
        )
        .inputField();
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
    //* Confirmar Senha
    final Widget confirmPasswordField = basicInput
        .copyWith(
          controller: confirmPassword,
          focusName: focusConfirmPassword,
          inputAction: TextInputAction.done,
          inputType: TextInputType.name,
          label: "Confirmar Senha*",
          startIcon: Icons.lock,
          obscureText: showConfirmPassword,
          validator: (confirmPassword) {
            print(confirmPassword);
            print(password.text);
            return EntriesValidator.validateConfirmPassword(confirmPassword: confirmPassword, password: password.text);
          },
          suffixIcon: IconButton(
            color: isPasswordValid ? null : Theme.of(context).colorScheme.error,
            icon: Icon(
              showConfirmPassword ? Icons.visibility : Icons.visibility_off,
            ),
            onPressed: () {
              changingVisibilityOfPassword("Confirm Password");
            },
          ),
          onFieldSubmitted: onFieldSubmitted,
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
                    "Cadastrar-se",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                const SizedBox(height: 30),
                usernameField,
                const SizedBox(height: 30),
                emailField,
                const SizedBox(height: 30),
                passwordField,
                // const SizedBox(height: 30),
                // taskList,
                const SizedBox(height: 30),
                confirmPasswordField,
                const SizedBox(height: 30),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10, right: 15, top: 20),
                    child: ElevatedButton(
                      onPressed: () {
                        print(isPasswordValid);
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                          setState(() {
                            isPasswordValid = true;
                          });
                          FirebaseHelper.signUp(name: username.text, email: email.text, password: password.text);
                        } else {
                          setState(() {
                            isPasswordValid = false;
                          });
                        }
                      },
                      child: const Text("Cadastro"),
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
