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

import 'package:emlak/components/advert_card_detail.dart';
import 'package:emlak/models/advert_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AdvertDetailScreen extends ConsumerStatefulWidget {
  const AdvertDetailScreen({
    super.key,
    required this.advert,
  });

  final AdvertModel advert;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AdvertDetailScreenState();
}

class _AdvertDetailScreenState extends ConsumerState<AdvertDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
            child: AdvertCardDetail(
          advert: widget.advert,
        )),
      ),
    );
  }
}
