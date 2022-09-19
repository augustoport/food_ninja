import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_ninja/core/bloc/app_bloc.dart';
import 'package:food_ninja/views/home/home_page.dart';
import 'package:food_ninja/views/login/login_page.dart';
import 'package:food_ninja/views/register/register_page.dart';
import 'package:food_ninja/views/splash/splash_page.dart';
import 'package:food_ninja/views/walk/walk_page.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late AppBloc bloc;

  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      await bloc.initialize();
    });
  }

  @override
  Widget build(BuildContext context) {
    bloc = Provider.of<AppBloc>(context);

    switch (bloc.state) {
      case AppState.SPLASH:
        return const SplashPage();
      case AppState.WALK:
        return const WalkPage();
      case AppState.LOGIN:
        return const LoginPage();
      case AppState.HOME:
        return const HomePage();
      default:
        return Scaffold(
          body: Stack(
            children: [
              Builder(builder: (context) {
                return const HomePage();
              })
            ],
          ),
        );
    }
    // return LoginPage();
  }
}
