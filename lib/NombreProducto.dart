import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'dart:convert';

class BuscarProducto_Nombre extends StatefulWidget {

  @override
  _BuscarProducto_NombreState createState() => _BuscarProducto_NombreState();
}

class _BuscarProducto_NombreState extends State<BuscarProducto_Nombre> {

  TextEditingController buscar = TextEditingController();
  String busc = "";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Ingrese el nombre'),

        ),
        body: Center(
          child: SizedBox(width:360,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(20),
                  child: TextField(
                    controller: buscar,
                    onChanged: (value){
                      setState(() {

                      });

                    },
                    decoration: InputDecoration(
                        hintText: 'Nombre'
                    ),
                  ),
                ),
                Expanded(
                    child: BuscarData(
                      text: buscar.text,
                    )
                )
              ],


            ),
          ),
        ),

      ),

    );
  }
}


class BuscarData extends StatelessWidget {

  final String text;
  const BuscarData({Key? Key, required this.text}) : super(key: Key);

  @override
  Widget build(BuildContext context) {
    //final Stream<QuerySnapshot>consulta = FirebaseFirestore.instance.collection('Clientes').where('Nombre',isEqualTo:text).snapshots();
    //final Stream<QuerySnapshot>consulta = FirebaseFirestore.instance.collection('Negocios').where('Categoria',arrayContainsAny: [text]).snapshots();
    final Stream<QuerySnapshot>consulta = FirebaseFirestore.instance.collection('Productos').where('Nombre',isEqualTo:text).snapshots();
    return StreamBuilder<QuerySnapshot>(
      stream: consulta,
      builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot)
      {
        if (!snapshot.hasData){
          return Center(child: CircularProgressIndicator());
        }
        if(text.isNotEmpty)
        {
          var t=text.toLowerCase();
          //consulta;
        }
        return ListView(
            children:snapshot.data!.docs.map((DocumentSnapshot document){
              Map<String,dynamic> data = document.data()! as Map<String, dynamic>;
              return Container(
                color:Colors.blueGrey,
                margin: EdgeInsets.only(top: 5),
                child: ListTile(
                  leading: CircleAvatar( child: Icon(Icons.account_box_sharp), //Text(data['Nombre']),
                    backgroundColor: Colors.teal,

                  ),
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

      },
    );
  }
}

class Producto
{
  String Categoria="";
  String Celular="";
  String Imagen="";
  String Nombre="";
  String Web="";

  Producto(this.Categoria,this.Celular,this.Imagen,this.Nombre,this.Web);

}