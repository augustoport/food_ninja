import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_ninja/core/bloc/app_bloc.dart';
import 'package:food_ninja/widgets/button_custom.dart';
import 'package:provider/provider.dart';

class WalkPage extends StatefulWidget {
  const WalkPage({Key? key}) : super(key: key);

  @override
  State<WalkPage> createState() => _WalkPageState();
}

class _WalkPageState extends State<WalkPage> {
  late AppBloc bloc;
  late PageController _controller;
  int page = 0;

  @override
  void initState() {
    super.initState();
    _controller = PageController();
  }

  void onNext() {
    if (this.page == 1) {
      onSkip();
      return;
    }
    _controller.nextPage(duration: Duration(milliseconds: 500), curve: Curves.easeIn);
  }

  void onSkip() {
    bloc.changeState(AppState.LOGIN);
  }

  @override
  Widget build(BuildContext context) {
    bloc = Provider.of<AppBloc>(context);
    return Scaffold(
        body: Stack(
      children: [
        PageView(
          controller: _controller,
          onPageChanged: (page) {
            setState(() {
              this.page = page;
            });
          },
          children: [
            Container(
              padding: EdgeInsets.only(left: 25, right: 25, top: 20),
              color: Colors.white,
              child: SafeArea(
                child: Column(
                  children: [
                    Image.asset('assets/images/walk01.png'),
                    SizedBox(height: 30),
                    Text(
                      'Encontre sua comida favorita aqui',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 30),
                    Text(
                      'Aqui voce encontra pratos para todos os gostos, aproveite ! :)',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 13),
                    ),
                    SizedBox(height: 40),
                    ButtonCustom(name: 'Próximo', onTap: onNext,)
                  ],
                ),
              ),
            ),
            Container(
            padding: EdgeInsets.only(left: 25, right: 25, top: 20),
              color: Colors.white,
              child: SafeArea(
                child: Column(
                  children: [
                    Image.asset('assets/images/walk02.png'),
                    SizedBox(height: 40),
                    Text(
                      'Food Ninja é a casa da sua comida favorita',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 40),
                    Text(
                      'Delicie-se com um rápido e prático delivery na porta da sua casa',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 15),
                    ),
                    SizedBox(height: 50),
                    ButtonCustom(name: 'Próximo', onTap: onNext,)
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    ));
  }
}

/*class Walk01 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25),
      color: Colors.white,
      child: SafeArea(
        child: Column(
          children: [
            Image.asset('assets/images/walk01.png'),
            SizedBox(height: 30),
            Text(
              'Encontre sua comida favorita aqui',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),
            Text(
              'Aqui voce encontra pratos para todos os gostos, aproveite ! :)',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 13),
            ),
            SizedBox(height: 40),
            InkWell(
              onTap: () => onNext(),
              child: Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 90),
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment(0.8459399938583374, 0.1310659646987915),
                      end: Alignment(-0.1310659646987915, 0.11150387674570084),
                      colors: [Color.fromRGBO(20, 190, 119, 1), Color.fromRGBO(83, 231, 139, 1)]),
                  borderRadius: BorderRadius.all(Radius.circular(20))
                ),
                child: Text('Próximo', textAlign: TextAlign.center, style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16
                ),),
              ),
            )
          ],
        ),
      ),
    );
  }
}*/

/*class Walk02 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25),
      color: Colors.white,
      child: SafeArea(
        child: Column(
          children: [
            Image.asset('assets/images/walk02.png'),
            SizedBox(height: 30),
            Text(
              'Encontre sua comida favorita aqui',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),
            Text(
              'Aqui voce encontra pratos para todos os gostos, aproveite ! :)',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 13),
            ),
            SizedBox(height: 40),
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 90),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment(0.8459399938583374, 0.1310659646987915),
                      end: Alignment(-0.1310659646987915, 0.11150387674570084),
                      colors: [Color.fromRGBO(20, 190, 119, 1), Color.fromRGBO(83, 231, 139, 1)]),
                  borderRadius: BorderRadius.all(Radius.circular(20))
              ),
              child: Text('Próximo', textAlign: TextAlign.center, style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16
              ),),
            )
          ],
        ),
      ),
    ),
  }
}*/

