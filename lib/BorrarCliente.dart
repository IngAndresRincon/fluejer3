import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fluttertoast/fluttertoast.dart';

class BorrarCliente extends StatefulWidget {
  const BorrarCliente({Key? key}) : super(key: key);

  @override
  _BorrarClienteState createState() => _BorrarClienteState();
}

class _BorrarClienteState extends State<BorrarCliente> {
  final codigo=TextEditingController();
  final nombre=TextEditingController();
  final web=TextEditingController();
  final direccion=TextEditingController();
  final telefono=TextEditingController();
  final celular=TextEditingController();

  CollectionReference clie=FirebaseFirestore.instance.collection('Clientes');



  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          title: Center( child:Text('Registrar Cliente',style: TextStyle(
              color:Colors.black54
          ),
          ),
          ),
        ),
        body: ListView(
          children: [
            Center(

              child: TextField(

                decoration: InputDecoration(

                    border: InputBorder.none,
                    hintText: 'INGRESE EL CÒDIGO DEL CLIENTE'
                ),
              ),

            ),

            Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.only(left: 20,right: 20),
              child: TextField(
                controller: codigo,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    //icon: Icon(Icons.password,size: 25,),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepPurple),
                    ),
                    hintText: '', labelText: 'Codigo'
                ),
              ),
            ),

            Container(
              padding: EdgeInsets.only(top: 5),
              margin: EdgeInsets.only(left: 20,right: 20),
              alignment: Alignment.center,
              child: ElevatedButton.icon(
                label: Text('Borrar',
                    textAlign: TextAlign.center),
                icon: Icon(Icons.ac_unit,size: 20,),

                onPressed: (){
                  if(codigo.text.isEmpty)
                  {
                    Fluttertoast.showToast(msg: 'El campo no puede estar vàcio',toastLength:Toast.LENGTH_LONG,
                        gravity: ToastGravity.CENTER);
                  }
                  else
                  {
                    clie.doc(codigo.text).delete();
                    Fluttertoast.showToast(msg: 'Registros Borrado',toastLength:Toast.LENGTH_LONG,
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
