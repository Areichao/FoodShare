import 'package:flutter/material.dart';
import 'package:helloworld/components/text_field_container.dart';
import 'package:helloworld/constants.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const RoundedPasswordField({
    Key key,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        obscureText: true,
        onChanged: onChanged,
        cursorColor: Colors.white,
        decoration: InputDecoration(
          hintText: "Password",
          icon: Icon(
            Icons.lock,
            color: Colors.red,
          ),
          suffixIcon: Icon(
            Icons.visibility,
            color: Colors.red,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
