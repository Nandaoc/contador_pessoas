//importando biblioteca material design flutter
import 'package:flutter/material.dart';

void main() {
  //comando para rodar o material app - instancia do material app
  runApp(MaterialApp(
      title: "Contador de Pessoas",
      //parâmetro opcional da instancia material app
      home: Home()));
}

class Home extends StatefulWidget{
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home>{

  int _pessoas = 0; //variável privada que será alterada em tempo de execução
  String _frase = "Chega mais!";

  void _plus(int delta){
    setState(() {
      _pessoas += delta; //incrementa a quantidade de pessoas em tempo de execução
      if (_pessoas >= 20){
        _frase = "O lab está cheio";
      };
    });
  }

  void _less(int delta){
    setState(() {
      _pessoas -= delta; //incrementa a quantidade de pessoas em tempo de execução
      if (_pessoas < 0) {
        _frase = "Oi?!";
      };
    });
  }

  @override
  Widget build(BuildContext context){
    return Stack(
      children: [
        Image.asset(
          "images/wallpaper.jpg",
          fit: BoxFit.cover,
          height: 1000,
        ),
        Column(
          //permite colocar os widgets um sobre o outro
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Pessoas: $_pessoas", //variável que será alterada e exibida na tela
              style:
              TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ), //filhos da coluna
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: TextButton(
                    child: Text(
                      "+1",
                      style: TextStyle(fontSize: 40, color: Colors.white),
                    ),
                    onPressed: () {
                      _plus(1);
                    }, //função anônima acrescenta pessoas
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: TextButton(
                    child: Text(
                      "-1",
                      style: TextStyle(fontSize: 40, color: Colors.white),
                    ),
                    onPressed: () {
                      _less(1);
                    }, //função anônima retira pessoas
                  ),
                ),
              ],
            ),
            Text("$_frase",
                style: TextStyle(
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                    fontSize: 30.0))
          ],
        )
      ],
    );
  }
}