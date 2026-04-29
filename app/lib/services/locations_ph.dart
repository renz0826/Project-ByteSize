import 'package:philippines_rpcmb/philippines_rpcmb.dart';

class PhAddressService {
  // All 82 Provinces in the Philippines
  static List<String> getAllProvinceNames() {
    return philippineRegions
        .expand((r) => r.provinces)
        .map((p) => p.name)
        .toList()..sort();
  }

  // 1600 Cities/Municipalities in the Philippines
  static List<String> getAllCityNames() {
    return philippineRegions
        .expand((r) => r.provinces)
        .expand((p) => p.municipalities)
        .map((m) => m.name)
        .toList()..sort();
  }

 // All 42,000 Barangays in the Philippines
 static List<String> getAllBarangayNames() {
  return philippineRegions
      .expand((r) => r.provinces)
      .expand((p) => p.municipalities)
      .expand((m) => m.barangays)
      .map((b) => b.toString())   
      .toList()
    ..sort();
}

}