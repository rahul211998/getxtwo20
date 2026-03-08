import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';

class CountryCodePickerScreen extends StatefulWidget {
  const CountryCodePickerScreen({super.key});

  @override
  State<CountryCodePickerScreen> createState() => _CountryCodePickerScreenState();
}

class _CountryCodePickerScreenState extends State<CountryCodePickerScreen> {
  String? name;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CountryCodePickerScreen"),
      ),
      body: Column(
        children: [
          Container(
            child: Text("hellos"),
          ),
            CountryCodePicker(
              onChanged: (myCountryCode) {
                print("myCountryCode.toString() ${myCountryCode.toString()}");
                setState(() {
                  name = myCountryCode.name;
                });
              } ,
              showCountryOnly: false,
  showOnlyCountryWhenClosed: false
            ),

            Text(name ?? "no name")
        ],
      ),
    );
  }
}