import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:qualif/product.dart';
import 'package:qualif/review.dart';

class Detailpage extends StatefulWidget {
  product prod;
  String username;
  Detailpage({super.key, required this.prod, required this.username});

  @override
  State<Detailpage> createState() => Detailpagestate();
}

class Detailpagestate extends State<Detailpage> {
  TextEditingController revCon = TextEditingController();

  var revs = [
    Review(username: "zetzet", review: "gudgudddddd"),
    Review(username: "bokbok", review: "naisnaisss"),
    Review(username: "rara", review: "naisssssssssss"),
    Review(username: "botbot", review: "gutssssssssssss")
  ];


  void handleCreateRev(){
    String rev = revCon.text;
    if(rev == ''){
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill all the required fields !"))
      );
      return;
    }
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Review sent"))
    );
    revs.add(Review(username: widget.username, review: rev));
    setState(() {});
    return;
  }


  @override
  Widget build(BuildContext context){
    return DefaultTabController(
      length: 2, 
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(tabs: [
            Tab(icon: Icon(Icons.ac_unit),),
            Tab(icon: Icon(Icons.comment),)
          ]),
        ),
        body: TabBarView(children: [
          
          SingleChildScrollView(
            padding: const EdgeInsets.all(10.0),
            child: Column(children: [
                Image.asset(widget.prod.image, height: 240, width: 240),
                Text(widget.prod.name, style: const TextStyle(fontWeight: FontWeight.w200, height: 2.5, fontSize: 32)),
                Text(widget.prod.desc, style: const TextStyle(fontWeight: FontWeight.w100, height: 2, fontSize: 24)),
                Text(widget.prod.price, style: const TextStyle(fontWeight: FontWeight.w200, height: 1.5, fontSize: 30)),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                  child: TextField(
                    controller: revCon,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Review',
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: handleCreateRev, child: const Text("Post Review")
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10.0),
            child: Expanded(
              child: ListView.builder(
                itemCount: revs.length,
                itemBuilder: (context, index){
                  return Column(
                    children: [
                      Text(revs[index].username,
                        style: const TextStyle(
                          height: 2,
                          fontWeight: FontWeight.w700,
                          fontSize: 20
                        ),
                      ),
                      Text("${revs[index].review}\n",
                        style: const TextStyle(
                          height: 2,
                          fontWeight: FontWeight.w500,
                          fontSize: 16
                        ),
                      ),
                    ],
                  );
                }
              )
            ),
          ),
        ]),
      )
    );
  }
}
