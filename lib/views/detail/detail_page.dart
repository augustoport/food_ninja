import 'package:flutter/material.dart';
import 'package:food_ninja/views/order/order.dart';
import 'package:food_ninja/widgets/button_custom.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Container(
        child: Column(
          children: [
            Center(
                child: Image.asset(
              "assets/images/hamburguer.jpg",
              fit: BoxFit.cover,
            )),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(25),
                decoration: BoxDecoration(
                    color: Color(0xFFF9F9F9),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    )),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(20)), color: Color(0x4453E88B)),
                          child: Text(
                            "Popular",
                            style: TextStyle(fontSize: 12, color: Color(0xFF308B52)),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 15,
                          ),
                        ),
                        Row(
                          children: [
                            Image.asset('assets/images/Location Icon.png'),
                            Image.asset('assets/images/Love Icon.png'),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Hamburguer Angus Premium',
                      style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 15),
                    Row(
                      children: [
                        Image.asset('assets/images/Icon Star.png'),
                        SizedBox(width: 5),
                        Text('4.5'),
                        SizedBox(width: 15),
                        Image.asset('assets/images/shopping-bag 1.png'),
                        SizedBox(width: 5),
                        Text('4.5')
                      ],
                    ),
                    SizedBox(height: 35),
                    Text('Prato delicioso, feito com muito carinho por um de nossos parceiros '),
                    SizedBox(height: 35),
                    Text(
                        'Hamburguer angus, feito como churrasco, com carne macia e suculenta, incrementado com ingredientes frescos'),
                    SizedBox(height: 35),
                    Text(
                        'Tudo isso por um preço acessivel e com condições para o consumidor'),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 20.0),
              color: Color(0xFFF9F9F9),
              child: ButtonCustom(
                name: 'Adicionar ao Carrinho',
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => OrderPage())),
              ),
            )
          ],
        ),
      ),
    );
  }
}
