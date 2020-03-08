import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

main() => runApp(PerguntaApp());

class _PerguntasAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  void _responder() {
    setState(() {
      _perguntaSelecionada++;
    });
  }

  @override
  Widget build(BuildContext context) {
    //final List<String> perguntas = [
    final List<Map<String, Object>> perguntas = [
      {
        'texto': 'Qual a sua cor favorita?',
        'respostas': ['Preto', 'Vermelho', 'Verde', 'Branco'],
      },
      {
        'texto': 'Qual e o seu animal favorita?',
        'respostas': ['Coelho', 'Cobra', 'Elefante', 'Leao'],
      },
      {
        'texto': 'Qual o seu instrutor?',
        'respostas': ['leo', 'Paula', 'Leandro', 'Lucas'],
      }
    ];

    List<Widget> respostas = [];
    for (var textoResp in perguntas[_perguntaSelecionada]['respostas']) {
      respostas.add(Resposta(textoResp, _responder));
    }
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
        ),
        body: Column(children: <Widget>[
          Questao(perguntas[_perguntaSelecionada]['texto']),
          //Resposta('resposta 01', _responder),
          //Resposta('resposta 02', _responder),
          //Resposta('resposta 03', _responder),
          ...respostas,
        ]),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  _PerguntasAppState createState() {
    return _PerguntasAppState();
  }
}
