import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../domain/CDSorted.dart';

class FilterController extends GetxController {
  final RxList<Sorted> filters = <Sorted>[].obs;

  final RxString selectedFilter = RxString('');

  final Rx<String?> errorMessage = Rx<String?>(null);

  @override
  void onInit() {
    super.onInit();
    loadFiltersFromJson();
  }

  Future<void> loadFiltersFromJson() async {
    try {
      final jsonString = await rootBundle.loadString('lib/data/data.json');
      final jsonData = json.decode(jsonString) as Map<String, dynamic>;

      final List<dynamic> jsonFilters = [...?jsonData['wines_by']];

      filters.value = jsonFilters
          .map((item) => Sorted.fromJson(item))
          .whereType<Sorted>()
          .toList();

      if (filters.isNotEmpty) {
        selectedFilter.value = filters.first.name;
      } else {
        errorMessage.value = 'No filters found in the data source';
      }
    } catch (e) {
      errorMessage.value = 'Failed to load filters: ${e.toString()}';

      if (kDebugMode) {
        debugPrint('Error loading filters: $e');
      }
    }
  }

  void updateSelectedFilter(String filterName) {
    if (filters.any((filter) => filter.name == filterName)) {
      selectedFilter.value = filterName;
    } else {
      if (kDebugMode) {
        debugPrint('Invalid filter name: $filterName');
      }
    }
  }

}