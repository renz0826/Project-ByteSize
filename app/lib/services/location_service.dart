import 'package:flutter/services.dart' show rootBundle;
import 'package:csv/csv.dart';

class LocationService {
  // Load provinces from CSV
  Future<List<String>> getProvinces() async {
    // 1. Load the file as a string
    final rawData = await rootBundle.loadString("assets/sqldump/provinces.csv");

    // 2. Convert CSV string into a List of Lists
    List<List<dynamic>> listData = const CsvToListConverter().convert(rawData);

    // 3. Extract just the names (assuming name is in the first column)
    // We skip the first row [0] because it's usually the header (Name, Code, etc.)
    return listData.skip(1).map((row) => row[0].toString()).toList()..sort();
  }
}
