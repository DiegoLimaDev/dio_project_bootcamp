import 'package:flutter/material.dart';
import 'package:my_app/shared/app_images.dart';

class ImageAssetsPage extends StatefulWidget {
  const ImageAssetsPage({super.key});

  @override
  State<ImageAssetsPage> createState() => _ImageAssetsPageState();
}

class _ImageAssetsPageState extends State<ImageAssetsPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          AppImages.user1(),
          height: 50,
        ),
        Image.asset(
          AppImages.user2(),
          height: 50,
        ),
        Image.asset(
          AppImages.user3(),
          height: 50,
        ),
        Image.asset(
          AppImages.horizon1(),
          width: double.infinity,
        ),
        Image.asset(
          AppImages.horizon2(),
          height: 50,
        ),
        Image.asset(
          AppImages.horizon3(),
          height: 50,
        ),
      ],
    );
  }
}
