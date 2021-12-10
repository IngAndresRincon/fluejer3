import 'package:fluejer3/NombreNegocio.dart';
import 'package:fluejer3/TipoBusquedaNegocio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'ListaCliente.dart';
import 'geolocalizacion.dart';

class DetalleNegocio extends StatefulWidget {
  final clsNegocio clsnegocio;
  DetalleNegocio({required this.clsnegocio});
 // const DetalleNegocio(this.cliente ,{Key? key}) : super(key: key);

  @override
  _DetalleNegocioState createState() => _DetalleNegocioState();
}

class _DetalleNegocioState extends State<DetalleNegocio> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
         // leading: IconButton(
              //icon: Icon(Icons.arrow_back, color: Colors.white),
              //onPressed: () {
              //  Navigator.push(
              //      context,
              //      MaterialPageRoute(builder: (context)=>TipoBusquedaNegocio())
              //  );

          //    }
        //  ),
          title: Center(child: Text('Información Negocio '),)
        ),
        body: Container(
          padding: EdgeInsets.all(20),
          height: 550,
          //color: Colors.teal,
          child: Card(
            //color: Colors.grey,
            elevation: 0,
            shadowColor: Colors.blueGrey,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
            ),
            color: Color.fromARGB(80, 188, 141, 226),
            child: Center(
              child: Column(
                children: [
                  Image.network(widget.clsnegocio.Imagen,width: 100),
                  Text(widget.clsnegocio.Nombre,style:  TextStyle(fontSize: 28,
                      color: Color.fromARGB(233, 8, 45, 0))),
                  Text("WA: "+widget.clsnegocio.Celular,style: TextStyle(fontSize: 24)),
                  Text("Tel: "+widget.clsnegocio.Telefono,style: TextStyle(fontSize: 24)),
                  Text("Dirección: ",style: TextStyle(fontSize: 24)),
                  Text(widget.clsnegocio.Direccion,style: TextStyle(fontSize: 24)),
                  Text("Código: "+widget.clsnegocio.Codigo,style: TextStyle(fontSize: 24)),
                  Container(
                    padding: EdgeInsets.all(20),
                    alignment: Alignment.center,
                    child: ElevatedButton.icon(
                      label: Text('Direccionar página web',textAlign: TextAlign.center,),
                      icon: Icon(Icons.add_business),
                      onPressed: ()async {

                      if(await canLaunch(widget.clsnegocio.Web))
                      {
                        await launch(widget.clsnegocio.Web);
                      }

                    },

                    ),


                  ),


                  Container(
                    padding: EdgeInsets.all(20),
                    alignment: Alignment.center,
                    child: ElevatedButton.icon(
                      label: Text('Direccionar Ubicación',textAlign: TextAlign.center,),
                      icon: Icon(Icons.map),
                      onPressed: ()async {
                        var lat = double.parse(widget.clsnegocio.Latitud);
                        var lon = double.parse(widget.clsnegocio.Longitud);
                        print ('Lat:'+lat.toString()+'Lon:'+lon.toString());
                        Direccion tempdir = new Direccion(lat,lon);
                        Navigator.push(
                          context,

                          MaterialPageRoute(builder: (context)=>geolocalizacion(dir:tempdir)),
                        );


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

class Direccion
{
  double latitud;
  double longitud;

  Direccion(this.latitud, this.longitud);
}