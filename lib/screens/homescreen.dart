import 'dart:io';

import 'package:cam_app/screens/imagescreen.dart';
import 'package:cam_app/screens/videoscreen.dart';
import 'package:cam_app/widgets/custombutton.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  File? pickedImage;
  File? pickedVid;
  final ImagePicker picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          SizedBox(
            width: 200,
            height: 50,
            child: CustomButton(
          
                onPressed: () async {
                  try {
                    final photo = await picker.pickImage(source: ImageSource.camera);
                    if (photo== null) return;
                    final tempImage= File(photo.path);
                    setState(() {
                      pickedImage=tempImage;
                    });
                  } catch (e) {
                    debugPrint(e.toString());
                  }
                  // ignore: use_build_context_synchronously
                  Navigator.of(context).push(MaterialPageRoute(builder: (ctx){return ImageScreen( img: pickedImage,);}));
                },
                
                text: "Picture",
                ),
          ),const SizedBox(height: 20,),
              SizedBox(
                height: 50,
                width: 200,
                child: CustomButton(onPressed: () async {
                  try {
                    final video= await picker.pickVideo(source: ImageSource.camera);
                    if (video==null) return;
                    final tempVid= File(video.path);
                    setState(() {
                      pickedVid=tempVid;
                    });
                  } catch (e) {
                    debugPrint(e.toString());
                  }
                  // ignore: use_build_context_synchronously
                  Navigator.of(context).push(MaterialPageRoute(builder: (ctx){return VideoScreen( vid: pickedVid,);}));
                }, text: "Video",),
              ), 
              
        ]),
      ),
    );
  }
}
