// ignore_for_file: file_names, use_key_in_widget_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:queen_file_structure/ui/components/constants.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String? title;
  final Color? color;
  final bool isLoading;
  const CustomButton(
      {this.onPressed, this.title, this.color, this.isLoading = false});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
      height: MediaQuery.of(context).size.height / 14,
      width: MediaQuery.of(context).size.width / 1.2,
      child: RaisedButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            isLoading != true
                ? Text(
                    title!,
                    style: const TextStyle(
                      color: Colors.white,
                      fontFamily: "dinnextl bold",
                      fontSize: 18,
                    ),
                  )
                : const SpinKitChasingDots(
                    size: 20,
                    color: Colors.white,
                  ),
          ],
        ),
        color: color ?? kPrimaryColor,
        onPressed: onPressed,
        elevation: 3,
      ),
    );
  }
}
