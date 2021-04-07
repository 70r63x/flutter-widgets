import 'package:flutter/material.dart';
import 'package:flutter_widgets/src/providers/menu_provider.dart';
import 'package:flutter_widgets/src/utils/icons_string.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Compoenetes'),
      ),
      body: _lista()
    );
  }

  Widget _lista() {

    return FutureBuilder(
      future: menuProvider.cargarData(),
      initialData: [],
      builder: ( context, AsyncSnapshot<List<dynamic>> snapshot){
        
        return ListView(
          children: _listItems(snapshot.data),
        );

      },
    );

  }

  List<Widget> _listItems(List<dynamic> data) {

    final List<Widget> opciones = [];

    data.forEach((element) {
      final temp = ListTile(
        title: Text(element['texto']),
        leading: getIcon(element['icon']),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: (){
          
        },
      );

      opciones..add(temp)
      ..add(Divider(color: Colors.blue));
    });

    return opciones;
    
  }
}