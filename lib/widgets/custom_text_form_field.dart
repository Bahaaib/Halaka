import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller; // Validation function
  final String labelText;
  final TextInputType keyboardType;
  final IconData? prefixIcon;
  final TextInputType textInputType = TextInputType.number;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;

  const CustomTextFormField({
    Key? key,
    required this.controller,
    required this.labelText,
    required this.validator,
    required this.keyboardType,
    this.prefixIcon,
     this.inputFormatters,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      inputFormatters: inputFormatters,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: Icon(prefixIcon),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black, // Border color
            width: 2.0, // Border thickness
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey, // Border color when not focused
            width: 1.5, // Border thickness when not focused
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blue, // Border color when focused
            width: 2.0, // Border thickness when focused
          ),
        ),
      ),
    );
  }
}
