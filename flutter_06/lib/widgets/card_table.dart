import 'dart:ui';

import 'package:flutter/material.dart';

class CardTable extends StatelessWidget {
  const CardTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Table(
      children: const [
        TableRow(children: [
          _SingleCard(
            color: Colors.blue,
            icon: Icons.search_off_outlined,
            text: 'Buscar',
          ),
          _SingleCard(
            color: Colors.purple,
            icon: Icons.bus_alert_outlined,
            text: 'Trafico',
          )
        ]),
        TableRow(children: [
          _SingleCard(
            color: Colors.pink,
            icon: Icons.shop_2_outlined,
            text: 'Compras',
          ),
          _SingleCard(
            color: Colors.orange,
            icon: Icons.document_scanner_outlined,
            text: 'Facturas',
          )
        ]),
        TableRow(children: [
          _SingleCard(
            color: Colors.cyan,
            icon: Icons.movie_creation_outlined,
            text: 'Entretenimiento',
          ),
          _SingleCard(
            color: Colors.green,
            icon: Icons.food_bank_outlined,
            text: 'Tienda',
          )
        ])
      ],
    );
  }
}

class _SingleCard extends StatelessWidget {
  const _SingleCard(
      {Key? key, required this.icon, required this.text, required this.color})
      : super(key: key);
  final IconData icon;
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final column = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundColor: color,
          radius: 35.0,
          child: Icon(
            icon,
            size: 40,
            color: Colors.white,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          text,
          style: TextStyle(color: color, fontSize: 18),
        )
      ],
    );
    return _CardBackground(widget: column);
  }
}

class _CardBackground extends StatelessWidget {
  const _CardBackground({Key? key, required this.widget}) : super(key: key);

  final Widget widget;
  @override
  Widget build(BuildContext context) {
    final boxDecoration = BoxDecoration(
      color: const Color.fromRGBO(62, 66, 107, 0.7),
      borderRadius: BorderRadius.circular(20),
    );
    return Container(
      margin: const EdgeInsets.all(15),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          //Creador de efecto de degradado
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(
            //margin: const EdgeInsets.all(15),
            height: 180,
            decoration: boxDecoration,
            child: widget,
          ),
        ),
      ),
    );
  }
}
