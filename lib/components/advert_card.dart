import 'package:emlak/functions/duygu_nav.dart';
import 'package:emlak/screens/advert_card_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:octo_image/octo_image.dart';

class AdvertCard extends ConsumerStatefulWidget {
  const AdvertCard({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AdvertCardState();
}

class _AdvertCardState extends ConsumerState<AdvertCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        DuyguNav.push(const AdvertDetailScreen());
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
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "İlan Başlığı",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Text(
                      "İlan açıklaması açıklmaası açıklaması açıklaması",
                      style: TextStyle(
                          fontWeight: FontWeight.normal, fontSize: 12),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 8.0),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          "1.000.000 TL",
                          style: TextStyle(
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
