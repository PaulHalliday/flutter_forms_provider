import 'package:flutter/material.dart';
import 'package:form_state/common/form_item.dart';
import 'package:form_state/models/contact_form_model.dart';
import 'package:provider/provider.dart';

class AddContactPage extends StatefulWidget {
  @override
  _AddContactPageState createState() => _AddContactPageState();
}

class _AddContactPageState extends State<AddContactPage> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Consumer<ContactFormModel>(
      builder: (context, contactFormModel, _) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Add Contact"),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              final isValid = _formKey.currentState.validate();
              if (isValid) {
                contactFormModel.add();
              } else {
                print("Is not valid");
              }
            },
            child: Icon(Icons.check),
          ),
          body: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              key: _formKey,
              child: ListView(
                children: [
                  TextFormField(
                    validator: contactFormModel.name.validator,
                    onChanged: (String value) =>
                        contactFormModel.setName(value),
                    decoration: InputDecoration(labelText: "Contact Name"),
                  ),
                  TextFormField(
                    validator: contactFormModel.phoneNumber.validator,
                    onChanged: (String value) =>
                        contactFormModel.setPhoneNumber(value),
                    decoration: InputDecoration(labelText: "Phone Number"),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
