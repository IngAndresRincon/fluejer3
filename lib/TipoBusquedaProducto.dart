import 'package:fluejer3/CategoriaNegocio.dart';
import 'package:fluejer3/Comprar.dart';
import 'package:fluejer3/ListaNegocio.dart';
import 'package:fluejer3/NombreNegocio.dart';
import 'package:fluejer3/NombreProducto.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'dart:convert';

import 'ListaProducto.dart';


class TipoBusquedaProducto extends StatefulWidget {


  @override
  _TipoBusquedaProductoState createState() => _TipoBusquedaProductoState();
}

class _TipoBusquedaProductoState extends State<TipoBusquedaProducto> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Realizar busqueda'),
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
                          MaterialPageRoute(builder: (context)=>BuscarProducto_Nombre())
                      );

                    },
                    child:Text('Nombre',style: TextStyle(
                        fontSize: 16,
                        color:Colors.white),

                    ),
                  ),
                ),
              //  Container(
          //    padding: EdgeInsets.all(10),

          //      child: ElevatedButton(
            //        style:TextButton.styleFrom(
            //          primary: Colors.blue,
            //          fixedSize: const Size(160,60),
            //          shape: RoundedRectangleBorder(
          //              borderRadius: BorderRadius.circular(20)
          //            )
          //        ),
              //        onPressed: (){
//
    //                    Navigator.push(
    //                    context,
    //                    MaterialPageRoute(builder: (context)=>Comprar())
    //                );
//
          //                  },
            //        child:Text('Buscar Por Negocio',style: TextStyle(
            //          fontSize: 12,
          //          color:Colors.white),
//
          //                  ),
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
                          MaterialPageRoute(builder: (context)=>ListaProducto())
                      );

                    },
                    child:Text('Listar Todo',style: TextStyle(
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
