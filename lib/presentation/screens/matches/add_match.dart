
import 'package:fanchat_admin/business_logic/cubit/app_cubit.dart';
import 'package:fanchat_admin/business_logic/cubit/app_states.dart';
import 'package:fanchat_admin/presentation/widgets/country_widget.dart';
import 'package:fanchat_admin/presentation/widgets/country_widget2.dart';
import 'package:fanchat_admin/presentation/widgets/shared_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class AddMatch extends StatelessWidget {

  final String doc;
  final String day;
  final int index;

  const AddMatch({Key? key,required this.doc,required this.day,required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
        listener: (context,state){
          if(state is AddMatchSuccessState){

            customToast(title: 'Match Added', color: Colors.blue);

            AppCubit.get(context).selectedTeamName='';
            AppCubit.get(context).selectedTeamName2='';
            AppCubit.get(context).selectedTeamImage='';
            AppCubit.get(context).selectedTeamImage2='';
            AppCubit.get(context).selectedTime=0;
            Navigator.pop(context);

          }
        },
        builder: (context,state){
          var cubit=AppCubit.get(context);
          return Scaffold(
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
                      children: [
                        SizedBox(height: MediaQuery.of(context).size.height*.03,),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('$day $doc 2022',style: GoogleFonts.roboto(
                                fontSize: MediaQuery.of(context).size.height*.023,
                                color: Colors.white,
                                fontWeight: FontWeight.w700
                            ),),
                          ],
                        ),

                        SizedBox(height: MediaQuery.of(context).size.height*.05,),
                        Row(
                           children: [
                             GestureDetector(
                               onTap: (){
                                 showModalBottomSheet(
                                     context: context,
                                     builder: (BuildContext context){
                                       return const CountryWidget();
                                     }
                                 );
                               },
                               child: Expanded(
                                 child: Text('Select Team 1',style: GoogleFonts.roboto(
                                     fontSize: MediaQuery.of(context).size.height*.023,
                                     color: Colors.white,
                                     fontWeight: FontWeight.w700,
                                     decoration: TextDecoration.underline
                                 ),
                                 ),
                               ),
                             ),
                             const Spacer(),
                             cubit.selectedTeamName==''? Text('',style: GoogleFonts.roboto(
                                 fontSize: MediaQuery.of(context).size.height*.023,
                                 color: Colors.white,
                                 fontWeight: FontWeight.w700
                             ),):Text(cubit.selectedTeamName,style: GoogleFonts.roboto(
                                 fontSize: MediaQuery.of(context).size.height*.023,
                                 color: Colors.red,
                                 fontWeight: FontWeight.w700
                             ),),
                             SizedBox(width: MediaQuery.of(context).size.height*.03,),

                           ],
                         ),
                         SizedBox(height: MediaQuery.of(context).size.height*.05,),
                         Row(
                           children: [
                             GestureDetector(
                               onTap: (){
                                 showModalBottomSheet(
                                     context: context,
                                     builder: (BuildContext context){
                                       return const CountryWidget2();
                                     }
                                 );
                               },
                               child: Expanded(
                                 child: Text('Select Team 2',style: GoogleFonts.roboto(
                                     fontSize: MediaQuery.of(context).size.height*.023,
                                     color: Colors.white,
                                     decoration: TextDecoration.underline,
                                     fontWeight: FontWeight.w700
                                 ),),
                               ),
                             ),
                             const Spacer(),
                             cubit.selectedTeamName2==''? Text('',style: GoogleFonts.roboto(
                                 fontSize: MediaQuery.of(context).size.height*.023,
                                 color: Colors.white,
                                 fontWeight: FontWeight.w700
                             ),):Text(cubit.selectedTeamName2,style: GoogleFonts.roboto(
                                 fontSize: MediaQuery.of(context).size.height*.023,
                                 color: Colors.red,
                                 fontWeight: FontWeight.w700
                             ),),
                             SizedBox(width: MediaQuery.of(context).size.height*.03,),


                           ],
                         ),
                        SizedBox(height: MediaQuery.of(context).size.height*.05,),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: (){
                                showTimePicker(
                                    context: context,

                                    initialTime: TimeOfDay.now()
                                ).then((value) {
                                  cubit.timeSelected(time: value!.hourOfPeriod);
                                });
                              },
                              child: Expanded(
                                child: Text('Select Time',style: GoogleFonts.roboto(
                                    fontSize: MediaQuery.of(context).size.height*.023,
                                    color: Colors.white,
                                    decoration: TextDecoration.underline,
                                    fontWeight: FontWeight.w700
                                ),),
                              ),
                            ),
                            const Spacer(),
                            cubit.selectedTime==0? Text('',style: GoogleFonts.roboto(
                                fontSize: MediaQuery.of(context).size.height*.023,
                                color: Colors.white,
                                fontWeight: FontWeight.w700
                            ),):Text('${cubit.selectedTime}',style: GoogleFonts.roboto(
                                fontSize: MediaQuery.of(context).size.height*.023,
                                color: Colors.red,
                                fontWeight: FontWeight.w700
                            ),),
                            SizedBox(width: MediaQuery.of(context).size.height*.03,),
                          ],
                        ),

                        SizedBox(height: MediaQuery.of(context).size.height*.07,),

                        defaultButton(
                          textColor: Colors.white,
                          buttonText: 'Add Match',
                          buttonColor: const Color(0Xffd32330),
                          width:  MediaQuery.of(context).size.width * .6,
                          height:  MediaQuery.of(context).size.height * .06,
                          function: () {
                            cubit.addMatch(
                                doc: doc,
                                clock: cubit.selectedTime,
                                date: '$day $doc 2022',
                                index: index,
                            );
                          },
                        ),

                      ],
                    ),
                  )

                ],
              ),
          );
        },
    );
  }
}
