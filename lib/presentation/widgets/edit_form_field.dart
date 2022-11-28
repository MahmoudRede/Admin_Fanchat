import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



class EditFormField extends StatelessWidget {

  final String hint;
  final bool isPassword;
  final TextInputType textInputType;
  final TextEditingController controller;
  double ?radies;
  bool ?filledColor;
  Widget? prefixWidget;
  String? validText;
  int? maxLines;

  EditFormField({
    required this.hint,
    required this.controller,
    required this.textInputType,
    this.isPassword=false,
    this.prefixWidget,
    this.radies=15.0,
    this.filledColor=false,
    this.validText,
    this.maxLines=1,
    Key? key
  }):super(key: key);


  @override
  Widget build(BuildContext context) {
    return TextFormField(

      textAlign: filledColor==false?TextAlign.start:TextAlign.center,
      decoration: InputDecoration(
        hintText: hint,

        filled: true,
        iconColor: Colors.white,
        fillColor: filledColor==false? const Color(0Xff000f2c).withOpacity(.5):Colors.white,
        hintStyle: GoogleFonts.roboto(
          fontSize: MediaQuery.of(context).size.height*0.02,
          color: filledColor==false? Colors.white:Colors.black,
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
                color: Colors.yellow,
                width: 2
            )
        ),
        prefixIcon: prefixWidget,
      ),
      style:GoogleFonts.roboto(
        color: filledColor==false? Colors.white:Colors.black,
        fontSize:  filledColor==false? MediaQuery.of(context).size.height*0.022:MediaQuery.of(context).size.height*0.035,
      ),
      maxLines: maxLines,
      controller: controller,
      keyboardType: textInputType,
      obscureText: isPassword,
      validator: (value){
        if(value!.isEmpty){
          return validText;
        } else {
          return null;
        }
      },
    );
  }
}