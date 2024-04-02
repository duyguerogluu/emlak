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

import 'package:emlak/functions/duygu_nav.dart';
import 'package:emlak/models/advert_model.dart';
import 'package:emlak/screens/advert_card_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:octo_image/octo_image.dart';

class AdvertCard extends ConsumerStatefulWidget {
  const AdvertCard({
    super.key,
    required this.advert,
  });

  final AdvertModel advert;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AdvertCardState();
}

class _AdvertCardState extends ConsumerState<AdvertCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        DuyguNav.push(AdvertDetailScreen(advert: widget.advert));
      },
      child: SizedBox(
        height: 100,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          shadowColor: Colors.black,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              OctoImage(
                height: 100,
                width: 96,
                image: NetworkImage("https://picsum.photos/300"),
                progressIndicatorBuilder:
                    OctoProgressIndicator.circularProgressIndicator(),
                imageBuilder: (context, child) => ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(10.0),
                    topLeft: Radius.circular(10.0),
                  ),
                  child: child,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12, top: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.advert.title,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16,),
                    ),
                    Text(
                      widget.advert.description,
                      style: const TextStyle(
                          fontWeight: FontWeight.normal, fontSize: 12,),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          "${widget.advert.price.amount}₺",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.lightBlueAccent,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
