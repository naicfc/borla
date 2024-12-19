import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

class CarouselItem extends StatefulWidget {
  const CarouselItem({super.key});

  @override
  State<CarouselItem> createState() => _CarouselItemState();
}

class _CarouselItemState extends State<CarouselItem> {
  final items = [
    SingleChildScrollView(
      child: Column(
        children: [
          Image.asset('assets/images/tip1img.png'),
          const Text(
            "Environmental Health Tips",
            style: TextStyle(fontWeight: FontWeight.w600),
          )
        ],
      ),
    ),
    SingleChildScrollView(
      child: Column(
        children: [
          Image.asset('assets/images/tip1img.png'),
          const Text(
            "Environmental Health Tips",
            style: TextStyle(fontWeight: FontWeight.w600),
          )
        ],
      ),
    ),
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              autoPlay: true,
              aspectRatio: 1.5,
              enlargeCenterPage: true,
              onPageChanged: (index, reason) {
                setState(() {
                  currentIndex = index;
                });
              },
            ),
            items: items,
          ),
          DotsIndicator(
            dotsCount: items.length,
            position: currentIndex,
          )
        ],
      ),
    );
  }
}
