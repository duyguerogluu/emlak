import 'package:emlak/components/advert_card.dart';
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
    return Scaffold(
      body: ListView(children: List.generate(100, (i) => AdvertCard())),
    );
  }
}
