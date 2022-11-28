import 'package:cached_network_image/cached_network_image.dart';
import 'package:fanchat_admin/business_logic/cubit/app_cubit.dart';
import 'package:fanchat_admin/business_logic/cubit/app_states.dart';
import 'package:fanchat_admin/presentation/widgets/default_form_field.dart';
import 'package:fanchat_admin/presentation/widgets/shared_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class EditMatch extends StatelessWidget {

  final String firstImage;
  final String firstName;
  final String secondName;
  final String secondImage;
  final String dateTime;
  final String clock;
  final String doc;

  static TextEditingController firstScore =TextEditingController();
  static TextEditingController secondScore =TextEditingController();

  const EditMatch(
      {
        Key? key,
        required this.firstImage,
        required this.firstName,
        required this.secondImage,
        required this.secondName,
        required this.dateTime,
        required this.clock,
        required this.doc,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
        listener: (context,state){

        },
        builder: (context,state){
          Size size = MediaQuery.of(context).size;
          var cubit=AppCubit.get(context);
          return  Scaffold(
            appBar: customAppbar('', context),
            body: Stack(
              children: [
                SizedBox(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child:const Opacity(
                      opacity: 1,
                      child:  Image(
                        image: AssetImage('assets/images/public_chat_image.jpeg'),
                        fit: BoxFit.cover,

                      ),
                    )
                ),
                Container(
                  child: InkWell(
                    onTap: (){

                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height*.45,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 10
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color:  const Color(0Xff000f2c),
                      ),

                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [

                          const SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(dateTime,style: GoogleFonts.roboto(
                                color: Colors.white,
                                fontSize: 16,
                              ),),

                            ],
                          ),
                          const SizedBox(height: 5,),


                          Text(clock,
                            style: GoogleFonts.roboto(
                              color: Colors.white,
                              fontSize: 15,
                            ),),

                          SizedBox(height: MediaQuery.of(context).size.height*.03,),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: MediaQuery.of(context).size.height*.05,
                                      width: MediaQuery.of(context).size.height*.07,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(50)
                                      ),
                                      child: CachedNetworkImage(
                                        cacheManager: AppCubit.get(context).manager,
                                        imageUrl: firstImage,
                                        placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                                        fit: BoxFit.cover,
                                      ) ,
                                    ),
                                    const  SizedBox(height: 5,),
                                    Text(firstName,style: GoogleFonts.roboto(
                                      color: Colors.white,
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                    ),
                                      textAlign: TextAlign.center,
                                    ),

                                    const  SizedBox(height: 20,),

                                    Padding(
                                      padding:EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height*.02,vertical: 9),
                                      child: DefaultFormField(
                                          hint: '',
                                          radies: 25,
                                          filledColor: true,
                                          controller: firstScore,
                                          textInputType: TextInputType.number
                                      ),
                                    ),

                                  ],

                                ),
                              ),

                              const SizedBox(width: 25,),

                              const SizedBox(width: 25,),

                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: MediaQuery.of(context).size.height*.05,
                                      width: MediaQuery.of(context).size.height*.07,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(50)
                                      ),
                                      child: CachedNetworkImage(
                                        cacheManager: AppCubit.get(context).manager,
                                        imageUrl: secondImage,
                                        placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                                        fit: BoxFit.cover,
                                      ) ,
                                    ),

                                    const SizedBox(height: 5,),
                                    Text(secondName!,style: GoogleFonts.roboto(
                                      color: Colors.white,
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                    ),
                                      textAlign: TextAlign.center,
                                    ),

                                    const  SizedBox(height: 20,),

                                    Padding(
                                      padding:EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height*.02,vertical: 9),
                                      child: DefaultFormField(
                                          hint: '',
                                          radies: 25,
                                          filledColor: true,
                                          controller: secondScore,
                                          textInputType: TextInputType.number
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 20,),

                          defaultButton(
                            textColor: Colors.white,
                            buttonText: 'Update',
                            buttonColor: const Color(0Xffd32330),
                            width: size.width * .6,
                            height: size.height * .06,
                            function: () {

                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),


          );
        },
    );
  }
}
