import 'package:flutter/material.dart';
import 'package:form_state/common/form_item.dart';

class ContactFormModel extends ChangeNotifier {
  FormItem _name = FormItem.notEmpty();
  FormItem _phoneNumber = FormItem.cannotBeLessThanXDigit(
    digit: 7,
    fieldName: "Phone Number",
  );

  FormItem get name => _name;
  FormItem get phoneNumber => _phoneNumber;

  String get contactName => _name.value;

  void setName(String value) {
    _name.value = value;
    notifyListeners();
  }

  void setPhoneNumber(String value) {
    _phoneNumber.value = value;
    notifyListeners();
  }

  void add() {
    print("NEW CONTACT ADDED!");
    print("$contactName $phoneNumber");
  }
}
