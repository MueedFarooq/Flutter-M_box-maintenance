import 'package:flutter/material.dart';
import 'package:m_box/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Signedup extends StatefulWidget {
  const Signedup({super.key});

  @override
  State<Signedup> createState() => _SignedupState();
}

class _SignedupState extends State<Signedup> {
  final first_controller = TextEditingController();
  final last_controller = TextEditingController();
  final emal_controller = TextEditingController();
  final passwordcontroler = TextEditingController();
  final ConformController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Signed up',
          style: TextStyle(color: Colors.white, fontFamily: 'rubik_medium'),
        ),
        centerTitle: true,
        backgroundColor: orangeColor,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 50),
            Textfromfield(hint_Text: 'First Name', tec: first_controller),
            Textfromfield(hint_Text: 'Last Name', tec: last_controller),
            Textfromfield(hint_Text: 'Email', tec: emal_controller),
            Textfromfield(
              hint_Text: 'Password',
              tec: passwordcontroler,
              see: true,
            ),
            Textfromfield(
              hint_Text: 'Conform Password',
              tec: ConformController,
              see: true,
            ),
            SizedBox(height: 50),
            CustomButton(
              TxT: 'Signed Up',
              onpress: () {
                if (validateForm()) {
                  if (validatePass()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Signed up successfully')),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('match the password')),
                    );
                  }
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Fill the Form'),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  bool validatePass() {
    return passwordcontroler.text == ConformController;
  }

  bool validateForm() {
    return first_controller.text.isEmpty &&
        last_controller.text.isEmpty &&
        emal_controller.text.isEmpty &&
        passwordcontroler.text.isEmpty &&
        ConformController.text.isEmpty;
  }
}
