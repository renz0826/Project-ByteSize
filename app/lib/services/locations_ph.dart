import 'package:philippines_rpcmb/philippines_rpcmb.dart';

// Optimization Idea: Displaying query based on province selected
// 1. Staff selects province.
// 2. Generate city/municipality based on the selected province.
// 3. Generate Barangay based on province and city selected.

class PhAddressService {
  static List<String>?
      _cachedProvinces; // only runs through the whole library ONCE (instead of everytime a user selects a province)

  // All 82 Provinces in the Philippines 
  static List<String> getAllProvinceNames() {
    _cachedProvinces ??= philippineRegions
        .expand((r) => r.provinces) // get all provinces
        .map((p) => p.name)
        .toList() // add them to a list
      ..sort(); // sort them A-Z
    return _cachedProvinces!;
  }

  // 1600 Cities/Municipalities in the Philippines
  static List<String> getCitiesByProvince(String provinceName) {
    try {
      return philippineRegions
          .expand((r) => r.provinces)
          .firstWhere((p) => p.name == provinceName) // bases dropdown query on province selected
          .municipalities
          .map((m) => m.name) // then using provinces, displays all munipalities under that province
          .toList() // add them to a list
        ..sort(); // sorts using A-Z feature
    } catch (e) {
      return []; // Error Handling: In case no province has been selected
    }
  }

  // All 42,000 Barangays in the Philippines
  static List<String> getBarangaysByLocation(
      {required String provinceName, required String cityName}) {
    try {
      return philippineRegions
          .expand((r) => r.provinces)
          .firstWhere((p) => p.name == provinceName) // copies the function from above
          .municipalities
          .firstWhere((m) => m.name == cityName) // then only displays the barangays from a specific municipality/city
          .barangays
          .map((b) => b.toString()) // puts all barangays as a string (for some reason this fixes errors)
          .toList() // add them to the list
        ..sort(); // sorts the barangays A-Z
    } catch (e) {
      return []; // Error Handling: In case no province has been selected
    }
  }
}
