import 'package:flutter/material.dart';
import 'package:m_box/Buyer.dart';
import 'package:m_box/Seller.dart';
import 'package:m_box/car_repair_home.dart';
import 'package:m_box/constants.dart';
import 'package:m_box/Signedup_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final EmailController = TextEditingController();
  final PasswordCont = TextEditingController();
  List<String> items = ['Repair', 'Seller', 'Buyer'];
  String? selectedItem;
  @override
  initState() {
    super.initState();
    selectedItem = items[0];
  }

  bool invalidate() {
    return EmailController.text.isEmpty || PasswordCont.text.isEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image(
                    width: 50,
                    height: 50,
                    image: AssetImage('images/logo.png'),
                  ),
                  SizedBox(width: 10),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Maintenance',
                        style: TextStyle(
                          fontFamily: 'Rubik Medium',
                          fontSize: 24,
                          color: Color(0xff203142),
                        ),
                      ),
                      Text(
                        'Box',
                        style: TextStyle(
                          fontSize: 24,
                          fontFamily: 'Rubik Medium',
                          color: Color(0xfff9703b),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 15),
              Center(
                child: Text(
                  'Log in',
                  style: TextStyle(
                    fontSize: 24,
                    fontFamily: 'Rubik Medium',
                    color: Color(0xff203142),
                  ),
                ),
              ),
              SizedBox(height: 15),
              Center(
                child: Text(
                  'Login if have any account \notherwise make another',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Rubik Regular',
                    color: Color(0xff4c5980),
                  ),
                ),
              ),
              SizedBox(height: 20),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  controller: EmailController,
                  decoration: InputDecoration(
                    hintText: 'Email',
                    prefixIcon: Icon(
                      Icons.email_outlined,
                      color: Color(0xff323f4b),
                    ),
                    fillColor: WhiColor,
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: WhiColor),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: WhiColor),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  controller: PasswordCont,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    prefixIcon: Icon(Icons.lock, color: Color(0xff323f4b)),
                    suffixIcon: Icon(Icons.visibility_off_outlined),
                    fillColor: WhiColor,
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: WhiColor),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: WhiColor),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(
                        color: Color(0xff203142),
                        fontSize: 16,
                        fontFamily: 'Rubik regular',
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              SizedBox(
                width: 240,
                child: DropdownButtonFormField<String>(
                  dropdownColor: Colors.white,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: orangeColor),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: orangeColor),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                  ),
                  value: selectedItem,
                  items:
                      items.map((String item) {
                        return DropdownMenuItem(
                          value: item,
                          child: Text(item, style: TextStyle(fontSize: 20)),
                        );
                      }).toList(),
                  onChanged: (String? newvalue) {
                    setState(() {
                      selectedItem = newvalue;
                    });
                  },
                ),
              ),
              SizedBox(height: 100),
              InkWell(
                onTap: () async {
                  if (invalidate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Enter email or password'),
                        backgroundColor: Colors.red,
                      ),
                    );
                  } else {
                    SharedPreferences sp =
                        await SharedPreferences.getInstance();
                    sp.setString('email', EmailController.text.toString());
                    sp.setString('Role', selectedItem.toString());
                    sp.setBool('islogin', true);

                    if (selectedItem == 'Repair') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CarRepairHome(),
                        ),
                      );
                    } else if (selectedItem == 'Seller') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Seller()),
                      );
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Buyer()),
                      );
                    }
                  }
                },
                child: Container(
                  height: 50,
                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: orangeColor,
                  ),
                  child: Center(
                    child: Text(
                      'LOG IN',
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Rubik Regular',
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Dont have an account?',
                    style: TextStyle(
                      color: Color(0xff4c5980),
                      fontSize: 16,
                      fontFamily: 'Rubik Regular',
                    ),
                  ),
                  SizedBox(width: 5),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Signedup(),
                        ),
                      );
                    },
                    hoverColor: orangeColor,
                    hoverDuration: Duration(seconds: 3),
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Color(0xfff9703b),
                        fontSize: 16,
                        fontFamily: 'Rubik Medium',
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
