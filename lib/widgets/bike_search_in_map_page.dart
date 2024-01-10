import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../custom_widget/custom_function_widgets.dart';


class BikeSharePage extends StatefulWidget {
  @override
  State<BikeSharePage> createState() => _BikeSharePageState();
}

class _BikeSharePageState extends State<BikeSharePage> {
  TextEditingController fromTextEditingController = TextEditingController();
  TextEditingController toTextEditingController = TextEditingController();

  late GoogleMapController mapController;

  final LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  Future<void> getDirections() async {
    final String apiKey = 'AIzaSyAt3NfysQEpy_t_9-JP9mH5rRBKyZ1Y4Fk'; // Replace with your actual API key
    final String origin = 'Brooklyn, NY';
    final String destination = 'Queens, NY';
    final String mode = 'bicycling';

    final Uri uri = Uri.parse(
      'https://maps.googleapis.com/maps/api/directions/json'
          '?origin=$origin'
          '&destination=$destination'
          '&mode=$mode'
          '&key=$apiKey',
    );

    final http.Response response = await http.get(uri);

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      // Parse and use the directions data as needed
      //print(data);
    } else {
      print('Failed to fetch directions. Status code: ${response.statusCode}');
    }
  }

  @override
  void initState(){
    getDirections();
    super.initState();
  }

  @override
  void dispose(){
    fromTextEditingController.dispose();
    toTextEditingController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bike Share'),
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        color: Colors.white,
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            Row(
              children: [
                Icon(Icons.center_focus_strong,color: Colors.purple,),
                SizedBox(width: 10,),
                Expanded(
                  child: TextFormField(
                    controller: fromTextEditingController,
                    decoration: textFieldInputDecoration('Pickup Location'),
                  ),
                ),
              ],
            ),
            IconButton(onPressed: (){
              print('Pressed');
              setState(() {
                String temp = fromTextEditingController.text;
                print(fromTextEditingController.text);
                fromTextEditingController.text = toTextEditingController.text;
                print(fromTextEditingController.text);
                toTextEditingController.text = temp;

              });
            }, icon: Icon(Icons.swap_vert,color: Colors.purple,)),
            Row(
              children: [
                Icon(Icons.location_on,color: Colors.purple,),
                SizedBox(width: 10,),
                Expanded(
                  child: TextFormField(
                      controller: toTextEditingController,
                    decoration: textFieldInputDecoration('Drop-off Location'),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10,),
            Expanded(
              child: GoogleMap(
                onMapCreated: _onMapCreated,
                initialCameraPosition: CameraPosition(
                  target: _center,
                  zoom: 11.0,
                ),
              ),
            ),
            // Google Map SDK code here
          ],
        ),
      ),
    );
  }
}
//IconButton(onPressed: (){}, icon: Icon(Icons.swap_vert))