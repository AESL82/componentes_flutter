import 'package:flutter/material.dart';

// OJO: ícono que no aparezca en este mapa, simplemente no se va a mostrar.
// Es el detalle a tener en consideración. Esto es temporal mientras se logra
// obtener de Fluttter una opción ya propia en la clase Icon.
final _icons = <String, IconData>{
  'add_alert': Icons.add_alert,
  'accessibility': Icons.accessibility,
  'folder_open': Icons.folder_open,
  'donut_large': Icons.donut_large,
  'input': Icons.input,
  'tune': Icons.tune,
};

Icon getIcon(String nombreIcono) {
  return Icon(_icons[nombreIcono], color: Colors.blue);
}
