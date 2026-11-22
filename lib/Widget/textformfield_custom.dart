import 'package:flutter/material.dart';
import 'package:quize2/Models/auth_model.dart';

class TextformfieldCustom extends StatelessWidget {
  final IconData? Sicon;
  final IconData Picon;
  final String text;
  TextEditingController controller = TextEditingController();

  new({
    super.key,
    this.Sicon,
    required this.Picon,
    required this.text,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 75,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      child: TextFormField(
        decoration: InputDecoration(
          prefixIcon: Icon(Picon, color: Colors.deepOrangeAccent),
          suffixIcon: Icon(Sicon, color: Colors.deepOrangeAccent),
          label: Text(text),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Please Enter the ${text}";
          }
          if (text == "Password" && value.length < 8) {
            return "Password Must be Greater than 8";
          }
          if (text == "Email" && !value.contains("@")) {
            return "Email Must contains @";
          }
        },
      ),
    );
  }
}
