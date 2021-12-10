import 'package:fluejer3/Opciones.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'dart:convert';

import 'DetalleNegocio.dart';
import 'NombreNegocio.dart';

class ListaNegocio extends StatelessWidget {


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
          title: Center( child:Text('Listado de Negocios',style: TextStyle(
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

  final Stream<QuerySnapshot> Consulta = FirebaseFirestore.instance.collection('Negocios').snapshots();

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
                  margin: EdgeInsets.only(top: 5, left:10,right: 10 ),

                  child: ListTile(
                    leading: Image.network(data['imagen'],width: 60,alignment: Alignment.center,),
                   // leading: CircleAvatar( child: Icon(Icons.business), //Text(data['Nombre']),
                    //  backgroundColor: Colors.teal,

                    //),

                    title: Text(data['nombre_negocio']),
                    subtitle: Text('Localizacion: '+data['geolocalizacion'].toString()+'\n'+
                        'Teléfono: '+data['Telefono'].toString()+'\n'+
                        'Celular: '+data['celular_negocio'].toString()+'\n'+
                        'Pagina Web: '+data['PaginaWeb'].toString()+'\n'+
                        'Categoría: '+data['categoria'].toString()+'\n'+
                        'Actividad:' +data['actividad'].toString()+'\n'+
                        'Código: ' +data['codigo'].toString()),
                    trailing: Icon(Icons.delete),
                    onTap: (){
                      clsNegocio neg = new clsNegocio(data['categoria'],data["direccion_negocio"],data["telefono_negocio"],data["codigo"],data['celular_negocio'],data['imagen'],data['nombre_negocio'],data['web'],data["latitud"],data["longitud"]);
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context)=>DetalleNegocio(clsnegocio:neg)
                          )
                      );


                    },
                  ),
                );
              }).toList()
          );
        }
    );
    return Container();
  }
}



class clsNegocio1
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

  clsNegocio1(this.Categoria, this.Direccion, this.Telefono, this.Codigo,
      this.Celular, this.Imagen, this.Nombre, this.Web, this.Latitud,this.Longitud);
}