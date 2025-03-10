import 'package:flutter/material.dart';

class CardContainer extends StatelessWidget {
  const CardContainer({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        child: child,
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: _createCardShepe(),
      ),
    );
  }

  BoxDecoration _createCardShepe() => BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          boxShadow: const [
            BoxShadow(
                blurRadius: 15, color: Colors.black12, offset: Offset(0, 5))
          ]);
}
