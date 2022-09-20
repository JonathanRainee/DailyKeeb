import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:qualif/detail.dart';
import 'package:qualif/home.dart';
import 'package:qualif/login.dart';
import 'package:qualif/product.dart';

class Productpage extends StatelessWidget {
  String username;
  int _selectedIDX = 0;
  Productpage({super.key, required this.username});

  var products = [
    product(image: "./assets/p1.jpg", name: "Meow Artisan Keycaps", desc: "Curated by kbokob", price: "Rp 350.000"),
    product(image: "./assets/p2.jpg", name: "Dragon deskmat", desc: "Feel the wrath", price: "Rp 225.000"),
    product(image: "./assets/p3.jpg", name: "Gateron milky yellow", desc: "Smooth like butter", price: "Rp 4.000"),
    product(image: "./assets/p4.jpg", name: "KBD 67 lite", desc: "Thocky case", price: "Rp 880.000"),
    product(image: "./assets/p5.jpg", name: "MAtcha Keycaps", desc: "Curated by tazetttt", price: "Rp 750.000"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(2),
        child: Expanded(
          child: ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index){
              return Column(
                children: [
                  Image.asset(products[index].image, height: 300, width: 300,),
                  Text(products[index].name,
                    style: const TextStyle(
                      height: 3,
                      fontWeight: FontWeight.bold,
                      fontSize: 32
                    )
                  ),
                  Text(products[index].desc,
                    style: const TextStyle(
                      height: 2,
                      fontWeight: FontWeight.w400,
                      fontSize: 24
                    )
                  ),
                  Text(products[index].price,
                    style: const TextStyle(
                      height: 1.5,
                      fontWeight: FontWeight.w300,
                      fontSize: 20
                    )
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 24),
                    child: ElevatedButton(
                      onPressed: (){
                        // print("l;ol");
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context){
                            return Detailpage(prod: products[index], username: username);
                          }
                        ));
                      },
                      child: const Text("Product Detail"),
                    )
                  )
                ],
              );
            }
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'hi ' + username,
          ),
          BottomNavigationBarItem(
            icon: Icon(IconData(0xe59c, fontFamily: 'MaterialIcons')),
            label: 'product',
          ),
          BottomNavigationBarItem(
            icon: Icon(IconData(0xe3b3, fontFamily: 'MaterialIcons')),
            label: 'logout',
          ),
        ],
        selectedItemColor: Colors.grey.shade600,
        // currentIndex = _selectedIDX,
        onTap: (int idx){
          switch (idx){
            case 0 :
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                builder: (context){
                    return Homepage(username: this.username);
                  },
                ), (route) => false
              );
              break;
            case 1 :
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                builder: (context){
                    return Productpage(username: this.username);
                  },
                ), (route) => false
              );
              break;
            case 2 :
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                builder: (context){
                    return LoginPage();
                  },
                ), (route) => false
              );
              break;
          }
        },
      ),
    );
  }
}