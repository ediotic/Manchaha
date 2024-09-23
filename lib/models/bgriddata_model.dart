import 'package:flutter/material.dart';

class BGridData {
  String image;
  String productName;
  Widget row;
  bool isLiked;

  BGridData({
    required this.image,
    required this.productName,
    required this.row,
    this.isLiked = false, // Added a default value
  });
}
