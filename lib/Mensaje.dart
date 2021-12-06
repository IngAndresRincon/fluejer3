import 'package:fluejer3/RecibirMensaje.dart';
import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class Mensaje extends StatefulWidget {
  const Mensaje({Key? key}) : super(key: key);

  @override
  State<Mensaje> createState() => _MensajeState();
}

class _MensajeState extends State<Mensaje> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final obj=new RecibirMensaje();
    obj.notificacion();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(

          ),
        )
    );
  }
}
