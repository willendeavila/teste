import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

var massa;
var altura;
var imc;
var auxiliar;
String msg;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Projeto IMC",
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: WidgetsBasicos(),
    );
  }
}

class WidgetsBasicos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cálculo IMC"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.check),
            onPressed: () {
              showAlertDialog1(context);              
            },
          ),
          IconButton(
            icon: Icon(Icons.info),
            onPressed: () {
              showAlertDialog2(context);
            },
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            valorMassa,
            valorAltura,
            //calculaImc,
            //FloatingActionButton(onPressed: null),
            //Text('Seu IMC $imc', style: TextStyle(fontSize: 30),)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.check),
        onPressed: () {
          showAlertDialog1(context);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  TextField valorMassa = TextField(
      autofocus: true,
      decoration: InputDecoration(
          border: InputBorder.none,
          icon: Icon(Icons.accessibility),
          hintText: 'Informe o massa (Kg)'),
      //keyboardType: TextInputType.number,

      keyboardType: TextInputType.numberWithOptions(decimal: true),
      inputFormatters: [
        BlacklistingTextInputFormatter(new RegExp('[\\-|\\ ]'))
      ],
      onChanged: (value) {
        try {
          massa = double.parse(value);
          print("TextField: $massa");
        } catch (ex) {
          massa = 0.0;
          print("TextField: $massa");
        }
      });

  TextField valorAltura = TextField(
      autofocus: true,
      decoration: InputDecoration(
          border: InputBorder.none,
          icon: Icon(Icons.arrow_upward),
          hintText: 'Informe a Altura em metros'),
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      inputFormatters: [
        BlacklistingTextInputFormatter(new RegExp('[\\-|\\ ]'))
      ],
      onChanged: (value) {
        try {
          altura = double.parse(value);
          print("TextField: $altura");
        } catch (ex) {
          altura = 0.0;
          print("TextField: $altura");
        }
      });

  /*                        < 16            Magreza grave
                             16 a < 17    Magreza moderada
                             17 a < 18,5    Magreza leve
                             18,5 a < 25    Saudável
                             25 a < 30    Sobrepeso
                             30 a < 35    Obesidade Grau I
                             35 a < 40    Obesidade Grau II (severa)
                             = 40         Obesidade Grau III (mórbida)
                             
  RaisedButton calculaImc = RaisedButton(
      child: Text('Calcular'),
      onPressed: () {
        imc = massa / (altura * altura);

        if (imc < 16) {
          print("Magreza grave. IMC: $imc");
        } else if (imc < 17) {
          print("Magreza moderada. IMC: $imc");
        } else if (imc < 18.5) {
          print("Magreza leve. IMC: $imc");
        } else if (imc < 25) {
          print("Saúdavel. IMC: $imc");
        } else if (imc < 30) {
          print("Sobrepeso. IMC: $imc");
        } else if (imc < 35) {
          print("Obesidade Grau I. IMC: $imc");
        } else if (imc < 40) {
          print("Obesidade Grau II (severa). IMC: $imc");
        } else {
          print("Obesidade Grau III (mórbida). IMC: $imc");
        }

        print("Valor do IMC: $imc");
      });

      */

  showAlertDialog1(BuildContext context) {
    imc = massa / (altura * altura);

    if (imc < 16) {
      print("Magreza grave. IMC: $imc");
      msg = "Magreza grave";
    } else if (imc < 17) {
      print("Magreza moderada. IMC: $imc");
      msg = "Magreza moderada";
    } else if (imc < 18.5) {
      print("Magreza leve. IMC: $imc");
      msg = "Magreza leve";
    } else if (imc < 25) {
      print("Saúdavel. IMC: $imc");
      msg = "Saúdavel";
    } else if (imc < 30) {
      print("Sobrepeso. IMC: $imc");
      msg = "Sobrepeso";
    } else if (imc < 35) {
      print("Obesidade Grau I. IMC: $imc");
      msg = "Obesidade Grau I";
    } else if (imc < 40) {
      print("Obesidade Grau II (severa). IMC: $imc");
      msg = "Obesidade Grau II";
    } else {
      print("Obesidade Grau III (mórbida). IMC: $imc");
      msg = "Obesidade Grau III (mórbida)";
    }

    print("Valor do IMC: $imc");
    auxiliar = imc.toStringAsFixed(2);

    // configura o button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    // configura o  AlertDialog
    AlertDialog alerta = AlertDialog(
      title: Text("Seu imc: $auxiliar"),
      content: Text(msg),
      actions: [
        okButton,
      ],
    );
    // exibe o dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alerta;
      },
    );
  }


  showAlertDialog2(BuildContext context) {
   

    print("Valor do IMC: $imc");
    auxiliar = imc.toStringAsFixed(2);

    // configura o button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    // configura o  AlertDialog
    AlertDialog alerta = AlertDialog(
      title: Text("O que é IMC?"),
      content: Text('IMC é a sigla para Índice de Massa Corpórea, parâmetro adotado pela Organização Mundial de Saúde para calcular o peso ideal de cada pessoa.'),
      actions: [
        okButton,
      ],
    );
    // exibe o dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alerta;
      },
    );
  }


}
