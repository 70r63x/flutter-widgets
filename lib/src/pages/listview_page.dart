import 'dart:async';

import 'package:flutter/material.dart';

class ListviewPage extends StatefulWidget {
  @override
  _ListviewPageState createState() => _ListviewPageState();
}

class _ListviewPageState extends State<ListviewPage> {

  ScrollController _scrollController = ScrollController();
  List<int> _listaNumeros = List<int>.empty(growable: true);
  int _contImage = 0;
  bool _isLoading = false;

  @override
    void initState() {
      super.initState();

      _agregar10();
      _scrollController.addListener(() {
        if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
          // _agregar10();
          _fetchData();
        }
      });
    }

  @override
    void dispose() {
      super.dispose();
      _scrollController.dispose();
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Page'),
      ),
      body: Stack(
        children: <Widget>[
          _crearLista(context),
          _crearLoading(),
        ],
      )
      
    );
  }

  Widget _crearLista(BuildContext context) {
    return RefreshIndicator(
      onRefresh: obtenerPagina,
      child: ListView.builder(
        controller: _scrollController,
        itemCount: _listaNumeros.length,
        itemBuilder: ( context, int index ){
          final imagen = _listaNumeros[index];
          return FadeInImage(
            placeholder: AssetImage('assets/jar-loading.gif'),
            image: NetworkImage('https://picsum.photos/500/300?image=$imagen'),
            fadeInDuration: Duration(milliseconds: 200),
            fit: BoxFit.cover,
          );
        }
      ),
    );
  }

  Future<Null> obtenerPagina() async{
    final duration = Duration(seconds: 5);
    Timer(
      duration,
      (){
        _listaNumeros.clear();
        _contImage++;
        _agregar10();
      }
    );

    return Future.delayed(duration);
  }

  void _agregar10(){
    for (var i = 1; i < 10; i++) {
      _contImage++;
      _listaNumeros.add(_contImage);
    }

    setState(() {
          
        });
  }

  Future<Null> _fetchData() async{
    
    setState(() {
      _isLoading = true;
    });

    final duration = Duration(seconds: 3);
    return Timer(
      duration,
      respuestaHTTP
    );
  }

  void respuestaHTTP(){
    _isLoading = false;
    _scrollController.animateTo(
      _scrollController.position.pixels + 100,
      duration: Duration(milliseconds: 250),
      curve: Curves.fastOutSlowIn
    );
    _agregar10();
  }

  Widget _crearLoading() {
    if (_isLoading) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
            ],
          ),
          SizedBox(height: 15,)
        ],
      );
      
      
    } else {
      return Container();
    }
  }
}