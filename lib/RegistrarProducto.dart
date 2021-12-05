import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegistrarProducto extends StatefulWidget {
  const RegistrarProducto({Key? key}) : super(key: key);

  @override
  _RegistrarProductoState createState() => _RegistrarProductoState();
}

class _RegistrarProductoState extends State<RegistrarProducto> {
  final codigo=TextEditingController();
  final nombre=TextEditingController();
  final precio=TextEditingController();
  final descripcion=TextEditingController();

  CollectionReference pro=FirebaseFirestore.instance.collection('Productos');



  @override
  Widget build(BuildContext context) {
    return MaterialApp(

        home: Scaffold(
          appBar: AppBar(
            title: Text('Productos'),
          ),
          body: ListView(
            children: [
                  Container(
                padding: EdgeInsets.all(10),
                    child: TextField(
                      controller: codigo,
                      decoration: InputDecoration(
                        hintText: 'Código',
                      ),
                    ),
                  ),
              Container(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: nombre,
                  decoration: InputDecoration(
                    hintText: 'Nombre',
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: precio,
                  decoration: InputDecoration(
                    hintText: 'Precio',
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: descripcion,
                  decoration: InputDecoration(
                    hintText: 'Descripción',
                  ),
                ),
              ),
            Container(
              padding: EdgeInsets.only(top: 5),
              alignment: Alignment.center,
              child: ElevatedButton.icon(
                label: Text('Registrar',
                  textAlign: TextAlign.center),
                icon: Icon(Icons.ac_unit,size: 20,),

                onPressed: (){
                  if(codigo.text.isEmpty||nombre.text.isEmpty||precio.text.isEmpty||descripcion.text.isEmpty)
                    {
                    Fluttertoast.showToast(msg: 'Datos Incorrectos, por favor valide',toastLength:Toast.LENGTH_LONG,
                    gravity: ToastGravity.CENTER);
                    }
                  else
                    {
                      pro.doc(codigo.text).set({
                        "Nombre":nombre.text,
                        "Precio":precio.text,
                        "Descripcion":descripcion.text

                      });
                      Fluttertoast.showToast(msg: 'Registros Ingresados',toastLength:Toast.LENGTH_LONG,
                          gravity: ToastGravity.CENTER);

                    }

                },

              ),
            )

            ],
          ),
        ),
    );
  }
}
