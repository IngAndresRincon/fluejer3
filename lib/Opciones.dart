import 'package:fluejer3/TipoBusquedaNegocio.dart';
import 'package:fluejer3/ListaProducto.dart';
import 'package:fluejer3/TipoBusquedaProducto.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'dart:convert';

import 'ListaCliente.dart';
import 'ListaNegocio.dart';
import 'CategoriaNegocio.dart';
import 'MenuCliente.dart';

class Opciones extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home:Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.orange,
          title: Center( child:Text('Opciones',style: TextStyle(
              color:Colors.black54
          ),
          ),
          ),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.all(0),
            children: [
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                    color: Colors.lightBlue
                ),
                accountName: Text("USUARIO"),
                accountEmail: Text("usuario@mail.com"),
                //currentAccountPicture: Image.asset('img/4.png'),
              ),
              ListTile(
                title: Text('Listar Producto'),
                //leading: Image.asset('img/6.png'),
                leading: Icon(Icons.screen_search_desktop_outlined),
                onTap: (){
                  Navigator.of(context).pop();
                  Navigator.push(
                    context, MaterialPageRoute(builder: (context)=>ListaProducto()),
                  );
                },
              ),
              ListTile(
                title: Text('Listar Negocio'),
                //leading: Image.asset('img/6.png'),
                leading: Icon(Icons.app_registration),
                onTap: (){
                  Navigator.of(context).pop();
                  Navigator.push(
                    context, MaterialPageRoute(builder: (context)=>ListaNegocio()),
                  );
                },
              )
            ],
          ),
        ),
        body: ListView(
            //Consulta1()

          children: [

            Container(
              padding: EdgeInsets.all(10),
              alignment: Alignment.center,
              child: Image.asset('Img/Opc2.png',height: 200,width: 400,),
            ),
            Container(
              padding: EdgeInsets.all(10),
              alignment: Alignment.center,
              child: ElevatedButton(
                style:TextButton.styleFrom(
                    primary: Colors.blue,
                    fixedSize: const Size(160,60),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)
                    )
                ),
                  onPressed: (){

                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context)=>TipoBusquedaNegocio())
                    );

                  },
                child:Text('Negocios',style: TextStyle(
                    fontSize: 16,
                    color:Colors.white),

                ),
              ),
            ),
            Container( padding: EdgeInsets.all(10),
              alignment: Alignment.center,
              child: ElevatedButton(
                style:TextButton.styleFrom(
                    primary: Colors.amber,
                    fixedSize: const Size(160,60),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)
                    )
                ),
                onPressed: (){

                  Navigator.push(
                      context,
                      //MaterialPageRoute(builder: (context)=>ListaCliente())
                      MaterialPageRoute(builder: (context)=>MenuCliente())
                  );

                },
                child:Text('Clientes',style: TextStyle(
                    fontSize: 16,
                    color:Colors.white),

                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              alignment: Alignment.center,
              child: ElevatedButton(
                style:TextButton.styleFrom(
                    primary: Colors.amber,
                    fixedSize: const Size(160,60),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)
                    )
                ),
                onPressed: (){

                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context)=>TipoBusquedaProducto())
                  );

                },
                child:Text('Productos',style: TextStyle(
                    fontSize: 16,
                    color:Colors.white),

                ),
              ),
            )
          ],

        ),
      ),
    );
  }
}

class Consulta1 extends StatefulWidget {

  @override
  Botones createState() => Botones();
}

class Botones extends State<Consulta1> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
