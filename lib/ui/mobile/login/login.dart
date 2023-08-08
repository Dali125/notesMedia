import 'package:flutter/material.dart';
import 'package:reposit_it/ui/mobile/components/mt_textfield.dart';
import 'package:reposit_it/ui/mobile/components/text_guides.dart';

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
      body: Container(
        height: height,
        width: width,
        child: Column(
          children: [
            SizedBox(
              height: 200,
            ),
            TextGuide(fontSize: 20, text: 'Email', padding: 1),
            MyTextField(
                controller: _emailText,
                hintText: 'e.g:  dali@gmail.com',
                obscureText: false),
            TextGuide(fontSize: 20, text: 'Password', padding: 1),
            MyTextField(
              controller: _PasswordText,
              hintText: '',
              obscureText: true,
              maxLines: 1,
            ),
          ],
        ),
      ),
    );
  }
}
