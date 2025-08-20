import 'package:flutter/material.dart';
import 'package:m_box/constants.dart';

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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 50),
              Textfromfield(
                hintText: 'First Name',
                controller: first_controller,
                see: false,
                validator: validator.FirstName,
              ),
              Textfromfield(
                hintText: 'Last Name',
                controller: last_controller,
                see: false,
                validator: validator.LastName,
              ),
              Textfromfield(
                hintText: 'Email',
                controller: emal_controller,
                see: false,
                validator: validator.email,
              ),
              Textfromfield(
                hintText: 'Password',
                controller: passwordcontroler,
                see: true,
                validator: validator.password,
              ),
              Textfromfield(
                hintText: 'Conform Password',
                controller: ConformController,
                see: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Conform Password is required';
                  } else if (!validatePass()) {
                    return 'Conform Password Should be Same';
                  }
                  return null;
                },
              ),
              SizedBox(height: 50),
              CustomButton(
                TxT: 'Signed Up',
                onpress: () {
                  if (_formKey.currentState!.validate()) {
                    showDialog<String>(
                      context: context,
                      builder:
                          (BuildContext context) => AlertDialog(
                            title: Text('Sign Up'),
                            content: Text('Your Account has been created'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('OK'),
                              ),
                            ],
                          ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool validatePass() {
    return passwordcontroler.text == ConformController.text;
  }
}
