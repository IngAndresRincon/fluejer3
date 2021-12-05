import 'package:fluejer3/Opciones.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'dart:convert';

class ListaProducto extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context)=>Opciones())
                );

              }
          ),
          backgroundColor: Colors.orange,
          title: Center( child:Text('Lista de Productos',style: TextStyle(
              color:Colors.black54
          ),
          ),
          ),
        ),

        body: (
            Consulta()
        ),
      ),
    );
  }
}

class Consulta extends StatefulWidget {


  @override
  _ConsultaState createState() => _ConsultaState();
}

class _ConsultaState extends State<Consulta> {

  final Stream<QuerySnapshot> Consulta = FirebaseFirestore.instance.collection('Productos').snapshots();

  @override

  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: Consulta,
        builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot){
          if (snapshot.hasError){
            return Text('ERROR');
          }
          if (snapshot.connectionState == ConnectionState.waiting)
          {
            return Text('Cargando');
          }
          return ListView(
              children:snapshot.data!.docs.map((DocumentSnapshot document){
                Map<String,dynamic> data = document.data()! as Map<String, dynamic>;
                return Container(
                  color:Colors.blueGrey,
                  margin: EdgeInsets.only(top: 5),
                  child: ListTile(
                   // leading: CircleAvatar( child: Icon(Icons.production_quantity_limits), //Text(data['Nombre']),
                   //   backgroundColor: Colors.teal,

                    //),
                    leading: Image.network(data['Imagen'],width: 60,alignment: Alignment.center,),
                    title: Text(data['Nombre']),
                    subtitle: Text('Categoría: '+data['Categoria']+'\n'+
                        'Precio: '+data['Precio'].toString()+'\n'+
                        'Código Almacén: '+data['Codigo_Almacen'].toString()+'\n'+
                        'Código: '+data['Codigo'].toString()),
                    trailing: Icon(Icons.delete),
                  ),
                );
              }).toList()
          );
        }
    );
    return Container();
  }
}
