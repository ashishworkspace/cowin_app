import 'package:cowin_app/constants/Constants.dart';
import 'package:cowin_app/constants/validator.dart';
import 'package:cowin_app/custom/CustomTextField.dart';
import 'package:cowin_app/screens/ConfirmPage.dart';
import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

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
  String userName;
  String mobileNumber;
  String pinCode;
  String center;
  String timeSlot;
  int toggleValue;

  // User-Defined methods
  void _loopTimeSlot(List<String> passList) {
    for (int i = 0; i < passList.length; i++) {
      _listDropDownItems.add(
        DropdownMenuItem(
          child: Text(
            passList[i],
          ),
          value: passList[i],
        ),
      );
    }
  }

  void validatorCheck() {
    if (_formKey.currentState.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ConfirmPage(
            userName: userName,
            center: center,
            mobileNumber: mobileNumber,
            pinCode: pinCode,
            timeSlot: timeSlot,
            indexToggle: toggleValue,
          ),
        ),
      );
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
                  onchage: (value) => {
                    userName = value,
                  },
                ),
                CustomTextField(
                  keyboard: TextInputType.phone,
                  validator: (_mobileNumber) => validateMobile(_mobileNumber),
                  hintTextInput: "Mobile Number",
                  onchage: (value) => {
                    mobileNumber = value,
                  },
                ),
                CustomTextField(
                  keyboard: TextInputType.number,
                  validator: validatorPinCode,
                  hintTextInput: "Pincode",
                  onchage: (value) => {
                    pinCode = value,
                  },
                ),
                CustomTextField(
                  keyboard: TextInputType.text,
                  validator: validatorCenter,
                  hintTextInput: "Center",
                  onchage: (value) => {
                    center = value,
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    DropdownButton<String>(
                      value: _selectedTimeSlot,
                      items: _listDropDownItems,
                      onChanged: (value) => {
                        setState(() {
                          _selectedTimeSlot = value;
                          timeSlot = _selectedTimeSlot;
                        })
                      },
                    ),
                    ToggleSwitch(
                      labels: doseLabels,
                      cornerRadius: 5,
                      fontSize: 17,
                      minWidth: 80,
                      minHeight: 35,
                      inactiveBgColor: Colors.grey[200],
                      onToggle: (value) => {
                        toggleValue = value,
                      },
                    )
                  ],
                ),
                SizedBox(
                  height: 5,
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
