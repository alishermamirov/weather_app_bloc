class HourlyWeatherModel {
  final String id;
  final int date;
  final double tempMax;
  final String main;
  final String desc;
  final String icon;

  HourlyWeatherModel(
      {required this.id,
      required this.date,
      required this.tempMax,
      required this.main,
      required this.desc,
      required this.icon});
}
