import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoesapp/src/helpers/helpers.dart';
import 'package:shoesapp/src/models/zapato_model.dart';
import 'package:shoesapp/src/widgets/custom_widgets.dart';

class ZapatoDescPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    cambiarStatusLight();
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Hero(tag: "zapato-1", child: ZapatoSizePreview(fullScreen: true)),
              Positioned(
                top: 60,
                child: FloatingActionButton(
                  child: Icon(
                    Icons.chevron_left,
                    color: Colors.white,
                    size: 60,
                  ),
                  onPressed: () {
                    cambiarStatusDark();
                    Navigator.pop(context);
                  },
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  highlightElevation: 0,
                ),
              ),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ZapatoDescripcion(
                    titulo: "Nike Air Max 720",
                    descripcion:
                        "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.",
                  ),
                  _MontoByNow(),
                  _ColoresYmas(),
                  _BotonesAbajo()
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _BotonesAbajo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 30),
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _BotonAbajo(Icon(
            Icons.star,
            color: Colors.red,
            size: 25,
          )),
          _BotonAbajo(Icon(
            Icons.add_shopping_cart,
            color: Colors.grey.withOpacity(0.4),
            size: 25,
          )),
          _BotonAbajo(Icon(
            Icons.settings,
            color: Colors.grey.withOpacity(0.4),
            size: 25,
          ))
        ],
      ),
    );
  }
}

class _BotonAbajo extends StatelessWidget {
  final Icon icono;

  const _BotonAbajo(this.icono);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: this.icono,
      width: 55,
      height: 55,
      decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
                color: Colors.black12,
                spreadRadius: -5,
                blurRadius: 20,
                offset: Offset(0, 10))
          ]),
    );
  }
}

class _ColoresYmas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          Expanded(
            child: Stack(
              children: [
                Positioned(
                  left: 90,
                  child: _BotonColor(
                    color: Color(0xff364D56),
                    index: 4,
                    assetImage: "assets/imgs/negro.png",
                  ),
                ),
                Positioned(
                  left: 60,
                  child: _BotonColor(
                      color: Color(0xff2099F1),
                      index: 3,
                      assetImage: "assets/imgs/azul.png"),
                ),
                Positioned(
                  left: 30,
                  child: _BotonColor(
                      color: Color(0xffFFAD29),
                      index: 2,
                      assetImage: "assets/imgs/amarillo.png"),
                ),
                _BotonColor(
                    color: Color(0xffC6D642),
                    index: 1,
                    assetImage: "assets/imgs/verde.png"),
              ],
            ),
          ),
          BotonNaranja(
            texto: "More related item",
            alto: 30,
            ancho: 170,
            color: Color(0xffFFC675),
          )
        ],
      ),
    );
  }
}

class _BotonColor extends StatelessWidget {
  final Color color;
  final int index;
  final String assetImage;
  const _BotonColor({
    this.color,
    this.index,
    this.assetImage,
  });

  @override
  Widget build(BuildContext context) {
    final zapatoModel = Provider.of<ZapatoModel>(context);

    return FadeInLeft(
      delay: Duration(milliseconds: this.index * 100),
      duration: Duration(milliseconds: 300),
      child: GestureDetector(
        onTap: () {
          zapatoModel.assetImage = this.assetImage;
        },
        child: Container(
          width: 35,
          height: 35,
          decoration: BoxDecoration(color: this.color, shape: BoxShape.circle),
        ),
      ),
    );
  }
}

class _MontoByNow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        margin: EdgeInsets.only(top: 20, bottom: 20),
        child: Row(
          children: [
            SizedBox(
              width: 20,
            ),
            Text(
              "\$180",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            Spacer(),
            Bounce(
              delay: Duration(seconds: 1),
              from: 8,
              child: BotonNaranja(
                texto: "Buy now",
                ancho: 100,
                alto: 40,
              ),
            ),
            SizedBox(
              width: 20,
            ),
          ],
        ),
      ),
    );
  }
}
