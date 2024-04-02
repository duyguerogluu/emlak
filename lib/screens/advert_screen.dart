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

import 'package:emlak/components/advert_card.dart';
import 'package:emlak/riverpod/riverpod_management.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AdvertScreen extends ConsumerStatefulWidget {
  const AdvertScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AdvertScreenState();
}

class _AdvertScreenState extends ConsumerState<AdvertScreen> {
  @override
  Widget build(BuildContext context) {
    final watch = ref.watch(advertRiverpod);
    // final read = ref.read(advertRiverpod);

    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: watch.getAdverts(),
        builder: (context, snapshot) {
          if (!snapshot.hasData || snapshot.hasError) {
            return const Center(
              child: Row(
                children: [
                  Text('Yükleniyor...'),
                ],
              ),
            );
          }

          return ListView.builder(
            itemCount: snapshot.data?.length ?? 0,
            itemBuilder: (_, index) => AdvertCard(
              advert: snapshot.data![index],
            ),
          );
        },
      ),
    );
 
  }
}
