// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'CustomButton.dart';

class Wisdom extends StatefulWidget {
  const Wisdom({Key? key}) : super(key: key);

  @override
  _WisdomState createState() => _WisdomState();
}

class _WisdomState extends State<Wisdom> {
  var _index=0;
  List quotes = [
    "Two things are infinite: the universe and human stupidity; "
        "and I'm not sure about the universe.",
  "Be the change that you wish to see in the world",
    "Be who you are and say what you feel, because those who mind don't matter,"
        " and those who matter don't mind",
    "Be the change that you wish to see in the world.",
    "You've gotta dance like there's nobody watching,Love like you'll never be hurt,Sing like "
        "there's nobody listening,And live like it's heaven on earth",
    "Don’t walk in front of me… I may not follow Don’t walk behind me… I may not lead Walk beside me… just be my friend"

  ] ;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [

           Center( child: Text(quotes[_index % quotes.length])),
            Divider(thickness: 1.3),
            Padding(padding: EdgeInsets.only(top: 18.0),
            child: FlatButton.icon(onPressed:  _showQuote,
                icon : Icon( Icons.wb_sunny),
                color: Colors.greenAccent.shade700,
                label: Text("inspire me ",
                style: TextStyle(
                  color: Colors.white
                ),)))
          ],
        ),
      )
    );
  }

  void _showQuote() {

    setState(() {
      _index+=1;

    });

  }
}

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


