import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('restaurantes').snapshots(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return  Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 30),
              decoration:
              BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/home.png'), fit: BoxFit.cover)),
              child: SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Expanded(
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
                          SizedBox(width: 8),
                          Container(
                            padding: EdgeInsets.all(8),
                            decoration:
                            BoxDecoration(color: Color(0x33FF9012), borderRadius: BorderRadius.all(Radius.circular(8))),
                            child: SvgPicture.asset('assets/icons/filter.svg'),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Text("Restaurantes Populares", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
                      SizedBox(height: 25),
                      GridView.count(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        children: snapshot.data!.docs.map((p) {
                          return InkWell(
                            onTap: () => {},
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 7),
                              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 25),
                              decoration:
                              BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(20))),
                              child: Column(
                                children: [
                                  Image.network(p['foto'], width: 100,),
                                  Text(
                                    p['nome'],
                                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                  ),
                                  Text(p['distancia'] + " " + "Km", style: TextStyle(fontSize: 13, color: Color(0x66000000)))
                                ],
                              ),
                            ),
                          );
                        }).toList(),
                      )
                    ],
                  ),
                ),
              ),
            );
          })
    );
  }
}
