
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fanchat_admin/business_logic/cubit/app_states.dart';
import 'package:fanchat_admin/data/models/matches_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class AppCubit extends Cubit<AppStates>{

  AppCubit() : super (InitialState());

  static AppCubit get(context)=> BlocProvider.of(context);

  final manager=CacheManager(Config(
    'customCacheKey',
    stalePeriod: const Duration(days: 15),maxNrOfCacheObjects: 100,)
  );

  List isDay= List.generate(28, (index) => false);

  List<MatchesModel> allMatches=[];

  Future<void> getAllMatches({

    required String doc

  })async{

    emit(GetAllMatchesLoadingState());
    FirebaseFirestore.instance
        .collection('matches')
        .doc(doc)
        .collection('matches')
        .get().then((value){
      allMatches=[];

      value.docs.forEach((element) {

        allMatches.add(MatchesModel.fromJson(element.data()));

      });

      print(allMatches.length);

      emit(GetAllMatchesSuccessState());


    }).catchError((error){

      print('Error is ${error.toString()}');
      emit(GetAllMatchesErrorState());

    });
    
  }
  
  
  Future<void> updateMatch({
  
   required String doc,
   required int index,
   required String firstScore,
   required String secondScore,

  })async{

    emit(UpdateMatchLoadingState());
    FirebaseFirestore.instance
        .collection('matches')
        .doc(doc).collection('matches')
        .doc('$index')
        .update({
      'score':'$firstScore - $secondScore'
        }).then((value) {

      debugPrint('================Match Update Done================');
      getAllMatches(doc: doc);
      emit(UpdateMatchSuccessState());

    }).catchError((error){

      debugPrint('Error in update match is ${error.toString()}');
      emit(UpdateMatchErrorState());

    });

  }

}