// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:insulin95/core/assets/colors.dart';
import 'package:insulin95/core/assets/on_board_style.dart';

import 'package:intl_phone_field/intl_phone_field.dart';

class CustomTextField extends StatelessWidget {
  final Icon? suffixIcon;
  final String textHint;
  final TextEditingController? controller;
  final TextInputType? keyboardType;

  const CustomTextField({
    super.key,
    this.suffixIcon,
    required this.textHint,
    this.controller,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: KsecondaryC,
        ),
        child: TextField(
          keyboardType: keyboardType,
          controller: controller,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(top: 12, left: 10),
            suffixIcon: suffixIcon,
            hintStyle: TextStyle(color: Color(0xff4F7896)),
            hintText: textHint,
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}

class CustomPasswordField extends StatefulWidget {
  final IconButton? sufixIcon;
  final String hintText;
  final TextEditingController? controller;

  const CustomPasswordField({
    super.key,
    this.sufixIcon,
    required this.hintText,
    this.controller,
  });

  @override
  State<CustomPasswordField> createState() => _CustomPasswordFieldState();
}

class _CustomPasswordFieldState extends State<CustomPasswordField> {
  bool viasble = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: KsecondaryC,
        ),
        child: TextField(
          obscureText: viasble,
          decoration: InputDecoration(
            focusColor: KprimaryC,
            hoverColor: KprimaryC,

            contentPadding: EdgeInsets.only(top: 12, left: 10),
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  viasble = !viasble;
                });
              },

              icon: viasble == true
                  ? Icon(Icons.visibility_off, color: KtherdC)
                  : Icon(Icons.remove_red_eye, color: KtherdC),
            ),
            hintStyle: TextStyle(color: Color(0xff4F7896)),
            hintText: widget.hintText,
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}

class PhoneNoFiled extends StatelessWidget {
  const PhoneNoFiled({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: KsecondaryC,
        ),
        child: IntlPhoneField(
          disableLengthCheck: true,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(top: 12, left: 10),
            suffixIcon: Icon(Icons.phone),
            hintStyle: TextStyle(color: Color(0xff4F7896)),
            hintText: "Phone No.",
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}

class BasicFormField extends StatelessWidget {
  final Icon? sufixIcon;
  final IconButton? sufixbutton;
  final String? textHint;
  final TextInputType? keyboardType;
  final TextEditingController? controller;

  const BasicFormField({
    super.key,
    this.sufixIcon,
    this.textHint,
    this.sufixbutton,
    this.keyboardType,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: KsecondaryC,
        ),
        child: TextField(
          controller: controller,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(top: 12, left: 10),
            suffixIcon: sufixIcon,
            // hintStyle: TextStyle(color: Color(0xff4F7896)),
            labelStyle: TextStyle(color: Color(0xff4F7896)),
            labelText: textHint,
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}

class ChoicerForm extends StatefulWidget {
  final List<String> options;
  final String hint;

  const ChoicerForm({super.key, required this.options, this.hint = "Select"});

  @override
  State<ChoicerForm> createState() => _ChoicerFormState();
}

class _ChoicerFormState extends State<ChoicerForm> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: KsecondaryC,
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            value: selectedValue,
            iconEnabledColor: KtherdC,
            style: OnBoardStyle.onBoardDisc.copyWith(color: KtherdC),
            hint: Text(widget.hint),
            isExpanded: true,
            icon: const Icon(Icons.keyboard_arrow_down),
            items: widget.options
                .map(
                  (option) => DropdownMenuItem<String>(
                    value: option,
                    child: Text(option),
                  ),
                )
                .toList(),
            onChanged: (value) {
              setState(() {
                selectedValue = value;
              });
            },
          ),
        ),
      ),
    );
  }
}

class BasicEmptyFormField extends StatelessWidget {
  final Icon? sufixIcon;
  final IconButton? sufixbutton;
  final TextInputType? keyboardType;
  final TextEditingController? controller;

  const BasicEmptyFormField({
    super.key,
    this.sufixIcon,
    this.sufixbutton,
    this.keyboardType,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: KsecondaryC,
        ),
        child: TextField(
          
          controller: controller,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            suffixIcon: sufixIcon,
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
