import 'package:cached_network_image/cached_network_image.dart';
import 'package:fanchat_admin/business_logic/cubit/app_states.dart';
import 'package:fanchat_admin/presentation/screens/matches/edit_match.dart';
import 'package:fanchat_admin/presentation/widgets/shared_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../business_logic/cubit/app_cubit.dart';

class ShowAllMatches extends StatefulWidget {
  const ShowAllMatches({Key? key}) : super(key: key);

  @override
  State<ShowAllMatches> createState() => _ShowAllMatchesState();
}

class _ShowAllMatchesState extends State<ShowAllMatches> {
  List <String>dateMatchs=[

    '20 Nov','21 Nov', '22 Nov', '23 Nov', '24 Nov', '25 Nov', '26 Nov', '27 Nov', '28 Nov', '29 Nov', '30 Nov', '1 Dec', '2 Dec', '3 Dec',
    '4 Dec', '6 Dec', '7 Dec', '8 Dec', '9 Dec', '10 Dec', '11 Dec', '12 Dec', '13 Dec', '14 Dec', '15 Dec', '16 Dec', '17 Dec', '18 Dec',
  ];

  List <String>dayMatchs=[

    'Sun','Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun',
    'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat',
  ];


  String ?dateMatch='22 Nov 2022';
  var matchTime =DateTime.now().timeZoneOffset.inHours;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context,state){

      },
      builder: (context,state){
        return Scaffold(
          backgroundColor: Colors.transparent,
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
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 0),
                    child: SizedBox(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Material(
                              elevation: 5,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [

                                  // Days List
                                  Container(
                                    decoration: const BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage('assets/images/public_chat_image.jpeg'),
                                          fit: BoxFit.cover,                                      )
                                    ),
                                    child: SizedBox(
                                      width: double.infinity,
                                      height: MediaQuery.of(context).size.height*.11,
                                      child: ListView.separated(
                                          scrollDirection:Axis.horizontal,
                                          shrinkWrap: true,
                                          itemBuilder: (context,index){
                                            return InkWell(
                                              onTap: (){
                                                setState(() {
                                                  AppCubit.get(context).isDay= List.generate(28, (index) => false);
                                                  AppCubit.get(context).isDay[index]=! AppCubit.get(context).isDay[index];
                                                });

                                                AppCubit.get(context).getAllMatches(doc: dateMatchs[index]);
                                              },
                                              child: Container(
                                                margin: const EdgeInsets.symmetric(
                                                    horizontal: 10,
                                                    vertical: 10
                                                ),

                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(15),
                                                ),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [

                                                    Column(
                                                      children: [
                                                        Text(dayMatchs[index],style: GoogleFonts.roboto(
                                                            color:  AppCubit.get(context).isDay[index]==true?Colors.white:Colors.grey[600],
                                                            fontSize: 10,
                                                        ),),
                                                        const SizedBox(height: 10,),
                                                        Text(dateMatchs[index],style: GoogleFonts.roboto(
                                                            color: AppCubit.get(context).isDay[index]==true?Colors.white:Colors.grey[600],
                                                            fontSize: 16,
                                                        ),),
                                                      ],
                                                    ),
                                                    const SizedBox(width: 15,),
                                                    Container(
                                                      width: 1,
                                                      height: 25,
                                                      color: Colors.grey,
                                                    ),

                                                    const SizedBox(height: 5,),
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                          separatorBuilder: (context,index){
                                            return  const SizedBox(width: 0,);
                                          },
                                          itemCount:dateMatchs.length
                                      ),
                                    ),
                                  ),

                                  const SizedBox(height: 0,),


                                  // Matches List
                                  Container(
                                    decoration: const BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage('assets/images/public_chat_image.jpeg'),
                                          fit: BoxFit.cover,
                                        )
                                    ),
                                    child: ListView.separated(
                                        shrinkWrap: true,
                                        physics: const NeverScrollableScrollPhysics(),
                                        itemBuilder: (context,index){
                                          return InkWell(
                                            onTap: (){

                                            },
                                            child: Container(
                                              margin: const EdgeInsets.symmetric(
                                                  horizontal: 10,
                                                  vertical: 10
                                              ),
                                              padding: const EdgeInsets.symmetric(
                                                horizontal: 20,
                                              ),
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(7),
                                                color:  const Color(0Xff000f2c),
                                              ),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  const SizedBox(height: 10,),
                                                  Align(
                                                    alignment: Alignment.bottomRight,
                                                    child: CircleAvatar(
                                                      radius: 20,
                                                      backgroundColor: Colors.white,
                                                      child: IconButton(
                                                          onPressed: (){
                                                            Navigator.push(context, MaterialPageRoute(builder: (_){
                                                              return EditMatch(
                                                                firstImage:AppCubit.get(context).allMatches[index].firstImage!,
                                                                firstName:AppCubit.get(context).allMatches[index].firstTeam!,
                                                                secondImage:AppCubit.get(context).allMatches[index].secondImage!,
                                                                secondName: AppCubit.get(context).allMatches[index].secondTeam!,
                                                                dateTime: AppCubit.get(context).allMatches[index].date!,
                                                                clock: '${AppCubit.get(context).allMatches[index].clock!+ DateTime.now().timeZoneOffset.inHours}:00 PM',
                                                              );
                                                            }));
                                                          },
                                                          icon:  const Icon(Icons.edit,color: Colors.red,size: 20,)
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(height: 10,),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Text(AppCubit.get(context).allMatches[index].date!,style: GoogleFonts.roboto(
                                                          color: Colors.white,
                                                          fontSize: 16,
                                                      ),),

                                                    ],
                                                  ),
                                                  const SizedBox(height: 5,),


                                                  Text('${AppCubit.get(context).allMatches[index].clock!+ DateTime.now().timeZoneOffset.inHours}:00 PM',
                                                    style: GoogleFonts.roboto(
                                                        color: Colors.white,
                                                        fontSize: 15,
                                                    ),),

                                                  const SizedBox(height: 5,),

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
                                                                imageUrl: AppCubit.get(context).allMatches[index].firstImage!,
                                                                placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                                                                fit: BoxFit.cover,
                                                              ) ,
                                                            ),
                                                            const  SizedBox(height: 5,),
                                                            Text(AppCubit.get(context).allMatches[index].firstTeam!,style: GoogleFonts.roboto(
                                                                color: Colors.white,
                                                                fontSize: 13,
                                                                fontWeight: FontWeight.bold,
                                                            ),
                                                              textAlign: TextAlign.center,

                                                            ),
                                                          ],
                                                        ),
                                                      ),

                                                      const SizedBox(width: 25,),
                                                      Column(
                                                        children: [
                                                          Container(
                                                            width: 120,
                                                            height: 50,
                                                            decoration: BoxDecoration(
                                                                borderRadius: BorderRadius.circular(5),
                                                                border: Border.all(
                                                                    color: Colors.white
                                                                ),
                                                                color: const Color(0Xff000f2c)
                                                            ),
                                                            child: Row(
                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                              children: [
                                                                const SizedBox(width: 10,),

                                                                (matchTime != AppCubit.get(context).allMatches[index].clock!+ DateTime.now().timeZoneOffset.inHours)?
                                                                Text(AppCubit.get(context).allMatches[index].score!,style: GoogleFonts.roboto(
                                                                    color: Colors.white,
                                                                    fontSize: 17,
                                                                    fontWeight: FontWeight.w500,
                                                                ),
                                                                  textAlign: TextAlign.center,
                                                                ):Text('Not Started',style: GoogleFonts.roboto(
                                                                    color:Colors.white,
                                                                    fontSize: 17,
                                                                    fontWeight: FontWeight.w500,
                                                                ),
                                                                  textAlign: TextAlign.center,
                                                                ),
                                                                const SizedBox(width: 10,),

                                                              ],
                                                            ),
                                                          ),

                                                        ],
                                                      ),

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
                                                                imageUrl: AppCubit.get(context).allMatches[index].secondImage!,
                                                                placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                                                                fit: BoxFit.cover,
                                                              ) ,
                                                            ),

                                                            const SizedBox(height: 5,),
                                                            Text(AppCubit.get(context).allMatches[index].secondTeam!,style: GoogleFonts.roboto(
                                                                color: Colors.white,
                                                                fontSize: 13,
                                                                fontWeight: FontWeight.bold,
                                                            ),
                                                              textAlign: TextAlign.center,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),



                                                  const SizedBox(height: 20,),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                        separatorBuilder: (context,index){
                                          return  const SizedBox(height: 0,);
                                        },
                                        itemCount:AppCubit.get(context).allMatches.length
                                    ),
                                  ),
                                ],
                              )
                          )
                        ],
                      ),
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