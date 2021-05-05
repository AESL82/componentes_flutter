import 'package:flutter/material.dart';

// Vamos a capturar datos, por ello vamos a usar el StatefulWidget.
class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _nombre = ''; // Cambiara cuando se escriba en él.
  String _email = '';
  String _fecha = '';
  String _opcionSeleccionada = 'Selección 1';
  List<String> _seleccionar = [
    'Selección 1',
    'Selección 2',
    'Selección 3',
    'Selección 4'
  ];
  TextEditingController _inputFieldDateController = new TextEditingController();

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
          _crearEmail(),
          Divider(),
          _crearPassword(),
          Divider(),
          _crearFecha(context),
          Divider(),
          _crearDropdown(),
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
      subtitle: Text('Email: $_email'),
      trailing:
          Text(_opcionSeleccionada), // trailing es para que aparezca al final.
    );
  }

  _crearEmail() {
    return TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
            hintText: 'Correo electrónico',
            labelText: 'Email',
            suffixIcon: Icon(Icons.alternate_email),
            icon: Icon(Icons.email)),
        onChanged: (valor) => setState(() {
              _email = valor;
            }));
  }

  _crearPassword() {
    return TextField(
        obscureText: true,
        decoration: InputDecoration(
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
            hintText: 'Password',
            labelText: 'Contraseña',
            suffixIcon: Icon(Icons.lock_open),
            icon: Icon(Icons.lock)),
        onChanged: (valor) => setState(() {
              _email = valor;
            }));
  }

  _crearFecha(BuildContext) {
    return TextField(
      enableInteractiveSelection: false,
      controller: _inputFieldDateController,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Fecha de nacimiento',
          labelText: 'Fecha de nacimiento',
          suffixIcon: Icon(Icons.perm_contact_calendar),
          icon: Icon(Icons.calendar_today)),
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      },
    );
  }

  void _selectDate(BuildContext context) async {
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2018),
        lastDate: new DateTime(2025),
        locale: Locale('es', 'ES'));
    if (picked != null) {
      setState(() {
        _fecha = picked.toString();
        _inputFieldDateController.text = _fecha;
      });
    }
  }

  List<DropdownMenuItem<String>> getOpcionesDropdown() {
    List<DropdownMenuItem<String>> lista = new List();

    _seleccionar.forEach((seleccion) {
      lista.add(DropdownMenuItem(
        child: Text(seleccion),
        value: seleccion,
      ));
    });

    return lista;
  }

  _crearDropdown() {
    return Row(
      children: [
        Icon(Icons.select_all),
        SizedBox(
          width: 30.0,
        ),
        Expanded(
          child: DropdownButton(
            value: _opcionSeleccionada,
            items: getOpcionesDropdown(),
            onChanged: (opt) {
              setState(() {
                _opcionSeleccionada = opt;
              });
            },
          ),
        )
      ],
    );
  }
}
