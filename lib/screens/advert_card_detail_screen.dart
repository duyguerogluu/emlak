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
