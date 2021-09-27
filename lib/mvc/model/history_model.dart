class HistoryModel {
  List<Data> data = [
    Data('Severe', '1'),
    Data('Severe', '2'),
    Data('Moderate', '3'),
    Data('Severe', '4'),
    Data('Unbearable', '5'),
    Data('Mild', '6'),
    Data('Mild', '7'),
    Data('Moderate', '8'),
    Data('None', '9'),
    Data('None', '10'),
    Data('None', '11'),
    Data('Moderate', '12'),
    Data('Moderate', '13'),
    Data('Severe', '14'),
    Data('Severe', '15'),
    Data('Unbearable', '16'),
    Data('None', '17'),
    Data('None', '18'),
    Data('Mild', '19'),
    Data('Mild', '20'),
    Data('Severe', '21'),
    Data('Severe', '22'),
    Data('None', '23'),
    Data('None', '24'),
    Data('Mild', '25'),
    Data('Mild', '26'),
    Data('Unbearable', '27'),
    Data('Unbearable', '28'),
    Data('Mild', '29'),
    Data('Severe', '30')
  ];
  List<Data> data1 = [
    Data('None', '1'),
    Data('Mild', '2'),
    Data('Moderate', '3'),
    Data('Severe', '4'),
    Data('Unbearable', '5'),
    Data('Unbearable', '6'),
    Data('Unbearable', '7'),
    Data('Unbearable', '8'),
    Data('Unbearable', '9'),
    Data('None', '10'),
    Data('None', '11'),
    Data('None', '12'),
    Data('None', '13'),
    Data('None', '14'),
    Data('None', '15'),
    Data('None', '16'),
    Data('None', '17'),
    Data('None', '18'),
    Data('None', '19'),
    Data('None', '20'),
    Data('Mild', '21'),
    Data('Mild', '22'),
    Data('Moderate', '23'),
    Data('Unbearable', '24'),
    Data('Unbearable', '25'),
    Data('Unbearable', '26'),
    Data('Unbearable', '27'),
    Data('Unbearable', '28'),
    Data('Unbearable', '29'),
    Data('Mild', '30')
  ];
  List<Data> data3 = [
    Data('None', '1'),
    Data('None', '2'),
    Data('Mild', '3'),
    Data('Severe', '4'),
    Data('Moderate', '5'),
    Data('Severe', '6'),
    Data('Mild', '7'),
    Data('None', '8'),
    Data('None', '9'),
    Data('None', '10'),
    Data('Mild', '11'),
    Data('Mild', '12'),
    Data('Mild', '13'),
    Data('Moderate', '14'),
    Data('Moderate', '15'),
    Data('Moderate', '16'),
    Data('Severe', '17'),
    Data('Severe', '18'),
    Data('Severe', '19'),
    Data('Severe', '20'),
    Data('Unbearable', '21'),
    Data('Unbearable', '22'),
    Data('Unbearable', '23'),
    Data('None', '24'),
    Data('None', '25'),
    Data('None', '26'),
    Data('None', '27'),
    Data('None', '28'),
    Data('Unbearable', '29'),
    Data('Unbearable', '30'),
  ];
}

class Data {
  final String pain;
  final String date;
  Data(this.pain, this.date);
}