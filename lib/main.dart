import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:jummeng/editprofile.dart';
import 'package:jummeng/forgetpass.dart';
import 'package:jummeng/login.dart';
import 'package:jummeng/register.dart';
import 'package:jummeng/tab_bar_screen.dart';
import 'package:jummeng/tabs/home_screen.dart';
import 'package:jummeng/tabs/profile_screen.dart';
import 'package:jummeng/tabs/search_screen.dart';
import 'package:jummeng/temple_page.dart';
import 'package:jummeng/user_provider.dart';
import 'package:jummeng/welcome_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) {
            return UserProvider();
          },
        )
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'SQFlite Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          initialRoute: '/login',
          routes: {
            // '/': (context) => const BookPage(),
            '/login': (context) =>
            const MyHomePage(title: 'Flutter Demo Home Page'),
            '/forget': (context) => const ForgetpassPage(),
            '/register': (context) => const RegisterPage(),
            '/welcome': (context) => const WelcomeScreen(),
            '/homepage': (context) => HomeScreen(),        
            '/search': (context) => const SearchScreen(),
            '/tabbar': (context) => const TabBarScreen(), 
            '/profile':(context) => const ProfileScreen(title: 'โปรไฟล์'),


          },
       ),
    );
  }
}
