import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'dart:convert';

import 'DetalleNegocio.dart';

class BuscarNegocio_Nombre extends StatefulWidget {

  @override
  _BuscarNegocio_NombreState createState() => _BuscarNegocio_NombreState();
}

class _BuscarNegocio_NombreState extends State<BuscarNegocio_Nombre> {

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
    final Stream<QuerySnapshot>consulta = FirebaseFirestore.instance.collection('Negocios').where('nombre_negocio',isEqualTo:text).snapshots();
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
                  title: Text(data['nombre_negocio']),
                  subtitle: Text('Categor??a: '+data['categoria']+'\n'+
                      'Tel??fono: '+data['telefono_negocio']+'\n'+
                      'Celular: '+data['celular_negocio']),
                  trailing: Icon(Icons.delete),
                  onTap: (){
                    clsNegocio neg = new clsNegocio(data['categoria'],data["direccion_negocio"],data["telefono_negocio"],data["codigo"],data['celular_negocio'],data['imagen'],data['nombre_negocio'],data['web'],data["latitud"],data["longitud"]);
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context)=>DetalleNegocio(clsnegocio:neg)
                        ),
                    );


                  },
                ),
              );
            }).toList()
        );

      },
    );
  }

}


class clsNegocio
{
  String Categoria="";
  String Direccion = "";
  String Telefono ="";
  String Codigo="";
  String Celular="";
  String Imagen="";
  String Nombre="";
  String Web="";
  String Latitud="";
  String Longitud="";

  clsNegocio(this.Categoria, this.Direccion, this.Telefono, this.Codigo,
      this.Celular, this.Imagen, this.Nombre, this.Web,this.Latitud,this.Longitud);
}