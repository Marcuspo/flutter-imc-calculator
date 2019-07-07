import 'package:flutter/material.dart';

void main () {
  runApp(MaterialApp(
    home: Home(),
    debugShowCheckedModeBanner: false,
    title: "Calculadora IMC",
    ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return 
    Scaffold(
      appBar: AppBar(
        title: Text("Calculadora IMC"),
        centerTitle: true,
        backgroundColor: Colors.black,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {},

          )
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Icon(Icons.person_pin, size: 120, color: Colors.black,),
            TextField(keyboardType: TextInputType.number, 
                      decoration: InputDecoration(
                        labelText: "Peso em KG", 
                        labelStyle: TextStyle(color: Colors.black)
                      ),
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 25.0,
              ),
            ),
            TextField(keyboardType: TextInputType.number, 
                      decoration: InputDecoration(
                        labelText: "Altura em CM", 
                        labelStyle: TextStyle(color: Colors.black)
                      ),
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 25.0,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20, bottom: 10),
              child:
                Container(
                height: 50,
                child: 
                  RaisedButton(
                  onPressed: () {},
                  child: Text("Calcular", style: TextStyle(color: Colors.white, fontSize: 20),),
                  color: Colors.black,
                ),
              ),
            ),
            Text("Info", 
              textAlign: TextAlign.center, 
              style: TextStyle(
                color: Colors.black, fontSize: 25
                )
              )
          ],
        ),
      )
    );
  }
}