import 'package:flutter/material.dart';


class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {

  double _valorSlider = 100;
  bool _bloquearCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider Page'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50),
        child: Column(
          children: <Widget>[
            _crearSlider(),
            _checkBox(),
            _crearSwitch(),
            Expanded(
              child: _crearImagen()
            )
          ],
        )
      )
    );
  }

  Widget _crearSlider() {
    return Slider(
      activeColor: Colors.indigoAccent,
      label: 'Tamaño de la imagen',
      // divisions: 20,
      value: _valorSlider,
      min: 10,
      max: 400,
      onChanged: ( _bloquearCheck ) ? null : (value){
        setState(() {
          _valorSlider = value;
        });
      }
    );
  }

  Widget _crearImagen() {
    return FadeInImage(
      placeholder: AssetImage('assets/jar-loading.gif'),
      image: NetworkImage('https://upload.wikimedia.org/wikipedia/commons/9/91/Oahu_Landscape.jpg'),
      fadeInDuration: Duration(milliseconds: 200),
      width: _valorSlider,
      fit: BoxFit.cover,
    );
  }

  Widget _checkBox() {
    // return Checkbox(
    //   value: _bloquearCheck,
    //   onChanged: (value){
    //     setState(() {
    //       _bloquearCheck = value;
    //     });
    //   }
    // );
    // 
    return CheckboxListTile(
      title: Text('Bloquear Slider'),
      value: _bloquearCheck,
      onChanged: (value){
        setState(() {
          _bloquearCheck = value;
        });
      }
    );
  }

  Widget _crearSwitch() {
    return SwitchListTile(
      title: Text('Bloquear Slider'),
      value: _bloquearCheck,
      onChanged: (value){
        setState(() {
          _bloquearCheck = value;
        });
      }
    );
  }
}