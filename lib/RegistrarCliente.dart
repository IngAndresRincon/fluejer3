import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegistrarCliente extends StatefulWidget {
  const RegistrarCliente({Key? key}) : super(key: key);

  @override
  _RegistrarClienteState createState() => _RegistrarClienteState();
}

class _RegistrarClienteState extends State<RegistrarCliente> {
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
                    hintText: 'INGRESE DATOS DE CLIENTE'
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
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.only(left: 20,right: 20),
              child: TextField(
                controller: nombre,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    //icon: Icon(Icons.password,size: 25,),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepPurple),
                    ),
                    hintText: '', labelText: 'Nombre'
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.only(left: 20,right: 20),
              child: TextField(
                controller: direccion,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  //icon: Icon(Icons.password,size: 25,),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepPurple),
                    ),
                    hintText: '', labelText: 'Dirección'
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.only(left: 20,right: 20),
              child: TextField(
                controller: celular,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  //icon: Icon(Icons.password,size: 25,),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepPurple),
                    ),
                    hintText: '', labelText: 'Celular'
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.only(left: 20,right: 20),
              child: TextField(
                controller: telefono,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  //icon: Icon(Icons.password,size: 25,),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepPurple),
                    ),
                    hintText: '', labelText: 'Telefono'
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.only(left: 20,right: 20),
              child: TextField(
                controller: web,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  //icon: Icon(Icons.password,size: 25,),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepPurple),
                    ),
                    hintText: '', labelText: 'Web'
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 5),
              margin: EdgeInsets.only(left: 20,right: 20),
              alignment: Alignment.center,
              child: ElevatedButton.icon(
                label: Text('Registrar',
                    textAlign: TextAlign.center),
                icon: Icon(Icons.ac_unit,size: 20,),

                onPressed: (){
                  if(codigo.text.isEmpty||nombre.text.isEmpty||direccion.text.isEmpty||celular.text.isEmpty)
                  {
                    Fluttertoast.showToast(msg: 'Datos Incorrectos, por favor valide',toastLength:Toast.LENGTH_LONG,
                        gravity: ToastGravity.CENTER);
                  }
                  else
                  {
                    clie.doc(codigo.text).set({
                      "Nombre":nombre.text,
                      "Direccion":direccion.text,
                      "Telefono":telefono.text,
                      "Celular":celular.text,
                      "Web":web.text,
                      "Imagen":"https://firebasestorage.googleapis.com/v0/b/sprint1-bd7a4.appspot.com/o/Imagenes%2FIcon5.png?alt=media&token=fe7048c4-f190-4590-9795-a09e8e14e12a"

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
