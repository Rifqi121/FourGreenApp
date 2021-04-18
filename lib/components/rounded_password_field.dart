import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fourgreen/components/text_field_container.dart';
import 'package:fourgreen/contstant.dart';

class RoundedPasswordField extends StatefulWidget {
  final ValueChanged<String> onSaved;
  final TextEditingController controller;
  final String hintText;
  final int maxlenght;
  const RoundedPasswordField({
    Key key,
    this.hintText,
    this.controller,
    this.maxlenght,
    this.onSaved,
  }) : super(key: key);

_PasswordFieldState createState() => new _PasswordFieldState();
}

class _PasswordFieldState extends State<RoundedPasswordField> {
  bool _passwordObscure;

  @override
  void initState() {
    _passwordObscure = true;
  }

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        controller: widget.controller,
        inputFormatters: [
          LengthLimitingTextInputFormatter(
            widget.maxlenght
          ),
        ],
        obscureText: _passwordObscure,
        onSaved: widget.onSaved,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          hintText: widget.hintText,
          icon: Icon(
            Icons.lock,
            color: Colors.grey,
          ),
          suffixIcon: IconButton(
            icon: Icon(
              _passwordObscure
               ? Icons.visibility_off
               : Icons.visibility,
            ),
            color: Colors.grey,
            onPressed: () {
               setState(() {
                   _passwordObscure = !_passwordObscure;
               });
               }
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}

class RRoundedPasswordField extends StatefulWidget {
  final ValueChanged<String> onChanged;
  final int maxlenght;
  final TextEditingController controller;
  final ValueChanged<String> validator;
  const RRoundedPasswordField({
    Key key,
    this.controller,
    this.maxlenght,
    this.validator,
    this.onChanged,
  }) : super(key: key);

  @override
  _RPasswordFieldState createState() => new _RPasswordFieldState();
}

class _RPasswordFieldState extends State<RRoundedPasswordField> {
  bool _passwordObscure;

  @override
  void initState() {
    _passwordObscure = true;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return RTextFieldContainer(
      child: TextFormField(
        inputFormatters: [
          LengthLimitingTextInputFormatter(
            widget.maxlenght
          ),
        ],
        controller: widget.controller,
        obscureText: _passwordObscure,
        validator: widget.validator,
        onChanged: widget.onChanged,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          hintText: "Password",
          suffixIcon: IconButton(
            icon: Icon(
              _passwordObscure
               ? Icons.visibility_off
               : Icons.visibility,
            ), iconSize: size.height*0.025,
            color: Colors.grey,
            onPressed: () {
               setState(() {
                   _passwordObscure = !_passwordObscure;
               });
               }
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}