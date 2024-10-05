
import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String hintText;
  final String labelText;
  final IconData prefixIcon;
  final IconData? suffixIcon;
  final bool enabled;
  final TextEditingController? controller;
  final  void Function()? suffixIconOnPressed;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final  bool obscureText;
   const InputField({
    super.key,
     required this.hintText,
     required this.labelText,
     required this.prefixIcon,
     this.onChanged,
     this.validator,
     this.obscureText=false,
     this.suffixIconOnPressed, this.suffixIcon, this.controller, required this.enabled,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enabled,
      controller:controller,
      obscureText:obscureText ,
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          hintText: hintText,
          filled: true,
          label:  Text(labelText),
          prefixIcon: Icon(prefixIcon),
        suffixIcon: suffixIcon !=null ?
        IconButton(onPressed: suffixIconOnPressed, icon: Icon(suffixIcon)) :null,
      ),
      onChanged: onChanged,
      validator:validator,
    );
  }
}