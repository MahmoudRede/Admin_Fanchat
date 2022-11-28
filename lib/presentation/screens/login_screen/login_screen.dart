// ignore_for_file: unused_element, unused_field, prefer_final_fields


import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:fanchat_admin/presentation/screens/home_screen/home_screen.dart';
import 'package:fanchat_admin/presentation/widgets/default_form_field.dart';
import 'package:fanchat_admin/presentation/widgets/shared_widgets.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl_phone_field/intl_phone_field.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  Map<String, dynamic>? _userData;
  bool _checking = true;

  var formKey = GlobalKey<FormState>();

  TextEditingController phone = TextEditingController();

  bool isPassword=false;
  late String phoneNumber;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0Xff000f2c),
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 0,
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.light,
          statusBarColor: Color(0Xff000f2c),
        ),
      ),
      body: Form(
        key: formKey,
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      'assets/images/register_image.jpg',
                    ),
                    fit: BoxFit.cover),
              ),
            ),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .06,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 30, left: 30, right: 30),
                    child: SvgPicture.asset(
                      'assets/images/logo.svg',
                      height: MediaQuery.of(context).size.height * .16,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                   Padding(
                    padding: EdgeInsets.only(
                        top: 0, left: 30, right: 30),
                    child: Text(
                      'Version 1.0.0\nEnjoy chatting in special team fans’ rooms, public rooms, '
                          'and one-to-one chats. Share videos, photos, and voice notes with '
                          'football fans around the world. Broadcast a cheer to all your team '
                          'fans rooms,and follow match scores and news during',
                      style: GoogleFonts.roboto(
                          color: Colors.white,
                          fontSize: 14,
                          ),
                      textAlign: TextAlign.center,
                    ),
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                   Text(
                    'World Cup, Qatar, 2022',
                    style: GoogleFonts.roboto(
                        color: Color(0xfffff560),
                        fontSize: 16,
                        ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                   Text(
                    ' Join the fans and don’t lose a moment',
                    style: GoogleFonts.roboto(
                        color: Colors.white,
                        fontSize: 14,
                        ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(
                    height: 25,
                  ),

                  // Padding(
                  //   padding: const EdgeInsets.only(
                  //       top: 0, left: 30, right: 30),
                  //   child: Container(
                  //     alignment: Alignment.center,
                  //     padding: const EdgeInsets.fromLTRB(15, 20, 0, 0),
                  //     width: MediaQuery.of(context).size.width,
                  //     height: MediaQuery.of(context).size.height * .07,
                  //     decoration: BoxDecoration(
                  //       border: Border.all(
                  //           color: HexColor('#ffef00'), width: 1),
                  //       borderRadius: BorderRadius.circular(3),
                  //       color: HexColor('#000f2c').withOpacity(.6),
                  //     ),
                  //     child: IntlPhoneField(
                  //       dropdownTextStyle: TextStyle(
                  //           color: Colors.grey,
                  //           fontSize: 14,
                  //           ),
                  //       invalidNumberMessage: 'Invalid Phone Number!',
                  //       textAlignVertical: TextAlignVertical.center,
                  //       style: const TextStyle(
                  //           fontSize: 15,
                  //           color: Colors.grey),
                  //       onChanged: (phone) =>
                  //       phoneNumber = phone.completeNumber,
                  //       initialCountryCode: 'AF',
                  //       flagsButtonPadding:
                  //       const EdgeInsets.only(right: 10, bottom: 10),
                  //       showDropdownIcon: false,
                  //       keyboardType: TextInputType.phone,
                  //       decoration: const InputDecoration(
                  //         border: InputBorder.none,
                  //       ),
                  //     ),
                  //   ),
                  // ),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height*.03),
                    child: DefaultFormField(
                      hint: 'Enter Your Password',
                      controller: phone,
                      textInputType: TextInputType.visiblePassword,
                      validText: 'Please,enter your password',
                      isPassword: isPassword,
                      suffixIcon: isPassword?Icons.visibility_off:Icons.visibility,
                      suffixFunction: (){
                        setState(() {
                          isPassword=!isPassword;
                        });
                      },
                      prefixWidget: Icon(Icons.lock,color: Colors.white,size:MediaQuery.of(context).size.height*.03 ,),

                    ),
                  ),

                  SizedBox(
                    height: size.height * .04,
                  ),
                
                  SizedBox(
                    height: size.height * .04,
                  ),
                  defaultButton(
                    textColor: Colors.white,
                    buttonText: 'LOGIN',
                    buttonColor: const Color(0Xffd32330),
                    width: size.width * .6,
                    height: size.height * .06,
                    function: () {
                      if(formKey.currentState!.validate()){

                        if(phone.text=='Fanchat2022'){
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                builder: (context) => const HomeScreen(),
                              ),(Route<dynamic> route) => false);
                        }
                        else{
                          customToast(title: 'Password isn\'t correct', color: Colors.red);
                        }

                      }
                    },
                  ),
                  SizedBox(height: size.height * .02),


                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDropdownItem(Country country) => Container(
    width: 130,
    padding: const EdgeInsets.only(left: 15),
    child: Row(
      children: <Widget>[
        CountryPickerUtils.getDefaultFlagImage(country),
        const SizedBox(
          width: 15.0,
        ),
        Text(
          "+${country.phoneCode}",
          style: const TextStyle(
              color: Colors.grey),
        ),
      ],
    ),
  );
}

