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

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PhotoGallery extends ConsumerStatefulWidget {
  const PhotoGallery({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PhotoGalleryState();
}

class _PhotoGalleryState extends ConsumerState<PhotoGallery> {
  final List<String?> images = [
    'https://images.pexels.com/photos/206359/pexels-photo-206359.jpeg?auto=compress&cs=tinysrgb&w=400',
    'https://images.pexels.com/photos/206359/pexels-photo-206359.jpeg?auto=compress&cs=tinysrgb&w=400',
    'https://images.pexels.com/photos/206359/pexels-photo-206359.jpeg?auto=compress&cs=tinysrgb&w=400',
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        autoPlay: false,
        enlargeCenterPage: true,
        viewportFraction: 1.0,
        height: 400,
        aspectRatio: 1,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlayInterval: Duration(seconds: 3),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeFactor: 0.3,
        scrollDirection: Axis.horizontal,
      ),
      items: images.map((String? imageUrl) {
        return Builder(
          builder: (BuildContext context) {
            return Image.network(
              imageUrl!,
              fit: BoxFit.cover,
            );
          },
        );
      }).toList(),
    );
  }
}
