import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {

  final opciones = [1,2,3,4,5];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes Temp'),
      ),
      body: ListView(
        // children: _crearItems()
        children: _crearItemsCorta()
      ),
    );
  }

  List<Widget> _crearItems(){
    List<Widget> lista = List<Widget>.empty(growable: true);

    for (int opt in opciones) {
      final tempWidget = ListTile(
        title: Text(opt.toString()),
      );
      lista..add(tempWidget)
      ..add(Divider(color: Colors.blue));
    }

    return lista;
  }

  List<Widget> _crearItemsCorta(){
    return opciones.map((e){
      return Column(
        children: [
          ListTile(
            title: Text(e.toString()+'!'),
            subtitle: Text('subtitulo'),
            leading: Icon(Icons.ac_unit),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: (){},
          ),
          Divider(color: Colors.blue)
        ],
      );
    }).toList();
  }
}