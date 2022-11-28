import 'package:fanchat_admin/presentation/screens/matches/show_all_matches.dart';
import 'package:fanchat_admin/presentation/widgets/shared_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Expanded(
                  child: GridView.count(
                    childAspectRatio: 1/1,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 2,
                    children:List.generate(1, (index) => GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (_){
                          return const ShowAllMatches();
                        }));
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height*.05,
                        width: MediaQuery.of(context).size.height*.06,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          border: Border.all(
                            color: Colors.grey
                          )
                        ),
                        child: Column(
                          children: [
                            const Image(
                                fit: BoxFit.cover,
                                image: AssetImage('assets/images/match.jpg',)
                            ),
                            SizedBox(height: MediaQuery.of(context).size.height*.015,),
                            Text('Matches',style: GoogleFonts.roboto(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: MediaQuery.of(context).size.height*.025
                            ),)
                          ],

                        ),
                      ),
                    )),
                  ),
                )
              ],
            ),

          )
        ],
      ),
    );
  }
}
