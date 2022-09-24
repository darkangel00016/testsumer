import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../domain/entities/gif_entity.dart';

class DashboardItem extends StatelessWidget {
  final GifEntity item;

  DashboardItem({Key? key, required this.item})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.parse(item.height),
      child: CachedNetworkImage(
        imageUrl: item.url,
        fit: BoxFit.cover,
        placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}