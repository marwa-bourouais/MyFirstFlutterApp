// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'CustomButton.dart';
class BizCard extends StatelessWidget {
  const BizCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Business card"),
            centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        child: Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            _getCard(),
            _getAvatar()

    ],
      ),
    ));
  }

  Container _getCard() {
     return Container (
       width: 350,
       height: 200,
       margin: EdgeInsets.all(50.0),
       decoration: BoxDecoration(
         color: Colors.pinkAccent.shade700,
         borderRadius: BorderRadius.circular(4.5)
       ),
       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: <Widget>[
           Text(" Marwa Bourouais",style: TextStyle(
             fontSize: 20.9,
             fontWeight: FontWeight.w500,
             color: Colors.white
           ),),
           Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: <Widget>[
                 Icon(Icons.person_outline),
                 Text("T:@buildappswithmarwa" )
               ]

           )

         ],
       ),

     );
  }

  Container _getAvatar() {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
          color: Colors.pinkAccent.shade700,
          borderRadius: BorderRadius.all(Radius.circular(50.0)),
        border: Border.all(color: Colors.redAccent, width: 1.2),
        image:DecorationImage(image: NetworkImage("https://picsum.photos/200/300"),
        fit: BoxFit.cover)

      ),
    );
  }
}

class ScafoldExample extends StatelessWidget {
  _tapButton() {
    debugPrint("Another button clicked");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My App"),
        centerTitle: true,
        backgroundColor: Colors.amberAccent.shade400,
        actions: [
          IconButton(
              onPressed: () => {debugPrint("Email Button pressed !")},
              icon: Icon(Icons.email)),
          IconButton(onPressed: _tapButton, icon: Icon(Icons.phone))
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items:
        [
          BottomNavigationBarItem(icon: Icon(Icons.person_search), title : Text("first")),
          BottomNavigationBarItem(icon: Icon(Icons.account_balance), title : Text("second")),
        ],
        onTap: (int index) => debugPrint("tapping on item number : $index  "),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.greenAccent,
        onPressed: () { debugPrint("tapping on floating button "); },
        child: Icon(Icons.plus_one)
      ),
      body: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: <Widget>[
              CustomButton()

            ],
          )),
      //backgroundColor: Colors.blueGrey.shade300,
    );
  }
}


