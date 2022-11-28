
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fanchat_admin/business_logic/cubit/app_states.dart';
import 'package:fanchat_admin/data/models/country_model.dart';
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

      for (var element in value.docs) {
        allMatches.add(MatchesModel.fromJson(element.data()));
      }


      emit(GetAllMatchesSuccessState());
    }).catchError((error){

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

      getAllMatches(doc: doc);
      emit(UpdateMatchSuccessState());
    }).catchError((error){

      debugPrint('Error in update match is ${error.toString()}');
      emit(UpdateMatchErrorState());
    });

  }

  Future<void> addMatch({

    required String doc,
    required int clock,
    required String date,
    required int index,

  })async{

    MatchesModel matchesModel=MatchesModel(
      firstTeam: selectedTeamName,
      secondTeam: selectedTeamName2,
      firstImage: selectedTeamImage,
      secondImage: selectedTeamImage2,
      doc: doc,
      clock: clock,
      score: 'Not Started',
      date: date
    );
    emit(AddMatchLoadingState());
    FirebaseFirestore.instance
        .collection('matches')
        .doc(doc).collection('matches')
        .doc('$index')
        .set(matchesModel.toMap()).then((value) {

          getAllMatches(doc: doc);

          debugPrint('Match Added Success');
          emit(AddMatchSuccessState());
    }).catchError((error){

      debugPrint('Error in add match is ${error.toString()}');
      emit(AddMatchErrorState());
    });

  }

  List<CountryModel> countries=[];
  String selectedTeamName='';
  String selectedTeamImage='';

  String selectedTeamName2='';
  String selectedTeamImage2='';

  int selectedTime=0;

  Future<void> getCountries()async{

    emit(GetCountryLoadingState());
    FirebaseFirestore.instance.collection('countries').get().then((value) {

      for (var element in value.docs) {

        countries.add(CountryModel.fromJson(element.data()));

      }

      emit(GetCountrySuccessState());
    }).catchError((error){


      debugPrint('Error in getCountries is ${error.toString()}');
      emit(GetCountryErrorState());
    });
    
    
    
    
 }


 void team1Selected({
   required String teamName,
   required String teamImage,
  }){
   selectedTeamName=teamName;
   selectedTeamImage=teamImage;
   emit(SelectedTeam1State());
 }

  void team2Selected({
    required String teamName,
    required String teamImage,
  }){
    selectedTeamName2=teamName;
    selectedTeamImage2=teamImage;
    emit(SelectedTeam2State());
  }

  void timeSelected({
    required int time,
  }){
    selectedTime=time;
    emit(SelectedTimeState());
  }



}