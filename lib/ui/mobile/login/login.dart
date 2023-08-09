import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reposit_it/ui/mobile/components/mt_textfield.dart';
import 'package:reposit_it/ui/mobile/components/text_guides.dart';
import 'package:reposit_it/ui/mobile/custom_button/custom_button.dart';
import 'package:reposit_it/ui/mobile/login/logic/login_model.dart';
import 'package:reposit_it/ui/mobile/register/register_page.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailText = TextEditingController();
  final TextEditingController _PasswordText = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: height,
          width: width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 200,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: TextGuide(fontSize: 20, text: 'Email', padding: 1),
              ),
              MyTextField(
                  controller: _emailText,
                  hintText: 'e.g:  dali@gmail.com',
                  obscureText: false),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: TextGuide(fontSize: 20, text: 'Password', padding: 1),
              ),
              MyTextField(
                controller: _PasswordText,
                hintText: '',
                obscureText: true,
                maxLines: 1,
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                  child: ColorfulButton(
                      height: 70,
                      width: 150,
                      text: 'Login',
                      onTap: () {
                        userLogin(_emailText.text, _PasswordText.text);
                      })),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Center(child: Text('No Account, Click ')),
                    InkWell(
                      child: const Center(
                        child: Text(
                          'Register',
                          style: TextStyle(color: Colors.blueAccent),
                        ),
                      ),
                      onTap: () {
                        Get.to(() => const Register());
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
