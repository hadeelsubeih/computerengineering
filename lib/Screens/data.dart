import 'package:flutter/material.dart';

var pageList = [
  PageModel(
      imageUrl: "assets/word_press_lms.png",
      title: "هندسة الحاسوب",
      body: "يفتخر قسم هندسة الحاسوب بالجامعة الإسلامية بغزة",
      titleGradient: gradients[0]),
  PageModel(
      imageUrl: "assets/best_lms_wordpress.png",
      title: "توجيه وإرشاد",
      body:"يفتخر قسم هندسة الحاسوب بالجامعة الإسلامية بغزة  ",
      titleGradient: gradients[1]),
  PageModel(
      imageUrl: "assets/lms_wordpress_themes.png",
      title: "تواصل",
      body: "يفتخر قسم هندسة الحاسوب بالجامعة الإسلامية بغزة ",
      titleGradient: gradients[2]),
];

List<List<Color>> gradients = [
  [Color(0xFF9708CC), Color(0xFF43CBFF)],
  [Color(0xFFE2859F), Color(0xFFFCCF31)],
  [Color(0xFF5EFCE8), Color(0xFF736EFE)],
];

class PageModel {
  var imageUrl;
  var title;
  var body;
  List<Color> titleGradient = [];
  PageModel({this.imageUrl, this.title, this.body, this.titleGradient});
}
