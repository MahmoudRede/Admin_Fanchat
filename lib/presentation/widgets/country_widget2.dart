import 'package:fanchat_admin/business_logic/cubit/app_cubit.dart';
import 'package:fanchat_admin/business_logic/cubit/app_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class CountryWidget2 extends StatelessWidget {
  const CountryWidget2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context,state){

      },
      builder: (context,state){
        var cubit=AppCubit.get(context);
        return Container(
            padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*.015),
            color: Colors.white,
            height: 500,
            width: double.infinity,
            child: ListView.separated(
                itemBuilder: (context,index){
                  return GestureDetector(
                    onTap: (){
                      cubit.team2Selected(teamName: cubit.countries[index].name!, teamImage: cubit.countries[index].image!);

                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: EdgeInsets.all(MediaQuery.of(context).size.height*.01),
                      margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height*.01,),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: const Color(0Xff000f2c).withOpacity(.95)
                      ),
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage('${cubit.countries[index].image}'),
                            radius: MediaQuery.of(context).size.height*.023,
                          ),
                          SizedBox(width: MediaQuery.of(context).size.height*.023,),
                          Text(cubit.countries[index].name!,style: GoogleFonts.roboto(
                              fontSize: MediaQuery.of(context).size.height*.023,
                              color: Colors.white,
                              fontWeight: FontWeight.w700
                          ),),
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (context,index){
                  return const Divider(color: Color(0Xff000f2c),);
                },
                itemCount: cubit.countries.length
            )
        );
      },
    );
  }
}
