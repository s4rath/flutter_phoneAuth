import 'dart:io';

import 'package:flutter/material.dart';

class ImageScreen extends StatefulWidget {
  final File? img;
  // ignore: use_key_in_widget_constructors
  const ImageScreen({Key? key, required this.img});

  @override
  State<ImageScreen> createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff8cccff),
      ),
      body: SafeArea(
          child: Center(
        child: Container(
          child: widget.img != null
              ? Image.file(
                  widget.img!,

                  // width: 170,
                  // height: 170,
                  fit: BoxFit.cover,
                )
              : Container(),
              
        ),
      )
          // Column(
          //   children: [
          //     widget.img !=null ? Image.file(
          //                       widget.img!,
          //                       width: 170,
          //                       height: 170,
          //                       fit: BoxFit.cover,
          //                     ): Container()
          //   ],
          // ),
          ),
    );
  }
}
