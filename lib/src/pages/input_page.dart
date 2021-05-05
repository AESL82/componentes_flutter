import 'package:flutter/material.dart';

// Vamos a capturar datos, por ello vamos a usar el StatefulWidget.
class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String
      _nombre; // Lo inicializamos en vacío, cambiara cuando se escriba en él.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inputs de texto'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: <Widget>[
          _crearInput(),
          Divider(),
          _crearPersona(),
        ],
      ),
    );
  }

  _crearInput() {
    return TextField(
      // Si se necesita que al ingresar no aparezca en focus predeterminado
      // el nombre, entonces comentar el autofocus.
      autofocus: true,
      // Capitalización por letras, palabras o lo que así queramos.
      // Para este caso, por sentencia que se agregue al Input.
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          counter: Text('Letras ${_nombre.length}'),
          hintText: 'Nombre de la persona',
          labelText: 'Nombre',
          helperText: 'Sólo es el nombre',
          suffixIcon: Icon(Icons.accessibility),
          icon: Icon(Icons.account_circle)),
      onChanged: (valor) {
        //print(_nombre);
        // Redibujo el Widget por cada letra que se escriba.
        setState(() {
          _nombre = valor;
        });
      },
    );
  }

  _crearPersona() {
    return ListTile(
      title: Text('Nombre es: $_nombre'),
    );
  }
}
