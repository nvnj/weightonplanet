
import 'package:flutter/material.dart';

class Planet extends StatefulWidget {
  @override
  _PlanetState createState() => _PlanetState();
}

//mercury 0.38
//venus 0.91
//earth 1.0
//mars 0.38
//jupiter 2.34
//saturn 1.06
//uranus .92
//neptune 1.19
//pluto 0.06

class _PlanetState extends State<Planet> {
  TextEditingController _weight = new TextEditingController();
  double _newWeight = 0.0;
  String dropdownvalue = "Earth";
  String formattedOutput = "";
  FocusNode myfocusNode = new FocusNode();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    myfocusNode = FocusNode();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    myfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Weight on Planet"),
        backgroundColor: Colors.deepOrange,
        centerTitle: true,
      ),
      body: Container(
        color: Colors.deepOrange,
        child: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10.0),
            ),
            Image.asset(
              "assets/$dropdownvalue.png",
              height: 200.0,
              width: 200.0,
              fit: BoxFit.fitHeight,
            ),
            Container(
              padding: EdgeInsets.all(20.0),
              alignment: Alignment.center,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    controller: _weight,
                    focusNode: myfocusNode,
                    textInputAction: TextInputAction.go,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Enter you weight on Earth",
                      labelStyle: TextStyle(
                          color: myfocusNode.hasFocus
                              ? Colors.black
                              : Colors.black87),
                      focusColor: Colors.black87,
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Colors.green,
                      )),
                      border: OutlineInputBorder(borderSide: BorderSide()),
                      hintText: "Weight in kilogram",
                      hintStyle: TextStyle(color: Colors.black38),
                      //icon: Icon(Icons.person)
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(15.0),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0)
                    ),
                    child: DropdownButton(
                        value: dropdownvalue,
                        iconSize: 30.0,
                        elevation: 16,
                        underline: Container(
                          height: 2,
                          color: Colors.white,
                        ),
                        //iconEnabledColor: Colors.blue,
                        items: <String>[
                          "Mercury",
                          "Venus",
                          "Earth",
                          "Mars",
                          "Jupiter",
                          "Saturn",
                          "Uranus",
                          "Neptune",
                          "Pluto"
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: TextStyle(fontSize: 20.0),
                            ),
                          );
                        }).toList(),
                        onChanged: (String newValue) {
                          dropdownvalue = newValue;
                          if (_weight.text.isEmpty) {
                            formattedOutput = "Please enter your weight";
                            setState(() {});
                          } else {
                            switch (dropdownvalue) {
                              case "Mercury":
                                _newWeight = double.parse(_weight.text) * 0.38;
                                formattedOutput =
                                "Your weight on Mercury is ${_newWeight.toStringAsFixed(1)}";
                                break;
                              case "Venus":
                                _newWeight = double.parse(_weight.text) * 0.91;
                                formattedOutput =
                                "Your weight on Venus is ${_newWeight.toStringAsFixed(1)}";
                                break;
                              case "Earth":
                                _newWeight = double.parse(_weight.text);
                                formattedOutput =
                                "Your weight on Earth is ${_newWeight.toStringAsFixed(1)}";
                                break;
                              case "Mars":
                                _newWeight = double.parse(_weight.text) * 0.38;
                                formattedOutput =
                                "Your weight on Mars is ${_newWeight.toStringAsFixed(1)}";
                                break;
                              case "Jupiter":
                                _newWeight = double.parse(_weight.text) * 2.34;
                                formattedOutput =
                                "Your weight on Jupiter is ${_newWeight.toStringAsFixed(1)}";
                                break;
                              case "Saturn":
                                _newWeight = double.parse(_weight.text) * 1.06;
                                formattedOutput =
                                "Your weight on Saturn is ${_newWeight.toStringAsFixed(1)}";
                                break;
                              case "Uranus":
                                _newWeight = double.parse(_weight.text) * 0.92;
                                formattedOutput =
                                "Your weight on Uranus is ${_newWeight.toStringAsFixed(1)}.";
                                break;
                              case "Neptune":
                                _newWeight = double.parse(_weight.text) * 1.19;
                                formattedOutput =
                                "Your weight on Neptune is ${_newWeight.toStringAsFixed(1)}";
                                break;
                              case "Pluto":
                                _newWeight = double.parse(_weight.text) * 0.06;
                                formattedOutput =
                                "Your weight on Pluto is ${_newWeight.toStringAsFixed(1)}";
                                break;
                              default:
                                _newWeight = double.parse(_weight.text);
                                formattedOutput =
                                "Your weight on Earth is ${_newWeight.toStringAsFixed(1)}";
                                break;
                            }
                            setState(() {
                              debugPrint(dropdownvalue);
                            });
                          }
                        }),
                  ),

                  Padding(
                    padding: EdgeInsets.all(10.0),
                  ),
                  Text(
                    _weight.text.toString().isEmpty
                        ? "Please enter the weight"
                        : formattedOutput + " kg",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
