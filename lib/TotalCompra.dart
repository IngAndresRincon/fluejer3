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
  SingingCharacter? _character = SingingCharacter.Si;
  //final Informacion=TextEditingController();
  String Info="";
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
                      final item=widget.lista[i][0];
                  return Dismissible(
                      onDismissed: (_)
                    {
                      widget.lista.removeAt(i);

                    },

                    key: Key(item),
                    movementDuration: Duration(milliseconds: 100),

                      // padding: EdgeInsets.all(5),
                              child: ListTile(title: Text(widget.lista[i][0]+"      \$"+widget.lista[i][1]),
                              tileColor:Colors.yellow,
                              ),
                      background: Container(
                        color: Colors.blueGrey,
                      ),



                  );
                    }
                )
            ),
            Container(



              child:  Row(
                children: <Widget>[

                  Container(
                    color: Colors.white,
                    height:60,
                    width: 120,
                    child: Column(
                      children: [
                        ListTile(
                          title: const Text('¿Recoger a Domicilio?'),

                        ),
                      ],
                    ),
                  ),




                 Container(
                    color: Colors.white,
                    height:60,
                    width: 120,
                    child: Column(
                      children: [
                        ListTile(
                          title: const Text('Si'),
                          leading: Radio<SingingCharacter>(
                            value: SingingCharacter.Si,
                            groupValue: _character,
                            onChanged: (SingingCharacter? value) {
                              setState(() {
                                _character = value;
                                Info = value.toString();
                                Info = Info.substring(17);
                                print (Info);
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    color:Colors.white,
                        height: 60,
                    width: 120,
                    child: Column(
                      children: [
                        ListTile(
                          title: const Text('No'),
                          leading: Radio<SingingCharacter>(
                            value: SingingCharacter.No,
                            groupValue: _character,
                            onChanged: (SingingCharacter? value) {
                              setState(() {
                                _character = value;
                                Info = value.toString();
                                Info = Info.substring(17);
                                print (Info);
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),

            ),
            Container(
              padding: EdgeInsets.all(10),
              color: Color.fromARGB(10, 0, 50, 55),
              margin: EdgeInsets.only(bottom: 10),
              alignment: Alignment.center,
              child: Column(
                children: [
                  Builder(
                    builder:(context)
                    {
                      return ElevatedButton.icon(
                        label: Text('Total Compra',
                          textAlign: TextAlign.center,),
                        icon: Icon(Icons.add,
                          size: 20,
                          color: Colors.white,),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.teal,
                          onPrimary: Colors.white,
                          onSurface: Colors.teal,
                          elevation: 10,
                        ),
                        onPressed: (){

                             total = 0;
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
                              backgroundColor: Colors.blue  ,
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
              padding: EdgeInsets.all(10),
              color: Color.fromARGB(10, 0, 50, 55),
              //margin: EdgeInsets.only(bottom: 80),
              alignment: Alignment.center,
              child: ElevatedButton.icon(
                label: Text('Registra Compra',
                  textAlign: TextAlign.center,),
                icon: Icon(Icons.ad_units,
                  size: 20,
                  color: Colors.white,),
                style: ElevatedButton.styleFrom(
                  primary: Colors.teal,
                  onPrimary: Colors.white,
                  onSurface: Colors.teal,
                  elevation: 10,
                ),
                onPressed: (){
                  List listaregistrar = [];
                  total=0;
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
                      "Domicilio": Info.toString()
                    }
                  );
               //   print ("información:" +SingingCharacter.values.toString());
                  Fluttertoast.showToast(msg: 'Su compra fue registrada',
                      fontSize: 20,
                  backgroundColor: Colors.redAccent,
                  textColor: Colors.white,
                  //gravity:
                      );
                },

              ),
            ),







          ],
        )
    );
  }
}


enum SingingCharacter { Si,No }

