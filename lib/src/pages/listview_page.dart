import 'package:flutter/material.dart';

class ListaPage extends StatefulWidget {
  @override
  _ListaPageState createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {
// Controlador de Scroller de la lista. Con esto podemos determinar cuando
// lega al final de la lista para cargar luego más elementos.
  ScrollController _scrollController = new ScrollController();

//List<int> _listaNumeros = [1, 2, 3, 4, 5];
  List<int> _listaNumeros = new List();
  int _ultimoItem = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _agregar10();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _agregar10();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listas'),
      ),
      body: _crearLista(),
    );
  }

  _crearLista() {
    return ListView.builder(
      controller: _scrollController,
      itemBuilder: (BuildContext context, int index) {
        final imagen = _listaNumeros[index];

        return FadeInImage(
          placeholder: AssetImage('assets/jar-loading.gif'),
          image: NetworkImage('https://picsum.photos/500/300/?image=$imagen'),
        );
      },
      itemCount: _listaNumeros.length,
    );
  }

  void _agregar10() {
    for (var i = 1; i < 10; i++) {
      _ultimoItem++;
      _listaNumeros.add(_ultimoItem);
    }

    setState(() {});
  }
}
