import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';

import 'DetalleNegocio.dart';


class geolocalizacion extends StatefulWidget {
  final Direccion dir;
  geolocalizacion({required this.dir});

  @override
  _geolocalizacionState createState() => _geolocalizacionState();
}

class _geolocalizacionState extends State<geolocalizacion> {

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Geolocalizaciòn'),

        ),
        body: Stack(
          children: [

            GoogleMap(

              initialCameraPosition: CameraPosition(
                  target: LatLng(widget.dir.latitud,widget.dir.longitud),
                  zoom: 17),
              
            ),
            
          ],
        )




      ),
    );
  }
}

