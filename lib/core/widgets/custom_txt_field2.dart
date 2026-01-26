import 'package:edumate/core/consts/constants.dart';
import 'package:edumate/core/consts/conts_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final String prefixIcon;
  final TextEditingController controller;
  bool isEmail;
  bool secure;
  final Widget? suffixIcon;

  CustomTextField({
    super.key,
    required this.hintText,
    required this.prefixIcon,
    required this.controller,
    this.isEmail = false,
    this.secure = false,
    this.suffixIcon,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 400,
        height: 63,
        decoration: BoxDecoration(
          color: Color(ConstsColors.koffwhite),
          borderRadius: BorderRadius.circular(17),
        ),
        child: TextFormField(
          textAlign: TextAlign.left,
          controller: widget.controller,
          obscureText: widget.secure,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter some text';
            }
            return null;
          },
          keyboardType:
              widget.isEmail ? TextInputType.emailAddress : TextInputType.name,
          textDirection: TextDirection.rtl,
          decoration: InputDecoration(
            prefixIcon: Padding(
              padding: const EdgeInsets.all(12.0),
              child: SvgPicture.asset(
                widget.prefixIcon.toString(),
                width: 24,
                height: 24,
              ),
            ),
            suffixIcon: widget.suffixIcon,
            filled: true,
            
            fillColor: Color(ConstsColors.koffwhite),
            hintText: widget.hintText,
            // hintStyle: arabicstyle8.copyWith(fontSize: 15, fontWeight: FontWeight.w600),
            alignLabelWithHint: true,
            hintTextDirection: TextDirection.ltr,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(35),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
    );
  }
}
