import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_ninja/core/bloc/login_bloc.dart';
import 'package:food_ninja/views/register/register_page.dart';
import 'package:food_ninja/widgets/button_custom.dart';
import 'package:food_ninja/widgets/text_field_custom.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late LoginBloc bloc;
  var _email = TextEditingController();
  var _password = TextEditingController();
  late String email;
  late String password;

  @override
  Widget build(BuildContext context) {
    bloc = Provider.of<LoginBloc>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 5.0),
              child: Image.asset('assets/images/top.png'),
            ),
            Container(
              color: Colors.white,
              padding: EdgeInsets.all(25),
              child: Column(
                children: [
                  Text(
                    'Faça Login na sua conta',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 25),
                  Container(
                      margin: EdgeInsets.symmetric(vertical: 5),
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15)),
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TextFieldCustom(
                          controller: _email,
                          hint: 'E-mail',
                          keyBoardType: TextInputType.emailAddress,
                        ),
                      )),
                  Container(
                      margin: EdgeInsets.symmetric(vertical: 5),
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15)),
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TextFieldCustom(controller: _password, hint: 'Senha', obscure: true),
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(),
                      InkWell(
                        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterPage())),
                        child: Text(
                          "Registre-se",
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Text(
                    'Ou Conecte-se com: ',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(15)), color: Color(0xFFF9F9F9)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset('assets/icons/face.svg'),
                              SizedBox(width: 15),
                              Text('Facebook')
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 30),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(15)), color: Color(0xFFF9F9F9)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset('assets/icons/google.svg'),
                              SizedBox(width: 15),
                              Text('Google')
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 25),
                  Text(
                    'Esqueceu sua senha ?',
                    style: TextStyle(fontSize: 13, color: Color.fromRGBO(20, 190, 119, 1)),
                  ),
                  SizedBox(height: 30),
                  ButtonCustom(
                    name: 'Login',
                    onTap: () async => {
                      email = _email.text,
                      password = _password.text,
                      await bloc.login(email, password, context),
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
