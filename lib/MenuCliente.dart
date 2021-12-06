import 'package:fluejer3/ActualizarCliente.dart';
import 'package:fluejer3/BorrarCliente.dart';
import 'package:fluejer3/CategoriaNegocio.dart';
import 'package:fluejer3/ListaCliente.dart';
import 'package:fluejer3/ListaNegocio.dart';
import 'package:fluejer3/NombreNegocio.dart';
import 'package:fluejer3/RegistrarCliente.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'dart:convert';


class MenuCliente extends StatefulWidget {


  @override
  _MenuClienteState createState() => _MenuClienteState();
}

class _MenuClienteState extends State<MenuCliente> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Seleccione una opciòn'),
        ),
        body: Center(
          child: SizedBox(width:160,
            child: Column(
              children: [

                Container(
                  padding: EdgeInsets.all(10),

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
                          MaterialPageRoute(builder: (context)=>ListaCliente())
                      );

                    },
                    child:Text('Listar Cliente',style: TextStyle(
                        fontSize: 16,
                        color:Colors.white),

                    ),
                  ),
                ),
               // Container(
          //   padding: EdgeInsets.all(10),

          //      child: ElevatedButton(
            //        style:TextButton.styleFrom(
            //          primary: Colors.blue,
            //          fixedSize: const Size(160,60),
            //          shape: RoundedRectangleBorder(
          //              borderRadius: BorderRadius.circular(20)
          //            )
          //        ),
               //        onPressed: (){

               //     Navigator.push(
               //         context,
    //         MaterialPageRoute(builder: (context)=>RegistrarCliente())
    //                );

          //              },
//                    child:Text('Registrar',style: TextStyle(
                      //            fontSize: 16,
          //                      color:Colors.white),

          //        ),
          //      ),
                //    ),

                Container(
                  padding: EdgeInsets.all(10),

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
                          MaterialPageRoute(builder: (context)=>ActualizarCliente())
                      );

                    },
                    child:Text('Actualizar',style: TextStyle(
                        fontSize: 16,
                        color:Colors.white),

                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),

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
                          MaterialPageRoute(builder: (context)=>BorrarCliente())
                      );

                    },
                    child:Text('Borrar',style: TextStyle(
                        fontSize: 16,
                        color:Colors.white),

                    ),
                  ),
                ),
              ],

            ),

          ),

        ),
      ),

    );
  }
}
