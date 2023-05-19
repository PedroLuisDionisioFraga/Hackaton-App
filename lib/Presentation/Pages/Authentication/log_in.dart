import 'package:flutter/material.dart';
import 'package:flutter_application_1/Presentation/Pages/main_screen.dart';
import 'package:flutter_application_1/Shared/Utils/validators_authentication.dart';
import 'package:rive/rive.dart';
import '../../../Database/firebase_helper.dart';
import '../../../Shared/Utils/screen_size.dart';
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
    formKey.currentState!.save();
    FirebaseHelper.loginWithEmail(
      email: email.text,
      password: password.text,
    );
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return const MainMenu();
        },
      ),
    );
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
          onFieldSubmitted: onFieldSubmitted,
        )
        .inputField();

    double screenHeight = ScreenSize.getHeight(context);
    double screenWidth = ScreenSize.getWidth(context);
    double releaseWidthHeight = screenWidth / screenHeight;
    double mediumWidthHeight = (screenWidth + screenHeight) / 2;
    // TODO: Fazer uma lógica pra travar a largura e altura caso a tela fique muito desproporcional
    BoxConstraints? boxConstraints() {
      if (releaseWidthHeight > 1.5) {
        return BoxConstraints(
          maxWidth: screenHeight * 0.8,
        );
      }
      return null;
    }

    return Scaffold(
      body: Column(
        children: [
          const MainButtonsMainScreen(),
          Expanded(
            child: Center(
              child: Row(
                children: [
                  const Spacer(),
                  Expanded(
                    flex: 7,
                    child: Padding(
                      padding: EdgeInsets.all(mediumWidthHeight * 0.07),
                      child: RiveAnimation.asset(
                        "Assets/Animations/log_in_animation.riv",
                        placeHolder: AspectRatio(
                          aspectRatio: 1,
                          child: Padding(
                            padding: EdgeInsets.all(mediumWidthHeight * 0.05),
                            child: const CircularProgressIndicator(),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Spacer(flex: 2),
                  Expanded(
                    flex: 3,
                    child: Container(
                      constraints: boxConstraints(),
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
                              child: ElevatedButton(
                                onPressed: () {
                                  // Não precisa do parâmetro
                                  onFieldSubmitted("_");
                                },
                                child: Text(
                                  "Fazer Login",
                                  style: Theme.of(context).textTheme.titleMedium,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
