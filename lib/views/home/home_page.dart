import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_ninja/views/detail/detail_page.dart';
import 'package:food_ninja/views/order/order.dart';
import 'package:food_ninja/views/search/search_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
      children: [
          StreamBuilder(
            stream: FirebaseFirestore.instance.collection('restaurantes').snapshots(),
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 30),
                decoration:
                    BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/home.png'), fit: BoxFit.cover)),
                child: SafeArea(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Encontre sua\ncomida favorita',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 31,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(20)),
                                color: Colors.white,
                              ),
                              child: SvgPicture.asset('assets/icons/notification.svg'),
                            )
                          ],
                        ),
                        SizedBox(height: 15),
                        Row(
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: () =>
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => SearchPage())),
                                child: Container(
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: Color(0x33FF9012),
                                    borderRadius: BorderRadius.all(Radius.circular(10)),
                                  ),
                                  child: Row(
                                    children: [
                                      SvgPicture.asset('assets/icons/search.svg', width: 18),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 8),
                            Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  color: Color(0x33FF9012), borderRadius: BorderRadius.all(Radius.circular(8))),
                              child: SvgPicture.asset('assets/icons/filter.svg'),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Container(
                          decoration: BoxDecoration(
                              color: Color(0xFF15BE77), borderRadius: BorderRadius.all(Radius.circular(20))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset('assets/images/Image.png'),
                              SizedBox(width: 15),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Oferta especial de Outubro',
                                        style: TextStyle(fontSize: 17, color: Colors.white, fontWeight: FontWeight.bold)),
                                    SizedBox(height: 20),
                                    Container(
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(5))),
                                      child: Text(
                                        'Compre Agora',
                                        style: TextStyle(
                                            color: Color(0xFF15BE77), fontSize: 10, fontWeight: FontWeight.bold),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Restaurantes Pertos',
                              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Veja Mais',
                              style: TextStyle(fontSize: 12, color: Color(0x99FF7C32)),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: snapshot.data!.docs.map((r) {
                              return InkWell(
                                onTap: () =>
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage())),
                                child: Container(
                                  margin: EdgeInsets.symmetric(horizontal: 7),
                                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 25),
                                  decoration: BoxDecoration(
                                      color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(20))),
                                  child: Column(
                                    children: [
                                      Image.network(
                                        r['foto'],
                                        scale: 7,
                                      ),
                                      Text(
                                        r['nome'],
                                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                      ),
                                      Text(r['distancia'] + " " + "Km",
                                          style: TextStyle(fontSize: 13, color: Color(0x66000000)))
                                    ],
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Menu Popular',
                              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            InkWell(
                              onTap: () {},
                              child: Text(
                                'Veja Mais',
                                style: TextStyle(fontSize: 12, color: Color(0x99FF7C32)),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
          StreamBuilder(
              stream: FirebaseFirestore.instance.collection('pratos_populares').snapshots(),
              builder: (BuildContext context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return Container(
                  padding: EdgeInsets.all(20),
                  color: Colors.white,
                  child: Column(
                    children: snapshot.data!.docs.map((p) {
                      return InkWell(
                        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage())),
                        child: Container(
                          padding: EdgeInsets.all(5),
                          margin: EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            children: [
                              Image.network(p['foto'], scale: 6,),
                              SizedBox(width: 15),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      p['nome'],
                                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height: 3),
                                    Text(
                                      p['restaurante'],
                                      style: TextStyle(fontSize: 14, color: Color(0x663B3B3B)),
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                "\$" + "" + p['valor'],
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: Color(0xFFFEAD1D)),
                              )
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                );
              })
      ],
    ),
        ));
  }
}
