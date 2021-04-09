import 'package:flutter/material.dart';

class Inputpage extends StatefulWidget {
  @override
  _InputpageState createState() => _InputpageState();
}

class _InputpageState extends State<Inputpage> {

  String _nombre = '';
  String _email = '';
  String _pass = '';
  String _fecha = '';
  String _opSelet = '';
  List<String> _opciones = ['', 'wenas', 'wenas2', 'wenas3'];
  TextEditingController _inputFieldDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inputs Page'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        children: <Widget>[
          _crearInput(),
          Divider(color: Colors.blue,),
          _crearEmail(),
          Divider(color: Colors.blue,),
          _crearPass(),
          Divider(color: Colors.blue,),
          _crearFecha(context),
          Divider(color: Colors.blue,),
          _crearDropdown(),
          Divider(color: Colors.blue,),
          _crearPersona(),
           Divider(color: Colors.blue,),
        ],
      ),
    );
  }

  Widget _crearInput() {
    return TextField(
      autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20)
        ),
        counter: Text('Letras ${ _nombre.length }'),
        hintText: 'Nombre persona',
        labelText: 'Nombre persona',
        helperText: 'Solo nombre',
        suffixIcon: Icon((Icons.accessibility)),
        icon: Icon(Icons.account_circle)
      ),
      onChanged: (valor){
        setState(() {
          _nombre = valor;
        });
      },
    );
  }

  _crearEmail() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20)
        ),
        hintText: 'Email',
        labelText: 'Email',
        suffixIcon: Icon((Icons.alternate_email)),
        icon: Icon(Icons.email)
      ),
      onChanged: (valor){
        setState(() {
          _email = valor;
        });
      },
    );
  }

  _crearPass() {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20)
        ),
        hintText: 'Contraseña',
        labelText: 'contraseña',
        suffixIcon: Icon(Icons.lock_rounded),
        icon: Icon(Icons.lock)
      ),
      onChanged: (valor){
        setState(() {
          _pass = valor;
        });
      },
    );
  }

  Widget _crearFecha( BuildContext context ){
    return TextField(
      controller: _inputFieldDateController,
      enableInteractiveSelection: false,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20)
        ),
        hintText: 'Fecha',
        labelText: 'Fecha',
        suffixIcon: Icon(Icons.calendar_today_outlined),
        icon: Icon(Icons.calendar_today_rounded)
      ),
      onTap: (){
        FocusScope.of(context).requestFocus(FocusNode());
        _selectDate( context );
      },
    );
  }

  void _selectDate(BuildContext context) async{
    DateTime picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2018),
      lastDate: DateTime.now(),
      locale: Locale('es', 'CO')
    );

    if (picked != null) {
      setState(() {
        _fecha = picked.toString();
        _inputFieldDateController.text = _fecha;
    });
    }
  }

  List<DropdownMenuItem<String>> getOpcionesDropdown(){
    List<DropdownMenuItem<String>> lista = List.empty(growable: true);

    _opciones.forEach((element) {
      lista.add(
        DropdownMenuItem(
          child: Text(element),
          value: element
        )
      );
    });

    return lista;
  }

  _crearDropdown() {
    return Row(
      children: [
        Icon(Icons.select_all),
        SizedBox(width: 30,),
        DropdownButton(
          value: _opSelet,
          items: getOpcionesDropdown(),
          onChanged: (valor){
            setState(() {
              _opSelet = valor;
            });
          },
        ),
      ],
    );
  }

  Widget _crearPersona() {
    return ListTile(
      title: Text('Nombre es: $_nombre'),
      subtitle: Text('Email es: $_email'),
    );
  }

}