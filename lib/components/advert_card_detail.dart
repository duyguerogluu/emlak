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


import 'package:emlak/components/photo_gallery.dart';
import 'package:emlak/functions/date_utils.dart';
import 'package:emlak/functions/duygu_nav.dart';
import 'package:emlak/models/advert_model.dart';
import 'package:emlak/screens/photo_gallery_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AdvertCardDetail extends ConsumerStatefulWidget {
  const AdvertCardDetail({
    super.key,
    required this.advert,
  });

  final AdvertModel advert;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AdvertCarDetailState();
}

class _AdvertCarDetailState extends ConsumerState<AdvertCardDetail> {
  double desFS = 12.0;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: InkWell(
              onTap: () {
                DuyguNav.push(PhotoGalleryScreen());
              },
              //child: Image.network('https://picsum.photos/200'),
              child: SizedBox(
                height: 200,
                child: PhotoGallery(),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            widget.advert.title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(0.0),
          child: Text(
            "${widget.advert.price.amount}₺",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ),
        const Divider(
          height: 10,
          color: Colors.black,
          thickness: 0.2,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "İlan No",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: desFS,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  widget.advert.advertId!,
                  style: TextStyle(
                    fontWeight: FontWeight.w100,
                    fontSize: desFS,
                  ),
                ),
              ),
            ),
          ],
        ),
        const Divider(
          height: 10,
          color: Colors.black,
          thickness: 0.2,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "İlan Tarihi",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: desFS,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  widget.advert.created!.dMMMy(),
                  style: TextStyle(
                    fontWeight: FontWeight.w100,
                    fontSize: desFS,
                  ),
                ),
              ),
            ),
          ],
        ),
        const Divider(
          height: 10,
          color: Colors.black,
          thickness: 0.2,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Emlak Tipi",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: desFS,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  widget.advert.advertType,
                  style: TextStyle(
                    fontWeight: FontWeight.w100,
                    fontSize: desFS,
                  ),
                ),
              ),
            ),
          ],
        ),
        const Divider(
          height: 10,
          color: Colors.black,
          thickness: 0.2,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Metrekare",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: desFS,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  widget.advert.m2Gross.toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.w100,
                    fontSize: desFS,
                  ),
                ),
              ),
            ),
          ],
        ),
        const Divider(
          height: 10,
          color: Colors.black,
          thickness: 0.2,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Oda Sayısı",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: desFS,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  widget.advert.rooms.toRoomCount,
                  style: TextStyle(
                    fontWeight: FontWeight.w100,
                    fontSize: desFS,
                  ),
                ),
              ),
            ),
          ],
        ),
        const Divider(
          height: 10,
          color: Colors.black,
          thickness: 0.2,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Bulunduğu Kat",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: desFS,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  widget.advert.apartmentFloor.toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.w100,
                    fontSize: desFS,
                  ),
                ),
              ),
            ),
          ],
        ),
        const Divider(
          height: 10,
          color: Colors.black,
          thickness: 0.2,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Kat Sayısı",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: desFS,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  widget.advert.apartmentTotalFloor.toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.w100,
                    fontSize: desFS,
                  ),
                ),
              ),
            ),
          ],
        ),
        const Divider(
          height: 10,
          color: Colors.black,
          thickness: 0.2,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Isınma",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: desFS,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  widget.advert.heatingType,
                  style: TextStyle(
                    fontWeight: FontWeight.w100,
                    fontSize: desFS,
                  ),
                ),
              ),
            ),
          ],
        ),
        /*
        const Divider(
          height: 10,
          color: Colors.black,
          thickness: 0.2,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Eşyalı",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: desFS,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  "Hayır",
                  style: TextStyle(
                    fontWeight: FontWeight.w100,
                    fontSize: desFS,
                  ),
                ),
              ),
            ),
          ],
        ),
        const Divider(
          height: 10,
          color: Colors.black,
          thickness: 0.2,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Kullanım Durumu",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: desFS,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  "Kiracılı",
                  style: TextStyle(
                    fontWeight: FontWeight.w100,
                    fontSize: desFS,
                  ),
                ),
              ),
            ),
          ],
        ),
        const Divider(
          height: 10,
          color: Colors.black,
          thickness: 0.2,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Aidat",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: desFS,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  "200",
                  style: TextStyle(
                    fontWeight: FontWeight.w100,
                    fontSize: desFS,
                  ),
                ),
              ),
            ),
          ],
        ),
        const Divider(
          height: 10,
          color: Colors.black,
          thickness: 0.2,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Krediye Uygun",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: desFS,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  "Evet",
                  style: TextStyle(
                    fontWeight: FontWeight.w100,
                    fontSize: desFS,
                  ),
                ),
              ),
            ),
          ],
        ),
        const Divider(
          height: 10,
          color: Colors.black,
          thickness: 0.2,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Tapu Durumu",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: desFS,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  "Kat İrtifaklı",
                  style: TextStyle(
                    fontWeight: FontWeight.w100,
                    fontSize: desFS,
                  ),
                ),
              ),
            ),
          ],
        ),
        */
      ],
    ));
  }
}
