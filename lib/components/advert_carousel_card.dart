import 'dart:convert';

import 'package:emlak/models/advert_model.dart';
import 'package:emlak/service/service.dart';
import 'package:flutter/material.dart';

class AdvertCarouselCard extends StatelessWidget {
  const AdvertCarouselCard({
    super.key,
    required this.advert,
  });

  final AdvertModel advert;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        FutureBuilder(
          future: Service.imagesCall(
            photoIds: [advert.images.first.id],
          ),
          builder: (context, snapshot) => Container(
            width: double.infinity,
            height: double.infinity,
            foregroundDecoration: BoxDecoration(
              color: Colors.black.withAlpha(0x66),
            ),
            child: Image.memory(
              base64Decode(snapshot.data![advert.images.first.id]),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: Text(advert.title),
        ),
      ],
    );
  }
}
