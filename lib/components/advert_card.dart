import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AdvertCard extends ConsumerStatefulWidget {
  const AdvertCard({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AdvertCardState();
}

class _AdvertCardState extends ConsumerState<AdvertCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
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
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(10.0),
                  topLeft: Radius.circular(10.0),
                ),
                child: Image.network(
                  "https://picsum.photos/300",
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
