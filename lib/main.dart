import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:havadurumu/model.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text("Hava Durumu"),
        ),
        body: FutureBuilder<Weather>(
          future: getWeather(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text("Hata: ${snapshot.error}"));
            } else if (snapshot.hasData) {
              Weather w = snapshot.data!;
              return Padding(
                padding: EdgeInsets.all(16),
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "📍 Konum Bilgisi",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text("Enlem: ${w.latitude}"),
                        Text("Boylam: ${w.longitude}"),
                        Text("Timezone: ${w.timezone}"),
                        Divider(),
                        Text(
                          "🌤️ Hava Durumu",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          "Sıcaklık: ${w.currentWeather.temperature} ${w.currentWeatherUnits.temperature}",
                        ),
                        Text(
                          "Rüzgar Hızı: ${w.currentWeather.windspeed} ${w.currentWeatherUnits.windspeed}",
                        ),
                        Text(
                          "Rüzgar Yönü: ${w.currentWeather.winddirection} ${w.currentWeatherUnits.winddirection}",
                        ),
                        Text(
                          "Gündüz mü?: ${w.currentWeather.isDay == 1 ? "Evet" : "Hayır"}",
                        ),
                      ],
                    ),
                  ),
                ),
              );
            } else {
              return Center(child: Text("Veri bulunamadı"));
            }
          },
        ),
      ),
    );
  }
}

Future<Weather> getWeather() async {
  final dio = Dio();

  // IP tabanlı konum
  var response = await dio.get("http://ip-api.com/json/");
  var data = response.data;
  double lat = data['lat'];
  double lon = data['lon'];

  // Open-Meteo hava durumu
  var response2 = await dio.get(
    "https://api.open-meteo.com/v1/forecast?latitude=$lat&longitude=$lon&current_weather=true",
  );
  var data2 = response2.data;

  return Weather.fromJson(data2);
}
