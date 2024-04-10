// ignore_for_file: unused_import, depend_on_referenced_packages
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'screens/user_panel/mainscreen.dart';

void main(){
  // WidgetsFlutterBinding.ensureInitialized();
  // if(kIsWeb){
  //   await Firebase.initializeApp(options: FirebaseOptions(apiKey: 'AIzaSyBsj9LMvppHCHJdgXJkVeHXdL1WCqtBGJk', appId: '1:574848754741:android:f0a1a4d74649f864c2fd7c', messagingSenderId: '574848754741', projectId: 'clothing-app-bc7cd'));
  // }
  // await Firebase.initializeApp();
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const mainscreen(),
    );
  }
}
