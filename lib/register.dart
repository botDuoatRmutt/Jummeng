import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:jummeng/main.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}


class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
    State createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formstate = GlobalKey<FormState>();

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();

  final auth = FirebaseAuth.instance;
  final FirebaseFirestore db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
              Navigator.maybePop(context);
            },
        ),
        title: Text('สมัครสมาชิก'),
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
                    padding: EdgeInsets.only(bottom: 39),
                    child:
                    Text(
                      'สมัครสมาชิก',
                      style: TextStyle(
                        color: Colors.yellowAccent,
                        fontSize: 48,
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  buildNameField(),
                  buildEmailField(),
                  buildPasswordField(),
                  buildPhoneField(),
                  buildRegisterButton(),
                ],
              )
            ],
          ),
        ),
      ),   
    );
  }
  ElevatedButton buildRegisterButton() {
    return ElevatedButton(
        child: const Text('สมัครสมาชิก',style: TextStyle(color: Colors.black ,fontSize: 20)),
      onPressed: () async {
          if (_formstate.currentState!.validate()) {
            print('สมัครสมาชิกใหม่');

            Map<String, dynamic> data = {
              'name': name.text.trim(),
              'email': email.text.trim(),
              'password': password.text.trim(),
              'phone': phone.text.trim(),
              'profile': ''
            };
           db.collection('users').doc(email.text.trim().toString()).set(data);
        }
        try {
          final user =
              await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: email.text.trim(),
            password: password.text.trim(),
          );

          Navigator.popAndPushNamed(context, '/login');
        } on FirebaseAuthException catch (e) {
          if (e.code == 'weak-password') {
            print('The password providede is too weak');
          } else if (e.code == 'email-already-in-use') {
            print('The account already exists for that email');
          }
        } catch (e) {
          print(e);
        }
      },
    );
  }

    TextFormField buildNameField() {
    return TextFormField(
      controller: name,
      decoration: const InputDecoration(
        labelText: 'ชื่อ',
        icon: Icon(Icons.person),
      ),
      validator: (value) => value!.isEmpty ? 'ใส่ชื่อ' : null,
    );
  }

  TextFormField buildEmailField() {
    return TextFormField(
      controller: email,
      decoration: const InputDecoration(
        labelText: 'อีเมล',
        icon: Icon(Icons.email),
        hintText: 'x@x.com',
      ),
      validator: (value) => value!.isEmpty ? 'ใส่อีเมลด้วยฮะ' : null,
    );
  }

  TextFormField buildPasswordField() {
    return TextFormField(
      controller: password,
      obscureText: true,
      keyboardType: TextInputType.text,
      decoration: const InputDecoration(
        labelText: 'รหัสผ่าน',
        icon: Icon(Icons.lock),
      ),
      validator: (value) => value!.length < 8 ? 'ใส่รหัสผ่านมากกว่า 8 ตัวอักษร' : null,
    );
  }



  TextFormField buildPhoneField() {
    return TextFormField(
        controller: phone,
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          labelText: 'เบอร์โทร',
          icon: Icon(Icons.phone_android),
        ),
        validator: (value) => value!.length < 9 ? 'ใส่เบอร์ 10 หลัก' : null,  
      );
    }


}













