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
