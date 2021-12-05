import 'package:fluejer3/DetalleCliente.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'dart:convert';

class ListaCliente extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          title: Center( child:Text('Clientes',style: TextStyle(
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

  final Stream<QuerySnapshot> Consulta = FirebaseFirestore.instance.collection('Clientes').snapshots();

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
                color: Color(0x70B4D5FF),
                margin: EdgeInsets.only(top: 5),
                child: ListTile(
                  leading: Image.network(data['Imagen'],width: 40,alignment: Alignment.center),
                  //leading: CircleAvatar( child: Icon(Icons.account_box_sharp), //Text(data['Nombre']),
                   // backgroundColor: Colors.teal,
                  //),
                  title: Text(data['Nombre'].toString()),
                  subtitle: Text('Dirección: '+data['Direccion'].toString()+'\n'+
                      'Teléfono: '+data['Telefono'].toString()+'\n'+
                      'Celular: '+data['Celular'].toString()),
                  trailing: Icon(Icons.delete),
                  onTap: (){
                    clsCliente cli = new clsCliente(data['Celular'],data['Direccion'],data['Imagen'],data['Nombre'],data['Telefono'],data['Web']);
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context)=>DetalleCliente(clscliente:cli)
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


class clsCliente
{
  String Celular="";
  String Direccion="";
  String Imagen="";
  String Nombre="";
  String Telefono="";
  String Web="";

  clsCliente(this.Celular,this.Direccion,this.Imagen,this.Nombre,this.Telefono,this.Web);

}