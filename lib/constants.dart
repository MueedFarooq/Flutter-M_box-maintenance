import 'package:flutter/material.dart';

Color orangeColor = Color(0xfff9703b);
Color WhiColor = Color(0xffE4E7eB);

class Textfromfield extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  final bool see;
  const Textfromfield({super.key, required this.hintText,required this.controller, required this.see });

  @override
  State<Textfromfield> createState() => _TextfromfieldState();
}

class _TextfromfieldState extends State<Textfromfield> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        obscureText: widget.see,
        controller: widget.controller,
        decoration: InputDecoration(
          hintText: widget.hintText,
          fillColor: WhiColor,
          filled: true,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xffE4E7eB)),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xffE4E7eB)),
          ),
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String TxT;
  final VoidCallback onpress;
 const  CustomButton({super.key,required this.TxT, required this.onpress});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: InkWell(
        onTap: onpress,
        child: Container(
          height: 50,
          width: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: orangeColor,
          ),
          child: Center(
            child: Text(
              TxT,
              style: TextStyle(
                fontSize: 18,
                fontFamily: 'Rubik Regular',
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
