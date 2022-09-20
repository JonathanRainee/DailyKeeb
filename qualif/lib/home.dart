import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:qualif/login.dart';
import 'package:qualif/products.dart';
import 'package:qualif/theme.dart';

class Homepage extends StatelessWidget {
  String username;
  Homepage({super.key, required this.username});

  var images = [ "./assets/home1.jpg", "./assets/home2.jpg", "./assets/home3.jpg", "./assets/home4.jpg" ];

  int _selectedIDX = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("DailyKeeb"),
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: PopupMenuButton(
              child: const Center(child: Icon(Icons.more_horiz_outlined)),
              itemBuilder: (context){
                return List.generate(
                  1, (index) => (PopupMenuItem(
                    child: const Text("Theme"),
                    onTap: (){
                      ThemeProvider themeProvider =
                        Provider.of<ThemeProvider>(context,
                          listen: false
                        );
                        themeProvider.changeTheme();
                    },
                  )));
              },
            ),
            )
        ]
      ),
      backgroundColor: Color(0xffebebeb),
      body: Column(
        children: [
          CarouselSlider(
            items: images.map((e)=>Image.asset(e)).toList(), 
            options: CarouselOptions(
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 5)
            )
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              "DailyKeeb is an online shop that provides all of your keyboard needs from services like soldering, stabilizing, and of course we also provides comissional build.\n\nAnd also products from keycaps, switches, lube etc.\n\nWe provide the best services and products because we want your keyboard is precious to you just like ours to us",
              style: TextStyle(fontSize: 19.0),
            ),
          )
        ],
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