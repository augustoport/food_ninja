import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_ninja/views/confirm/confirm_order.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/images/home.png"), fit: BoxFit.cover),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(onTap: () => Navigator.pop(context), child: Image.asset('assets/images/Group.png')),
                SizedBox(height: 20),
                Text(
                  "Detalhes do Pedido",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                Column(
                  children: List.generate(4, (index) {
                    return Container(
                      color: Colors.white,
                      margin: EdgeInsets.symmetric(vertical: 20),
                      child: Row(
                        children: [
                          Image.asset('assets/images/product.png'),
                          SizedBox(width: 15),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Panqueca de Ervas',
                                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'Warung Herbal',
                                  style: TextStyle(fontSize: 14, color: Color(0x333B3B3B)),
                                ),
                                Text(
                                  '5',
                                  style: TextStyle(fontSize: 19, color: Color(0xFF53E88B)),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Image.asset('assets/images/Icon Minus.png'),
                              SizedBox(width: 10),
                              Text('1'),
                              SizedBox(width: 10),
                              Image.asset('assets/images/Icon Plus.png')
                            ],
                          )
                        ],
                      ),
                    );
                  }),
                ),
                Container(
                  padding: EdgeInsets.all(15),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20)), color: Color(0xFF15BE77)),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Sub-total", style: TextStyle(fontSize: 14, color: Colors.white),),
                          Text("180", style: TextStyle(fontSize: 14, color: Colors.white)),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Taxa de Entrega", style: TextStyle(fontSize: 14, color: Colors.white)),
                          Text("10", style: TextStyle(fontSize: 14, color: Colors.white)),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Desconto", style: TextStyle(fontSize: 14, color: Colors.white)),
                          Text("20", style: TextStyle(fontSize: 14, color: Colors.white)),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Total", style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),),
                          Text("150", style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold)),
                        ],
                      ),
                      InkWell(
                        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ConfirmOrder())),
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 12),
                          margin: EdgeInsets.only(bottom: 10, top: 5),
                          width: double.infinity,
                          decoration:
                              BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(10))),
                          child: Text(
                            "Encerre meu pedido",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF15BE77),
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
