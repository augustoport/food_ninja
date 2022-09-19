import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_ninja/core/bloc/app_bloc.dart';
import 'package:food_ninja/core/bloc/login_bloc.dart';
import 'package:food_ninja/core/bloc/register_bloc.dart';
import 'package:food_ninja/locator.dart';
import 'package:food_ninja/views/main/main_page.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_) {
    setupLocator();
    runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AppBloc(), lazy: false),
        ChangeNotifierProvider(create: (context) => LoginBloc()),
        ChangeNotifierProvider(create: (context) => RegisterBloc()),
      ],
      child: MyApp(),
    ));
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPage(),
    );
  }
}
