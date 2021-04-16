import 'package:flutter/material.dart';
import 'package:fourgreen/components/text_field_container.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onSaved;
  final ValueChanged<String> validator;
  const RoundedInputField({
    Key key,
    this.hintText,
    this.validator,
    this.icon = Icons.person,
    this.onSaved,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        validator: validator,
        onSaved: onSaved,
        cursorColor: Colors.greenAccent,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: Colors.grey,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
