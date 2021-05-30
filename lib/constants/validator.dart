String validateMobile(String value) {
  String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
  RegExp regExp = new RegExp(pattern);
  if (value.length == 0) {
    return 'Please enter mobile number';
  } else if (!regExp.hasMatch(value)) {
    return 'Please enter valid mobile number';
  }
  return null;
}

String validatorPinCode(String value) {
  if (value.length == 0) {
    return "Pincode Required";
  } else if (value.length > 6 && value.length < 6) {
    return "Invalid  Pincode";
  } else {
    return null;
  }
}

String validatorName(String name) {
  if (name.isEmpty) {
    return "Name Required";
  } else {
    return null;
  }
}

String validatorCenter(String center) {
  if (center.isEmpty) {
    return "Enter Center";
  } else {
    return null;
  }
}
