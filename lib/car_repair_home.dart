import 'package:flutter/material.dart';
import 'package:m_box/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Login_page.dart';
class CarRepairHome extends StatefulWidget {
  const CarRepairHome({super.key});
  @override
  State<CarRepairHome> createState() => _CarRepairHomeState();
}

class _CarRepairHomeState extends State<CarRepairHome> {
  String email ='';
  String role = '';
  @override
  void initState(){
    super.initState();
    loadData();
  }
  loadData()async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    email = sp.getString('email') ?? '';
    role = sp.getString('Role')?? '';
    setState(() {
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Maintenance',style: TextStyle(color: Colors.white,fontFamily: 'rubik_medium'),),
        backgroundColor: orangeColor,
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('Email',style: TextStyle(fontSize: 20),),
              Text(email,style: TextStyle(fontSize: 20),),
            ],
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('Role',style: TextStyle(fontSize: 20),),
              Text(role,style: TextStyle(fontSize: 20),),
            ],
          ),
          Divider(),
          SizedBox(height: 20,),
          CustomButton(TxT: 'Log Out', onpress: () async{
            SharedPreferences sp =await SharedPreferences.getInstance();
            sp.clear();
            Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginPage()));
          })
        ],
      ),
    );
  }
}
