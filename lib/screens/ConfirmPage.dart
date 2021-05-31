import 'package:cowin_app/constants/Constants.dart';
import 'package:flutter/material.dart';

class ConfirmPage extends StatelessWidget {
  final String userName;
  final String mobileNumber;
  final String pinCode;
  final String center;
  final String timeSlot;
  final int indexToggle;
  ConfirmPage({
    this.userName,
    this.mobileNumber,
    this.pinCode,
    this.center,
    this.timeSlot,
    this.indexToggle: 0,
  });
  static const String id = "confirm";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("UserName: $userName"),
            Text("Mobile No.: $mobileNumber"),
            Text("Pincode: $pinCode"),
            Text("Center: $center"),
            Text("TimeSlot: $timeSlot"),
            Text("Dose: ${doseLabels[indexToggle]}")
          ],
        ),
      )),
    );
  }
}
