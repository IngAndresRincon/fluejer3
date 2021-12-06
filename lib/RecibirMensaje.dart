import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
class RecibirMensaje
{

  FirebaseMessaging Mensaje =  FirebaseMessaging.instance;

  notificacion()
  {

    Mensaje.requestPermission();
    Mensaje.getToken().then((token)
    {
      print("*******00000000000000000000**************+");
      print(token);
    }
    );

  }
}