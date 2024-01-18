import 'package:emlak/components/photo_gallery.dart';
import 'package:emlak/functions/duygu_nav.dart';
import 'package:emlak/screens/photo_gallery_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AdvertCardDetail extends ConsumerStatefulWidget {
  const AdvertCardDetail({super.key});

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
            "Yenişehir Satılık Daire",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(0.0),
          child: Text(
            "10.000.000 TL",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ),
        Divider(
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
                  "10100101011001",
                  style: TextStyle(
                    fontWeight: FontWeight.w100,
                    fontSize: desFS,
                  ),
                ),
              ),
            ),
          ],
        ),
        Divider(
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
                  "10 Aralık 2023",
                  style: TextStyle(
                    fontWeight: FontWeight.w100,
                    fontSize: desFS,
                  ),
                ),
              ),
            ),
          ],
        ),
        Divider(
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
                  "Satılık DAİRE",
                  style: TextStyle(
                    fontWeight: FontWeight.w100,
                    fontSize: desFS,
                  ),
                ),
              ),
            ),
          ],
        ),
        Divider(
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
                    "m2",
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
                  "300",
                  style: TextStyle(
                    fontWeight: FontWeight.w100,
                    fontSize: desFS,
                  ),
                ),
              ),
            ),
          ],
        ),
        Divider(
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
                  "4+1",
                  style: TextStyle(
                    fontWeight: FontWeight.w100,
                    fontSize: desFS,
                  ),
                ),
              ),
            ),
          ],
        ),
        Divider(
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
                  "3",
                  style: TextStyle(
                    fontWeight: FontWeight.w100,
                    fontSize: desFS,
                  ),
                ),
              ),
            ),
          ],
        ),
        Divider(
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
                  "10",
                  style: TextStyle(
                    fontWeight: FontWeight.w100,
                    fontSize: desFS,
                  ),
                ),
              ),
            ),
          ],
        ),
        Divider(
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
                  "Kombi (Doğalgaz)",
                  style: TextStyle(
                    fontWeight: FontWeight.w100,
                    fontSize: desFS,
                  ),
                ),
              ),
            ),
          ],
        ),
        Divider(
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
        Divider(
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
        Divider(
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
        Divider(
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
        Divider(
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
      ],
    ));
  }
}
