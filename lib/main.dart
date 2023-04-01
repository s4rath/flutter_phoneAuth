

import 'package:cam_app/provider/auth_provider.dart';
import 'package:cam_app/registerscreen.dart';
import 'package:cam_app/screens/homescreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>AuthProvider())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const RegisterScreen(),
      ),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  

  @override
  State<SplashScreen> createState() => _SplashScreenState();
  
}

class _SplashScreenState extends State<SplashScreen> {
  


  @override
  Widget build(BuildContext context) {
    final ap= Provider.of<AuthProvider>(context,listen: false);
    return Material(
      child: Column(
        children: [
          Container( 
            color: Colors.white, 
            child: const Center(
              child: Text(
                'Loading.....',
                style: TextStyle(color: Color.fromARGB(255, 104, 139, 157)),
              ),
            ),
          ),
          ElevatedButton(onPressed: (){
            ap.isSignedIn== true? Navigator.push(context,MaterialPageRoute(builder: (context){
              return const HomeScreen();
            }
            )
            ): Navigator.push(context,MaterialPageRoute(builder: (context){
              return const RegisterScreen();
            }
            )
            );
          }, child: const Text('Get started'))
        ],
      ),
    );
  }


}


