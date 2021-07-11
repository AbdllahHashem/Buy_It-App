import 'package:buy_it_app/provider/admin_mode.dart';
import 'package:buy_it_app/provider/model_hud.dart';
import 'package:buy_it_app/screens/admin_screen.dart';
import 'package:buy_it_app/screens/home_screen.dart';
import 'package:buy_it_app/screens/login_screen.dart';
import 'package:buy_it_app/screens/signup_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();

    runApp(MyApp());
  } catch (err) {
    print(err.toString());
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ModelHud>(
          create: (context) => ModelHud(),
        ),
        ChangeNotifierProvider<AdminMode>(
          create: (context) => AdminMode(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: LoginScreen.id,
        routes: {
          LoginScreen.id: (context) => LoginScreen(),
          SignUPScreen.id: (context) => SignUPScreen(),
          HomePage.id: (context) => HomePage(),
          AdminPage.id:(context)=>AdminPage(),
        },
      ),
    );
  }
}
