import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CityScreen extends StatefulWidget {
  const CityScreen({Key? key}) : super(key: key);

  @override
  State<CityScreen> createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  String? cityName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextField(
                    cursorColor: Colors.blueGrey[800],
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        hintText: 'Enter City Name',
                        hintStyle: TextStyle(color: Colors.white),
                        filled: true,
                        fillColor: Colors.black87,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide.none,
                        ),
                        icon: Icon(
                          Icons.location_city,
                          color: Colors.black,
                          size: 50.0,
                        )),
                    onChanged: (value) {
                      cityName = value;
                    },
                  ),
                ),
              ),
              FlatButton(
                  child: Text(
                    'Get Weather',
                    style: TextStyle(fontSize: 30, color: Colors.black),
                  ),
                  onPressed: () {
                    Navigator.pop(context, cityName);
                  })
            ],
          ),
        ),
      ),
    );
  }
}
