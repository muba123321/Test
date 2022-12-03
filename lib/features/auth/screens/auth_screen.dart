import 'package:product_arena/common/widgets/custom_button.dart';
import 'package:product_arena/common/widgets/custom_textfield.dart';
import 'package:product_arena/constants/global_variables.dart';
import 'package:product_arena/features/auth/services/auth_service.dart';
import 'package:flutter/material.dart';

enum Auth {
  signin,
}

class AuthScreen extends StatefulWidget {
  static const String routeName = '/auth-screen';
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _signUpFormKey = GlobalKey<FormState>();
  final AuthService authService = AuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
  }

  void signUpUser() {
    authService.signUpUser(
        context: context,
        email: _emailController.text,
        password: _passwordController.text,
        name: _nameController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text.rich(TextSpan(children: <TextSpan>[
              TextSpan(
                  text: 'Product',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w900,
                      color: GlobalVariables.whiteBackgroundCOlor)),
              TextSpan(
                text: 'Arena',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                    color: GlobalVariables.whiteBackgroundCOlor),
              )
            ])),
            Container(
              padding: const EdgeInsets.all(8),
              color: const Color.fromARGB(0, 255, 255, 255),
              child: Form(
                key: _signUpFormKey,
                child: Column(children: [
                  const SizedBox(height: 10),
                  CustomTextField(
                    controller: _emailController,
                    hintText: 'Email',
                    color: GlobalVariables.whiteBackgroundCOlor,
                  ),
                  const SizedBox(height: 10),
                  CustomTextField(
                    controller: _passwordController,
                    hintText: 'Password',
                    color: GlobalVariables.whiteBackgroundCOlor,
                  ),
                  const SizedBox(height: 10),
                  CustomButton(
                    text: 'Log In',
                    onTap: () {},
                  )
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
