class Weather {
  double latitude;
  double longitude;
  double generationtimeMs;
  int utcOffsetSeconds;
  String timezone;
  String timezoneAbbreviation;
  double elevation;
  CurrentWeatherUnits currentWeatherUnits;
  CurrentWeather currentWeather;

  Weather({
    required this.latitude,
    required this.longitude,
    required this.generationtimeMs,
    required this.utcOffsetSeconds,
    required this.timezone,
    required this.timezoneAbbreviation,
    required this.elevation,
    required this.currentWeatherUnits,
    required this.currentWeather,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      latitude: json['latitude'],
      longitude: json['longitude'],
      generationtimeMs: json['generationtime_ms'],
      utcOffsetSeconds: json['utc_offset_seconds'],
      timezone: json['timezone'],
      timezoneAbbreviation: json['timezone_abbreviation'],
      elevation: json['elevation'],
      currentWeatherUnits: CurrentWeatherUnits.fromJson(
        json['current_weather_units'],
      ),
      currentWeather: CurrentWeather.fromJson(json['current_weather']),
    );
  }
}

class CurrentWeather {
  String time;
  int interval;
  double temperature;
  double windspeed;
  int winddirection;
  int isDay;
  int weathercode;

  CurrentWeather({
    required this.time,
    required this.interval,
    required this.temperature,
    required this.windspeed,
    required this.winddirection,
    required this.isDay,
    required this.weathercode,
  });

  factory CurrentWeather.fromJson(Map<String, dynamic> json) {
    return CurrentWeather(
      time: json['time'],
      interval: json['interval'],
      temperature: json['temperature'],
      windspeed: json['windspeed'],
      winddirection: json['winddirection'],
      isDay: json['is_day'],
      weathercode: json['weathercode'],
    );
  }
}

class CurrentWeatherUnits {
  String time;
  String interval;
  String temperature;
  String windspeed;
  String winddirection;
  String isDay;
  String weathercode;

  CurrentWeatherUnits({
    required this.time,
    required this.interval,
    required this.temperature,
    required this.windspeed,
    required this.winddirection,
    required this.isDay,
    required this.weathercode,
  });

  factory CurrentWeatherUnits.fromJson(Map<String, dynamic> json) {
    return CurrentWeatherUnits(
      time: json['time'],
      interval: json['interval'],
      temperature: json['temperature'],
      windspeed: json['windspeed'],
      winddirection: json['winddirection'],
      isDay: json['is_day'],
      weathercode: json['weathercode'],
    );
  }
}
