/*
 *  This file is part of emlak.
 *
 *  emlak is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation, either version 3 of the License, or
 *  (at your option) any later version.
 *
 *  emlak is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *   along with emlak.  If not, see <https://www.gnu.org/licenses/>.
 */

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
