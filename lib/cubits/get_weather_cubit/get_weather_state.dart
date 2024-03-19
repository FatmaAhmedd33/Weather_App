class WeatherState {}
//CREATE PARENT CLASS TO GIVE THE CLASS OF CUBIT ACCESS FOR ALL STATES WII INHERTANCE FROM PARENT ,

class NoWeatherState extends WeatherState {}

class WeatherLoadedState extends WeatherState {}

class WeatherFailureState extends WeatherState {}
