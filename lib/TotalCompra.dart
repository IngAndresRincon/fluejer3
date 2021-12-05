import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';

class TotalCompra extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ListaCompra(lista: [],)
    );
  }
}

class ListaCompra extends StatefulWidget {
  List lista=[];
  ListaCompra({required this.lista});

  @override
  State<ListaCompra> createState() => _ListaCompraState();
}

class _ListaCompraState extends State<ListaCompra> {
  var total = 0;
  CollectionReference registrarproducto = FirebaseFirestore.instance.collection('Compras');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista Compras'),

      ),
        body: Column(
          children: [
            Expanded(
                child: ListView.builder(
                    itemCount: widget.lista.length,
                itemBuilder:(BuildContext context,i){
                  return Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(5),

                              child: ListTile(title: Text(widget.lista[i][0]+"      \$"+widget.lista[i][1]),
                              tileColor:Colors.orange,
                              ),
                                  ),


                    ],
                  );
                    }
                )
            ),
            Container(
              padding: EdgeInsets.all(20),
              color: Color.fromARGB(40, 0, 50, 255),
              margin: EdgeInsets.only(bottom: 80),
              alignment: Alignment.center,
              child: Column(
                children: [
                  Builder(
                    builder:(context)
                    {
                      return ElevatedButton.icon(
                        label: Text('Total Compra',
                          textAlign: TextAlign.center,),
                        icon: Icon(Icons.eighteen_mp_outlined,
                          size: 20,
                          color: Colors.indigo,),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blueGrey,
                          onPrimary: Colors.redAccent,
                          onSurface: Colors.teal,
                          elevation: 10,
                        ),
                        onPressed: (){
                            //var total = 0;
                            var num;
                            var datonum;
                            for(int i=0; i<widget.lista.length; i++)
                              {
                                //num = widget.lista[i][1];
                                datonum =int.parse(widget.lista[i][1]);
                                total = datonum+total;

                              }
                            Fluttertoast.showToast(msg: "El total de su compra es: "+total.toString(),
                            fontSize:20,
                              backgroundColor: Colors.red,
                            );
                            //print(total);

                        },
                      );
                    },
                  )
                ],
              ),

            ),
            Container(
              padding: EdgeInsets.all(20),
              color: Color.fromARGB(40, 0, 50, 255),
              //margin: EdgeInsets.only(bottom: 80),
              alignment: Alignment.center,
              child: ElevatedButton.icon(
                label: Text('Registra Compra',
                  textAlign: TextAlign.center,),
                icon: Icon(Icons.eighteen_mp_outlined,
                  size: 20,
                  color: Colors.indigo,),
                style: ElevatedButton.styleFrom(
                  primary: Colors.blueGrey,
                  onPrimary: Colors.redAccent,
                  onSurface: Colors.teal,
                  elevation: 10,
                ),
                onPressed: (){
                  List listaregistrar = [];
                  //totaL=0;
                  var datonum=0;
                  for(int i=0; i<widget.lista.length;i++)
                    {

                      datonum =int.parse(widget.lista[i][1]);
                      total = datonum+total;
                    }
                  for(int i = 0; i < widget.lista.length; i++)
                    {
                      listaregistrar.add(widget.lista[i][0]);

                    }
                  registrarproducto.doc().set(
                    {
                      "Producto":listaregistrar,
                      "Total":total,
                    }
                  );
                  Fluttertoast.showToast(msg: 'Su compra fue registrada',
                      fontSize: 20,
                  backgroundColor: Colors.redAccent,
                  textColor: Colors.white,
                  //gravity:
                      );
                },

              ),
            )
          ],
        )
    );
  }
}
