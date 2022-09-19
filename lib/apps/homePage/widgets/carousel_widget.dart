import 'package:digital_shop/apps/homePage/controller/home_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_carousel_slider/carousel_slider_indicators.dart';
import 'package:flutter_carousel_slider/carousel_slider_transforms.dart';
import 'package:get/get.dart';

class CarouselWidget extends GetView<HomePageController> {
  const CarouselWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => CarouselSlider.builder(
        //scrollPhysics: const NeverScrollableScrollPhysics(),
        slideIndicator: CircularSlideIndicator(
          padding: const EdgeInsets.only(bottom: 15),
        ),
        slideTransform: const CubeTransform(),
        unlimitedMode: true,
        //autoSliderDelay: const Duration(seconds: 3),
        autoSliderTransitionTime: const Duration(seconds: 3),
        enableAutoSlider: true,
        itemCount: controller.carouselSliderList.value.length,
        slideBuilder: (index) {
          return Container(
            decoration: BoxDecoration(
              //color: Colors.red,
              image: DecorationImage(
                image: NetworkImage(
                  // ignore: invalid_use_of_protected_member
                  controller.carouselSliderList.value[index].imagePath,
                ),
                fit: BoxFit.fill,
              ),
            ),
          );
        },
      ),
    );
  }
}
