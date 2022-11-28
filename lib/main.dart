import 'package:fanchat_admin/business_logic/cubit/app_cubit.dart';
import 'package:fanchat_admin/business_logic/cubit/app_states.dart';
import 'package:fanchat_admin/presentation/screens/splash_screen/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>AppCubit()..getAllMatches(doc: '20 Nov'),
      child: BlocConsumer<AppCubit,AppStates>(
        listener: (context,state){

        },
        builder: (context,state){
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: SplashScreen(),
          );
        },
      ),
    );
  }
}

