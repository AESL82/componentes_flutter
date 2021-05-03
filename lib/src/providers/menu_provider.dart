import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class _MenuProvider {
  List<dynamic> opciones = [];

  _MenuProvider() {
    //cargarData();
  }

  Future<List<dynamic>> cargaData() async {
    final resp = await rootBundle.loadString('data/menu_opts.json');

    Map dataMap = json.decode(resp);
    //print(dataMap['rutas']);
    opciones = dataMap['rutas'];

    return opciones;
  }

  /*
  void cargarData() {
    rootBundle.loadString('data/menu_opts.json').then((data) {
      //print(data);
      Map dataMap = json.decode(data);
      print(dataMap['rutas']);
      opciones = dataMap['rutas'];
    });
  }
*/
}

final menuProvider = new _MenuProvider();
