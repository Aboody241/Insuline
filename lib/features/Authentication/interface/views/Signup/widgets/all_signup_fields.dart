import 'package:flutter/material.dart';
import 'package:insulin95/core/assets/colors.dart';

class SignUpFullNameField extends StatelessWidget {
  const SignUpFullNameField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: KsecondaryC,
      ),
      child: TextField(
        
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: KprimaryC
            )
          ),
          focusColor: KprimaryC,
          contentPadding: EdgeInsets.only(top: 12, left: 10),
          suffixIcon: Icon(Icons.person, color: KtherdC),
          hintStyle: TextStyle(color: Color(0xff4F7896)),
          hintText: "Enter Full Name",
          border: InputBorder.none,
        ),
      ),
    );
  }
}

class SignUpEmailField extends StatelessWidget {
  const SignUpEmailField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: KsecondaryC,
      ),
      child: TextField(
        decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: KprimaryC
            )
          ),
          contentPadding: EdgeInsets.only(top: 12, left: 10),
          suffixIcon: Icon(Icons.email_outlined, color: KtherdC),
          hintStyle: TextStyle(color: Color(0xff4F7896)),
          hintText: "Email",
          border: InputBorder.none,
        ),
      ),
    );
  }
}
  

  
class SignUpPasswordField extends StatelessWidget {
  const SignUpPasswordField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: KsecondaryC,
      ),
      child: TextField(
        decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: KprimaryC
            )
          ),
          contentPadding: EdgeInsets.only(top: 12, left: 10),
          suffixIcon: IconButton(onPressed: (){}, icon: Icon(Icons.visibility_off_sharp),color: KtherdC,),
          hintStyle: TextStyle(color: Color(0xff4F7896)),
          hintText: "Password",
          border: InputBorder.none,
        ),
      ),
    );
  }
}
class SignUpConfirmPasswordField extends StatelessWidget {
  const SignUpConfirmPasswordField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: KsecondaryC,
      ),
      child: TextField(
        decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: KprimaryC
            )
          ),
          contentPadding: EdgeInsets.only(top: 12, left: 10),
          suffixIcon: IconButton(onPressed: (){}, icon: Icon(Icons.visibility_off_sharp),color: KtherdC,),
          hintStyle: TextStyle(color: Color(0xff4F7896)),
          hintText: "Confirm Password",
          border: InputBorder.none,
        ),
      ),
    );
  }
}
