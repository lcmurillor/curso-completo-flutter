import 'package:flutter/material.dart';

class BasicDesignScreen extends StatelessWidget {
  const BasicDesignScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        //Imagen principal
        const Image(image: AssetImage('assets/mountain.jpg')),
        //Titulo
        const Title(),
        //Seccion de botones
        const ButtonSection(),
        //Texto
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          child: const Text(
            'Cupidatat fugiat sint dolore excepteur quis elit nisi esse aute. Excepteur laboris pariatur eu cupidatat ea et ex cupidatat dolor id velit reprehenderit et. Aliquip mollit anim ex cillum nostrud anim nisi. Minim ut anim minim est occaecat occaecat aliqua amet fugiat incididunt.',
            style: TextStyle(fontSize: 15),
          ),
        )
      ],
    ));
  }
}

class ButtonSection extends StatelessWidget {
  const ButtonSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          CustomButton(
            icon: Icons.call,
            text: 'LLAMAR',
          ),
          CustomButton(
            icon: Icons.alt_route,
            text: 'RUTA',
          ),
          CustomButton(
            icon: Icons.share,
            text: 'COMPARTIR',
          ),
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: Colors.blue),
        Text(
          text,
          style: const TextStyle(color: Colors.blue),
        )
      ],
    );
  }
}

class Title extends StatelessWidget {
  const Title({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Un lugar muy bonito con carretera',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                'En una ubicacion desconocida',
                style: TextStyle(color: Colors.black45),
              ),
            ],
          ),
          //Separa los elementos entre ellos al maximo posible
          Expanded(child: Container()),
          const Icon(Icons.star, color: Colors.red),
          const Text('42')
        ],
      ),
    );
  }
}
