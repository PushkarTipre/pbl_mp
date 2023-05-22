import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pbl_mp/screens/signin_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const SecuHome());
}

class SecuHome extends StatelessWidget {
  const SecuHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignInScreen(),
    );
  }
}
