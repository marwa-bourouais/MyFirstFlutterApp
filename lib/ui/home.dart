// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'CustomButton.dart';

class BillSplitter extends StatefulWidget {
  @override
  _BillSplitterState createState() => _BillSplitterState();
}

class _BillSplitterState extends State<BillSplitter> {
  int _tipPercentage = 0;
  int _personCounter = 1;
  double _billAmount = 0.0;

  Color _purple =   Colors.purpleAccent.shade100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        //MediaQuery is used to keep same margin whatever device is used
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
        alignment: Alignment.center,
        color: Colors.white,
        child: ListView(
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.all(20.5),
          children: <Widget>[
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
               // color: _purple.withOpacity(0.1), //Colors.purpleAccent.shade100,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Total Per Person",
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 15.0,
                       color: Colors.purpleAccent.shade700),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        "\$${calculateTotalPerPerson(_billAmount, _personCounter, _tipPercentage)}",
                        style: TextStyle(
                            fontSize: 34.9,
                            fontWeight: FontWeight.bold,
                            color: Colors.purpleAccent.shade700),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20.0),
              padding: EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(
                      color: Colors.blueGrey.shade100,
                      style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(12.0)),
              child: Column(
                children: <Widget>[
                  TextField(
                    keyboardType:
                    TextInputType.numberWithOptions(decimal: true),
                    style: TextStyle(color: _purple),
                    decoration: InputDecoration(
                        prefixText: "Bill Amount",
                        prefixIcon: Icon(Icons.attach_money)),
                    onChanged: (String value) {
                      try {
                        _billAmount = double.parse(value);
                      } catch (exception) {
                        _billAmount = 0.0;
                      }
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Split",
                        style: TextStyle(color: Colors.grey.shade700),
                      ),
                      Row(
                        children: <Widget>[
                          InkWell(
                            onTap: () {
                              setState(() {
                                if (_personCounter > 1) {
                                  _personCounter--;
                                } else {
                                  //do nothing
                                }
                              });
                            },
                            child: Container(
                              width: 40.0,
                              height: 40.0,
                              margin: EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7.0),
                                  color: _purple.withOpacity(0.1)),
                              child: Center(
                                child: Text(
                                  "-",
                                  style: TextStyle(
                                      color: _purple,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17.0),
                                ),
                              ),
                            ),
                          ),
                          Text(
                            "$_personCounter",
                            style: TextStyle(
                                color: _purple,
                                fontWeight: FontWeight.bold,
                                fontSize: 17.0),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                _personCounter++;
                              });
                            },
                            child: Container(
                              width: 40.0,
                              height: 40.0,
                              margin: EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                  color: _purple.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(7.0)),
                              child: Center(
                                child: Text(
                                  "+",
                                  style: TextStyle(
                                      color: _purple,
                                      fontSize: 17.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  //Tip
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Tip",
                        style: TextStyle(color: Colors.grey.shade700),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Text(
                          " \$${(calculateTotalTip(_billAmount, _personCounter, _tipPercentage)).toStringAsFixed(2)}",
                          style: TextStyle(
                              color: _purple,
                              fontWeight: FontWeight.bold,
                              fontSize: 17.0),
                        ),
                      )
                    ],
                  ),
                  //Slider
                  Column(
                    children: <Widget>[
                      Text(
                        "$_tipPercentage%",
                        style: TextStyle(
                            color: _purple,
                            fontSize: 17.0,
                            fontWeight: FontWeight.bold),
                      ),
                      Slider(
                          min: 0,
                          max: 100,
                          activeColor: _purple,
                          inactiveColor: Colors.grey,
                          divisions: 10,
                          //optional
                          value: _tipPercentage.toDouble(),
                          onChanged: (double newValue) {
                            setState(() {
                              _tipPercentage = newValue.round();
                            });
                          })
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  calculateTotalPerPerson(double billAmount, int splitBy, int tipPercentage) {
    var totalPerPerson =
        (calculateTotalTip(billAmount, splitBy, tipPercentage) + billAmount) /
            splitBy;

    return totalPerPerson.toStringAsFixed(2);
  }

  calculateTotalTip(double billAmount, int splitBy, int tipPercentage) {
    double totalTip = 0.0;

    if (billAmount < 0 || billAmount.toString().isEmpty || billAmount == null) {
      // no go!

    } else {
      totalTip = (billAmount * tipPercentage) / 100;
    }

    return totalTip;
  }
}

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


