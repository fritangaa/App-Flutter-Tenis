import 'package:flutter/material.dart';

class BotonNaranja extends StatelessWidget {
  final double alto;
  final double ancho;
  final String texto;
  final Color color;

  const BotonNaranja(
      {@required this.texto,
      this.alto = 40,
      this.ancho = 130,
      this.color = Colors.orange});
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: this.ancho,
      height: this.alto,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: this.color,
      ),
      child: Text(
        "$texto",
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
