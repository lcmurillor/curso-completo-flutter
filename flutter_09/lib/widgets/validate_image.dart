import 'dart:io';

import 'package:flutter/material.dart';

class GetImage extends StatelessWidget {
  const GetImage({Key? key, this.picture}) : super(key: key);
  final String? picture;

  @override
  Widget build(BuildContext context) {
    if (picture == null) {
      return const Image(
          image: AssetImage('assets/no-image.png'), fit: BoxFit.cover);
    }
    if (picture!.startsWith('http')) {
      return FadeInImage(
        placeholder: const AssetImage('assets/jar-loading.gif'),
        image: NetworkImage(picture!),
        fit: BoxFit.cover,
      );
    }
    return Image.file(File(picture!), fit: BoxFit.cover);
  }
}
