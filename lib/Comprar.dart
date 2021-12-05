import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'TotalCompra.dart';


class Comprar extends StatefulWidget {
  const Comprar({Key? key}) : super(key: key);

  @override
  _ComprarState createState() => _ComprarState();
}

class _ComprarState extends State<Comprar> {
  TextEditingController busca = TextEditingController(

  );
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Buscar'),
        ),
        body: Center(
          child: SizedBox(
            width: 350,
            child: Column(
              children:[
                Container(
                  padding: EdgeInsets.all(5),
                  child: TextField(
                    controller: busca ,
                    onChanged: (value){
                      setState(() {

                      });
                    },
                    decoration: InputDecoration(
                      hintText: 'Buscar '
                    ),
                  ),
                ),
                Expanded(child: BuscarProducto(txtProducto: busca.text))
              ]
            ),
          ),
        ),
      ),
    );
  }
}


class BuscarProducto extends StatelessWidget {
final String txtProducto;
final List lista=[];

  BuscarProducto({Key? key, required this.txtProducto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> consulta = FirebaseFirestore.instance.collection('Productos').where('Negocio',isEqualTo:txtProducto).snapshots();
    return Column(
      children: [
        Expanded(
         flex: 3,
            child:
            StreamBuilder<QuerySnapshot>(
              stream: consulta,
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot ){
                if(!snapshot.hasData)
                {
                  return Center(child: CircularProgressIndicator(),);
                }
                return ListView(
                  children: snapshot.data!.docs.map((DocumentSnapshot document){
                    Map<String, dynamic> data = document.data()! as Map<String,dynamic>;
                    return Container(
                      color: Colors.blue,
                      margin: EdgeInsets.all(5),
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
                        onTap: (){
                          //lista.add(data["Nombre"]+' : '+'\$'+data['Precio']);
                          lista.add([data['Nombre'],data['Precio']]);
                          print(lista);



                        },
                      ),
                    );
                  }
                  ).toList(),
                );
              },
            ),

        ),
        Expanded(
        flex: 1,
            child:
          Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.only(bottom: 20),
            color: Colors.white,
            height: 10,
            alignment: Alignment.center,
            child: ElevatedButton.icon(
              label: Text('Agregar',
              textAlign: TextAlign.center,
              ),
            icon: Icon(Icons.add_moderator,
            size: 30,
            color: Colors.deepOrangeAccent),
            style: ElevatedButton.styleFrom(
              primary: Colors.indigo,
              onPrimary: Colors.white,
              onSurface: Colors.deepPurple,
              elevation: 10,
              shape: BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              textStyle: TextStyle(
                color: Colors.redAccent,
                  fontSize: 20,
                  fontStyle : FontStyle.normal
              ),

            ),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder:(context) =>ListaCompra(lista:lista)));
              },
            ),

          )
        )
      ],
    );
  }
}
