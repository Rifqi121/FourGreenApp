import 'package:flutter/material.dart';
import 'package:fourgreen/components/text_field_container.dart';
import 'package:fourgreen/contstant.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onSaved;
  final ValueChanged<String> validator;
  const RoundedPasswordField({
    Key key,
    this.validator,
    this.onSaved,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        validator: validator,
        obscureText: true,
        onSaved: onSaved,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          hintText: "Password",
          icon: Icon(
            Icons.lock,
            color: Colors.grey,
          ),
          suffixIcon: Icon(
            Icons.visibility,
            color: Colors.grey,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}

class RRoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final TextEditingController controller;
  const RRoundedPasswordField({
    Key key,
    this.controller,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RTextFieldContainer(
      child: TextField(
        controller: controller,
        obscureText: true,
        onChanged: onChanged,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          hintText: "Password",
          suffixIcon: Icon(
            Icons.visibility,
            color: Colors.grey,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}