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

  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  String _infoText = "Informe seus dados";

  void _resetFields(){
    weightController.text = "";
    heightController.text = "";
    _infoText = "Informe seus dados";
  }

  void _calculate(){
    setState(() {
        double weight = double.parse(weightController.text);
        double height = double.parse(heightController.text) / 100;
        double imc = weight/ (height * height);
        if (imc < 18.6){
           _infoText = "Abaixo do peso (${imc.toStringAsPrecision(3)})";
        } else if(imc >=18.6 && imc < 24.9){
          _infoText = "Peso ideal (${imc.toStringAsPrecision(3)})";
        } else if(imc >=24.9 && imc < 29.9){
          _infoText = "Levemente acima do peso (${imc.toStringAsPrecision(3)})";
        } else if(imc >=29.9 && imc < 34.9){
          _infoText = "Obesidade grau I (${imc.toStringAsPrecision(3)})";
        } else if(imc >=34.9 && imc < 39.9){
          _infoText = "Obesidade grau II (${imc.toStringAsPrecision(3)})";
        } else if(imc >=40){
          _infoText = "Obesidade grau II (${imc.toStringAsPrecision(3)})";
        }
    });
  }

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
            onPressed: _resetFields,
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
              controller: weightController,
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
              controller: heightController,
            ),
            Padding(
              padding: EdgeInsets.only(top: 20, bottom: 10),
              child:
                Container(
                height: 50,
                child: 
                  RaisedButton(
                  onPressed: _calculate,
                  child: Text("Calcular", style: TextStyle(color: Colors.white, fontSize: 20),),
                  color: Colors.black,
                ),
              ),
            ),
            Text("$_infoText", 
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