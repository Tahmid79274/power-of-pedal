import 'dart:convert';
import 'dart:developer';
import 'package:power_of_pedal/qr_page.dart';

import 'utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:power_of_pedal/custom_widget/custom_function_widgets.dart';
import 'package:power_of_pedal/widgets/bike_search_in_map_page.dart';
import 'package:geocoding/geocoding.dart';
import 'custom_widget/bycycle_suggesion_widget_model.dart';
import 'model/weather_model.dart';
import 'package:http/http.dart' as http;


class DashboardPage extends StatefulWidget {
  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {

  /*Future<WeatherModel> myWeather()async{
    try {
      // get user's current position(latitude and longitude)

      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      if (current) {
        List<Placemark> placemarks = await placemarkFromCoordinates(
            position.latitude, position.longitude);
        Placemark place = placemarks[0];
        log(place.locality.toString());
        cityName = place.locality!;
      }
      var url = Uri.https('api.openweathermap.org', '/data/2.5/weather',
          {'q': cityName, "units": "metric", "appid": Constant.api_key});
      final http.Response response = await http.get(url);

      if (response.statusCode == 200) {
        final Map<String, dynamic> decodedJson = json.decode(response.body);
        return WeatherModel.fromMap(decodedJson);
      } else {
        throw Exception('Failed to load weather data');
      }
    } catch (e) {
      throw Exception('Failed to load weather data');
    }
  }*/
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(15),
        width: double.infinity,
        height: double.infinity,
        color: Color(0xFF0077B6), // Hex color #63c5da
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50)
                  ),
                  child: Icon(Icons.person,color: Colors.black,size: 40),
                ),
                IconButton(onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const QRViewExample(),
                  ));
                }, icon: Icon(Icons.qr_code,color: Colors.white,))
              ],
            ),
            Text(
              'Hello John Doe',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,color: Colors.white),
            ),
            InkWell(
              onTap: (){
                pushNavigation(context, BikeSharePage());
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Wanna ride today?',style: TextStyle(fontSize: 20,color: Colors.white),),
                  Icon(Icons.forward,color: Colors.white,),
                ],
              ),
            ),
            /*FutureBuilder<WeatherModel>(future: myWeather(), builder: (BuildContext weatherContext, AsyncSnapshot<WeatherModel> weatherSnapshot){
              if(weatherSnapshot.connectionState == ConnectionState.done) {
                if (weatherSnapshot.hasError) {
                  return Center(
                    child: Text(
                      '${weatherSnapshot.error.toString()} occurred',
                      style: TextStyle(fontSize: 18),
                    ),
                  );
                  // if data has no errors
                }
                else if (weatherSnapshot.hasData) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.location_on,
                            color: Colors.white,
                          ),
                          Text(
                            weatherSnapshot.data!.city,
                            //style: f24Rwhitebold,
                          ),
                        ],
                      ),
                      //height25,
                      Text(
                        weatherSnapshot.data!.desc,
                        //style: f16PW,
                      ),
                      //height25,
                      Text(
                        "${weatherSnapshot.data!.temp}°C",
                        //style: f42Rwhitebold,
                      ),
                    ],
                  );
                }
              }
              else if (weatherSnapshot.connectionState==ConnectionState.waiting){
                return CircularProgressIndicator();
              }
              else {
                return Center(
                  child: Text("State ${weatherSnapshot.connectionState}"),
                );
              }
              return Center(
                child: Text("Server timed out!"),
              );
            }),
            */Text(DateFormat.yMMMMEEEEd().format(DateTime.now()),style: TextStyle(color: Colors.white),),
            // Weather widget here
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  BycycleSuggestionWidget(title: 'BMZX1',distance: '310m Away'),
                  BycycleSuggestionWidget(title: 'BMZX2',distance: '320m Away'),
                  BycycleSuggestionWidget(title: 'BMZX3',distance: '330m Away'),
                  // Add more containers as needed
                ],
              ),
            ),
            Text('Slide left - right')
          ],
        ),
      ),
    );
  }
}
