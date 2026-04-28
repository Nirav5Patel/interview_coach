import 'package:flutter/material.dart';
import 'package:interview_coach/constant/color_res.dart';

class BaseText extends Text{
  final String text;
  final Color? color;
  final TextAlign? textAlign;
  final double? fontSize;
  final String? fontFamily;
  final FontWeight? fontWeight;


  BaseText({super.key,
   required  this.text,
    this.textAlign,
    this.fontSize,
    this.color,
    this.fontFamily,
    this.fontWeight
}):super(
    text,
     textAlign: textAlign,
    style: TextStyle(
      fontSize: fontSize??14,
      fontFamily: fontFamily,
      fontWeight: fontWeight??FontWeight.w400,
      color: color??ColorRes.blackColor
    )
  );

}