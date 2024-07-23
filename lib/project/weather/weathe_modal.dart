class Weather {
  String cityname;
  double temperature;
  double latitude;
  double longitude;
  double pressure;
  double humidity;
  String maincondition;
  double forecasttemperature;
  double forecastpressure;
  String forecastmain;

  Weather({
    required this.cityname,
    required this.temperature,
    required this.latitude,
    required this.longitude,
    required this.pressure,
    required this.humidity,
    required this.maincondition,
    required this.forecastmain,
    required this.forecastpressure,
    required this.forecasttemperature,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      cityname: json['name'],
      temperature: json['main']['temp'].toDouble(),
      latitude: json['coord']['lat'].toDouble(),
      longitude: json['coord']['lon'].toDouble(),
      pressure: json['main']['pressure'].toDouble(),
      humidity: json['main']['humidity'].toDouble(),
      maincondition: json['weather'][0]['main'],
      forecasttemperature: json['list'][0]['main']['temp'].toDouble(),
      forecastpressure: json['list'][0]['main']['pressure'].toDouble(),
      forecastmain: json['list'][0]['weather'][0]['main'],
    );
  }
}
