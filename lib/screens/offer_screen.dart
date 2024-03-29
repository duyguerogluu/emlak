import 'package:emlak/models/offer_model.dart';
import 'package:emlak/riverpod/riverpod_management.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OfferScreen extends ConsumerStatefulWidget {
  const OfferScreen({
    super.key,
  });

  @override
  void initState() {
    bool _pageAnn = true;
  }

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _OfferScreenState();
}

class _OfferScreenState extends ConsumerState<OfferScreen> {
  bool _ishidden = true;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<OfferModel>?>(
      future: offer.getOffer(),
      builder: (context, snapshot) {
        debugPrint("Connection State: ${snapshot.connectionState}");
        debugPrint("Has Error: ${snapshot.hasError}");
        debugPrint("Has Data: ${snapshot.hasData}");
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text("Hata: ${snapshot.error}"),
          );
        } else if (!snapshot.hasData) {
          return const Center(
            child: Text("Veri bulunamadı."),
          );
        } else {
          var offers = snapshot.data!;
          return Expanded(
            child: ListView.builder(
              itemCount: offers.length,
              itemBuilder: (context, index) {
                var offer = offers[index];

                return Card(
                  child: ListTile(
                    title: Text(
                      offer.baslik ?? '',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    subtitle: Text(offer.aciklama ?? ''),
                  ),
                );
              },
            ),
          );
        }
      },
    );
  }
}
