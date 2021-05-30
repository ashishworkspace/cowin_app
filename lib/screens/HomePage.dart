import 'package:cowin_app/constants/Constants.dart';
import 'package:cowin_app/constants/validator.dart';
import 'package:cowin_app/custom/CustomTextField.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static const String id = "HomePage";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //methods Overriding
  @override
  void initState() {
    super.initState();
    _loopTimeSlot(timing);
  }

  // Variables
  String _selectedTimeSlot = "09:00AM-11:00AM";
  List<DropdownMenuItem<String>> _listDropDownItems = [];
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // User-Defined methods
  void _loopTimeSlot(List<String> passList) {
    for (int i = 0; i < passList.length; i++) {
      _listDropDownItems.add(DropdownMenuItem(
          child: Text(
            passList[i],
          ),
          value: passList[i]));
    }
  }

  void validatorCheck() {
    if (_formKey.currentState.validate()) {
      print("Validated");
    } else {
      print("Not Validated");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Cowin"),
        ),
        body: Container(
            child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text("Register", style: registerText),
                CustomTextField(
                    hintTextInput: "Name",
                    validator: validatorName,
                    onchage: (value) => {print(value)}),
                CustomTextField(
                    keyboard: TextInputType.phone,
                    validator: (_mobileNumber) => validateMobile(_mobileNumber),
                    hintTextInput: "Mobile Number",
                    onchage: (value) => {print(value)}),
                CustomTextField(
                    keyboard: TextInputType.number,
                    validator: validatorPinCode,
                    hintTextInput: "Pincode",
                    onchage: (mobileNumber) => {
                          print(mobileNumber),
                        }),
                CustomTextField(
                    keyboard: TextInputType.text,
                    validator: validatorCenter,
                    hintTextInput: "Center",
                    onchage: (value) => {print(value)}),
                DropdownButton<String>(
                  value: _selectedTimeSlot,
                  items: _listDropDownItems,
                  onChanged: (value) => {
                    setState(() {
                      _selectedTimeSlot = value;
                      print(_selectedTimeSlot);
                    })
                  },
                ),
                ElevatedButton(
                    onPressed: () {
                      validatorCheck();
                    },
                    child: Text("Submit"))
              ],
            ),
          ),
        )));
  }
}
