import 'package:fl_components/themes/app_theme.dart';
import 'package:flutter/material.dart';

class CustonCardType1 extends StatelessWidget {
  const CustonCardType1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          const ListTile(
            leading: Icon(
              Icons.photo_album_outlined,
              color: AppTheme.primary,
            ),
            title: Text('soy un titulo'),
            subtitle: Text(
                'Aute velit duis occaecat eiusmod aliqua nostrud quis deserunt ipsum cupidatat amet esse dolore aliquip. Anim sunt ipsum dolore deserunt. '),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(onPressed: () {}, child: const Text('Cancelar')),
                TextButton(onPressed: () {}, child: const Text('Ok'))
              ],
            ),
          )
        ],
      ),
    );
  }
}
