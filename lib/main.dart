import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: Frases()));
}

class Frases extends StatefulWidget {
  const Frases({Key key}) : super(key: key);

  @override
  _FrasesState createState() => _FrasesState();
}

class _FrasesState extends State<Frases> {
  var _frase = [
    'Nunca deixe ninguém te dizer que não pode fazer alguma coisa. Se você tem um sonho tem que correr atrás dele. As pessoas não conseguem vencer e dizem que você também não vai vencer. Se você quer uma coisa corre atrás.',
    'As pessoas costumam dizer que a motivação não dura sempre. Bem, nem o efeito do banho, por isso recomenda-se diariamente.',
    'Motivação é a arte de fazer as pessoas fazerem o que você quer que elas façam porque elas o querem fazer.',
    'Toda ação humana, quer se torne positiva ou negativa, precisa depender de motivação.',
    'A verdadeira motivação vem de realização, desenvolvimento pessoal, satisfação no trabalho e reconhecimento.',
    'A amizade desenvolve a felicidade e reduz o sofrimento, duplicando a nossa alegria e dividindo a nossa dor.',
    'O segredo da felicidade é encontrar a nossa alegria na alegria dos outros.',
    'A verdadeira felicidade vem da alegria de atos bem feitos, do sabor de criar coisas renovadas.',
  ];
  var fraseGerada = 'Clique no botão abaixo para gerar a Imagem do Dia';

  var images = [
    "images/temp.jpg",
    "images/2.jpg",
    "images/3.jpg",
    "images/5.jpg",
    "images/6.jpg",
    "images/7.jpg",
    "images/8.jpg"
  ];
  var fraseText = 'Gerar Frase!';
  var imageGerada = "images/temp.jpg";
  void imageSorteada() {
    var frasesorteada = Random().nextInt(_frase.length);
    var imagesorteada = Random().nextInt(images.length);
    setState(() {
      imageGerada = images[imagesorteada];
      fraseGerada = _frase[frasesorteada];
      fraseText = 'Gere outra frase';
    });
  }

  int gostei = 1;
  String gosteiInt = '1';
  void contagemGostei() {
    setState(() {
      gostei = gostei + 1;
      gosteiInt = gostei.toString();
    });
  }

  int compart = 1;
  String compartInt = '1';
  void contagemCompart() {
    setState(() {
      compart = compart + 1;
      compartInt = compart.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black38,
        title: Text(
          'Frase do Dia',
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white10,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Stack(
              children: [
                Center(
                  child: Container(
                    height: 340,
                    width: 280,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.white.withOpacity(0.1),
                            blurRadius: 30,
                            offset: Offset(-10, 5),
                            spreadRadius: -20
                            // Shadow position
                            ),
                      ],
                    ),
                    child: Center(
                      child: Container(
                        height: 320,
                        width: 270,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          image: DecorationImage(
                            image: AssetImage(imageGerada.toString()),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.4),
                                  border: Border.all(
                                      color: Colors.white, width: 1.0),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(40.0))),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text((fraseGerada.toString()),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontStyle: FontStyle.italic)),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: imageSorteada,
                child: Container(
                    height: 40,
                    width: 150,
                    decoration: BoxDecoration(
                      color: fraseText == 'Gerar Frase!'
                          ? Colors.white
                          : Colors.redAccent,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.white.withOpacity(0.3),
                            blurRadius: 20,
                            offset: Offset(-10, 10),
                            spreadRadius: -10
                            // Shadow position
                            ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        fraseText,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    )),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
