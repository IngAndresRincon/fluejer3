import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fluejer3/CategoriaNegocio.dart';
import 'package:fluejer3/ListaNegocio.dart';
import 'package:fluejer3/ListaProducto.dart';
import 'package:fluejer3/RegistrarProducto.dart';
import 'package:fluejer3/geolocalizacion.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'ListaCliente.dart';
import 'Mensaje.dart';
import 'Opciones.dart';
import 'CategoriaNegocio.dart';
import 'RegistrarCliente.dart';

void  main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( MyApp());
}


class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      home: Pantalla(),
    );
  }

}

class Pantalla extends StatefulWidget {
  @override
  State<Pantalla> createState() => _PantallaState();
}

class _PantallaState extends State<Pantalla> {

  final usuario=TextEditingController();
  final password = TextEditingController();

  String usu='';
  String pwd='';

  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot>consulta = FirebaseFirestore.instance.collection('Clientes').where('Nombre',isEqualTo:usuario.text).snapshots();

    var sRef = FirebaseFirestore.instance.collection('Clientes').where('Nombre',isEqualTo:usuario.text).snapshots();


    return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(

          backgroundColor: Colors.orange,
          title: Center( child:Text('APP LOGIN',style: TextStyle(
            color:Colors.black54
          ),
          ),
          ),

        ),

        body: ListView(
          children:[
            Container(
              padding: EdgeInsets.all(10),
              alignment: Alignment.center,
              child: Image.asset('Img/Login1.png',height: 200,width: 400,),
            ),
            Container(
              padding: EdgeInsets.only(left: 20,right: 30,top: 20),
            child: TextField(
              autocorrect: true,
              textAlign: TextAlign.center,
              controller: usuario,
              decoration: InputDecoration(
                focusedBorder :  OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.deepPurple)
                ),
                  icon: Icon(Icons.account_circle,size: 25,),
                hintText: '',labelText: 'Usuario'
              ),
            )
            ),
            Container(
                padding: EdgeInsets.only(left: 20,right: 30,top: 20),

                child: TextField(
                  autofocus: true,
                  autocorrect: true,
                  textAlign: TextAlign.center,
                  controller: password,
                  decoration: InputDecoration(
                      icon: Icon(Icons.password,size: 25,),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepPurple),

                    ),
                      hintText: '', labelText: 'Contraseña'
                  ),
                  obscureText: true,
                )

            ),
            Container(

                padding: EdgeInsets.all(5),
                alignment: Alignment.center,
                child: ElevatedButton(
                    style:TextButton.styleFrom(
                      primary: Colors.amber,
                      fixedSize: const Size(160,30),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)
                      )
                    ),
                  onPressed: () {

                      usu=usuario.text;
                      pwd=password.text;
                      if(usu== 'Andres' && pwd == '1234'){
                        print('Bienvenido '+usu);
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context)=>Opciones())
                        );
                      };


                  }, child:Text('Ingresar',style: TextStyle(
                  fontSize: 16,
                  color:Colors.white),

                ),
                )
            ),
          //  Container(
    //    padding: EdgeInsets.all(20),
    //         alignment: Alignment.center,
    //         child: ElevatedButton(
    //           style: TextButton.styleFrom(
    //             primary: Colors.red
    //           ),
    //           child:Text('Mensaje',
    //             style: TextStyle(
    //               fontSize: 16,
    //               color: Colors.white,
    //             ),
    //           ),
    //             onPressed: (){

                   // Navigator.push(
                    //     context,
                    //    MaterialPageRoute(builder: (context)=>geolocalizacion()),
                    // );

    //            },
    //         )

            // )




            //       Container(
    //           padding: EdgeInsets.all(2),
    //alignment: Alignment.center,
                //           child: ElevatedButton(
    // style:TextButton.styleFrom(
                  //                  primary: Colors.amber,
    //                  fixedSize: const Size(160,30),
    //                  shape: RoundedRectangleBorder(
    //                      borderRadius: BorderRadius.circular(50)
    //                  )
    //             ),
    //onPressed: () {
                    //usu=usuario.text;
                    //pwd=password.text;
                    //if(usu== 'Andres' && pwd == '1234'){
                     // print('Bienvenido '+usu);
                    // Navigator.push(
                    //                      context,
    //                MaterialPageRoute(builder: (context)=>RegistrarCliente())
    //                );
    //                 // };
//
//
                   //            }, child:Text('Registrar',style: TextStyle(
    //              fontSize: 16,
    //                  color:Colors.white),
//
    //          ),
    //    )
           // )

          ]
        ),
      );


  }
}
