import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'ListaCliente.dart';

class DetalleCliente extends StatefulWidget {
  final clsCliente clscliente;
  DetalleCliente( {required this.clscliente});
  //final String name;
  //const DetalleCliente(this.name ,{Key? key}) : super(key: key);

  @override
  _DetalleClienteState createState() => _DetalleClienteState();
}

class _DetalleClienteState extends State<DetalleCliente> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=>ListaCliente())
              );

            }
          ),
          title: Text('Descripción '+widget.clscliente.Nombre),
        ),
        body: Container(
          padding: EdgeInsets.all(20),
          height: 350,
          //color: Colors.teal,
          child: Card(
            //color: Colors.grey,
            elevation: 10,
            shadowColor: Colors.blueGrey,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
            ),
            color: Color.fromARGB(80, 200, 200, 200),
            child: Center(
              child: Column(
                 children: [
                    Image.asset('Img/ball.png',width: 100),
                   Text(widget.clscliente.Nombre,style: TextStyle(fontSize: 24)),
                   Container(
                     padding: EdgeInsets.all(20),
                     alignment: Alignment.center,
                     child: ElevatedButton.icon(
                        label: Text('Direccionar página web',textAlign: TextAlign.center,),
                       icon: Icon(Icons.add_business), onPressed: ()async {

                              if(await canLaunch(widget.clscliente.Web))
                                {
                                  await launch(widget.clscliente.Web);
                                }

                     },

                     ),
                   )
                 ],
              ),
            ),
          ),

        ),

      ),

    );
  }
}
