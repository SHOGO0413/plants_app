import 'package:flutter/cupertino.dart';

class Plants {
  ImageProvider image;
  String title;

  Plants({
    required this.image,
    required this.title,
  });
}

class PhotoInf {
  String plantsID;
  String dateID;

  PhotoInf({
    required this.plantsID,
    required this.dateID,
  });
}