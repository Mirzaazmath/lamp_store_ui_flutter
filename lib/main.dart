import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lamp_shop_ui_flutter/screens/home_screen.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((value) => runApp(MyApp()));
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xffD4A056),
        primaryColorLight:const Color(0xff4A4C5C),
        scaffoldBackgroundColor:const Color(0xff333C4B)
      ),
      home: HomeScreen(),
    );
  }
}
