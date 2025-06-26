import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plants_app/presentation/plants_list_screen/plants_list_detail.dart';

typedef OnItemClickListener = void Function();

class PlantsView extends StatelessWidget {
  final Plants data;
  final OnItemClickListener onItemClickListener;

  const PlantsView(
      {super.key, required this.data, required this.onItemClickListener});

  @override
  Widget build(BuildContext context) {
    var plantsImage = Container(
      decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.rectangle,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              offset: const Offset(0.0, 0.0),
              blurRadius: 3.0,
              spreadRadius: 0.0,
            )
          ]),
      width: 70,
      height: 70,
      child: Padding(
          padding: const EdgeInsets.all(3),
          child: Image(image: data.image, fit: BoxFit.fill)),
    );

    var center = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(data.title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      ],
    );

    var item = Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(width: 10),
        plantsImage,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [center],
          ),
        ),
      ],
    );

    var result = Card(
        elevation: 5,
        child: InkWell(
            onTap: onItemClickListener,
            child: Padding(padding: const EdgeInsets.all(5), child: item)));
    return result;
  }
}
