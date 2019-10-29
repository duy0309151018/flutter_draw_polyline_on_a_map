import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DisplayMap(title: 'Display Polyline'),
    );
  }
}

class DisplayMap extends StatefulWidget {
  DisplayMap({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _DisplayMapState createState() => _DisplayMapState();
}

class _DisplayMapState extends State<DisplayMap> {
  var _coordinates = <LatLng>[
    new LatLng(23.0227, 72.5714),
    new LatLng(23.0229, 72.5714),
    new LatLng(23.0233, 72.5713),
    new LatLng(23.0233, 72.5713),
    new LatLng(23.0258, 72.5713),
    new LatLng(23.0265, 72.5713),    
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: new FlutterMap(
        options: new MapOptions(
          center: new LatLng(23.0229, 72.5714),
          zoom: 15.0
        ),
        layers: [
          new TileLayerOptions(
            urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
            subdomains: ['a','b','c']
          ),
          new PolylineLayerOptions(
            polylines: [
              new Polyline(
                points: _coordinates,
                strokeWidth: 6.0,
                color: Colors.blue
              )
            ]
          )
        ],
      )// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
