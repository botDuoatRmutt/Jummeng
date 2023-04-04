import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {
  final _formstate = GlobalKey<FormState>();
  String? email;
  String? password;
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.blueAccent,
                Colors.yellowAccent,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        padding: const EdgeInsets.all(15.0),
        child: Form(
          autovalidateMode: AutovalidateMode.always,
          key: _formstate,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Padding(
                    padding: EdgeInsets.only(bottom: 1),
                    child:
                    Text(
                      'จุ๊มเหม่งพาทัวร์',
                      style: TextStyle(
                        color: Colors.yellowAccent,
                        fontSize: 48,
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ),
                ],
              ),
              Image.asset(
               'assets/login.png',
                // height: 240,
                fit: BoxFit.cover,
                // opacity: 0.7,
               ),
              Column(
                children: [
                  buildTextFieldEmail(),
                  buildTextFieldPass(),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          child: const Text(
                            'สมัครสมาชิก',
                            style: TextStyle(
                              color: Colors.blueAccent,
                              fontSize: 20.0,
                              ),
                          ),
                          onTap: () {
                           Navigator.pushNamed(context, '/register'); 
                          },
                        ),
                        InkWell(
                          child: const Text(
                            'ลืมรหัสผ่าน',
                            style: TextStyle(
                              color: Colors.blueAccent,
                              fontSize: 20.0,
                              ),
                          ),
                          onTap: () {
                            Navigator.pushNamed(context, '/forget');
                          },
                        )
                      ],
                    ),
                  ),
                  loginButton(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  ElevatedButton buildEleButtonUseWithoutLogin() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.yellow,
      ),
      onPressed: () {},
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          'เข้าใช้งานโดยไม่เข้าสู่ระบบ',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }

  Padding loginButton() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
        ),
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'เข้าสู่ระบบ',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,),
          ),
        ),
        onPressed: () async {
          if (_formstate.currentState!.validate()) {
            print('Valid Form');

            _formstate.currentState!.save();

            try {
              await auth.signInWithEmailAndPassword(
                  email: email!, password: password!);

              Navigator.pushReplacementNamed(context, '/welcome');
            } on FirebaseAuthException catch (e) {
              if (e.code == 'user-not-found') {
                print('No user found for that email.');
              } else if (e.code == 'wrong-password') {
                print('Wrong password provided for that user.');
              }
            }
          } else {
            print('Invalid Form');
          }
        },
      ),
    );
  }

  Widget buildTextFieldPass() {
    return Padding(
      padding: EdgeInsets.only(bottom: 20),
      child: TextFormField(
        onSaved: (value) {
          password = value!.trim();
        },
        validator: (value) {
          if (value!.length < 8) {
            return 'Please Enter more than 8 Character';
          } else {
            return null;
          }
        },
        obscureText: true,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(),
            hintText: 'รหัสผ่าน'),
      ),
    );
  }

  Widget buildTextFieldEmail() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: TextFormField(
        textInputAction: TextInputAction.next,
        onSaved: (value) {
          email = value!.trim();
        },
        validator: (value) {
          if (!validateEmail(value!)) {
            return 'โปรดกรอกอีเมล';
          } else {
            return null;
          }
        },
        keyboardType: TextInputType.emailAddress,
        decoration: const InputDecoration(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(),
          hintText: 'อีเมล',
        ),
      ),
    );
  }

  bool validateEmail(String value) {
    RegExp regex = RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

    return (!regex.hasMatch(value)) ? false : true;
  }
}