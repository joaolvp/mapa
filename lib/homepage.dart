import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Set<Marker> _marcadores = {};

  _carregarMarcadores(){
    Set<Marker> _listaMarcadores = {};
    Marker marcador = Marker(markerId: MarkerId('marker-ifro'),
      position: LatLng(-9.949081946068771, -62.962931831152126),
      icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueRed
      ),
    );
    _listaMarcadores.add(marcador);
    setState(() {
      _marcadores = _listaMarcadores;
    });
  }


  @override
  Widget build(BuildContext context) {
    _carregarMarcadores();
    return Scaffold(
      appBar: AppBar(
        title: Text('IFRO'),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text('IFRO - Campus Ariquemes', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
            Text('Local onde estudo e faço estágio', style: TextStyle(fontSize: 15),),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Image.asset('image/ifro.jpg', width: 350,),
            ),
            SizedBox(
              height: 300,
              width: 350,
              child: GoogleMap(
                mapType: MapType.hybrid,
                initialCameraPosition: CameraPosition(
                  zoom: 16,
                  target: LatLng(-9.94909219367656, -62.96213955947673),
                ),
                markers: _marcadores,
              ),
            )
          ],
        ),
      ),

    );
  }
}
