import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:lab_3/domain/CDWine.dart';

class WineController extends GetxController {
  final RxList<Wine> wines = <Wine>[].obs;

  final Rx<String?> errorMessage = Rx<String?>(null);

  @override
  void onInit() {
    super.onInit();
    loadWinesFromJson();
  }

  Future<void> loadWinesFromJson() async {
    try {
      final jsonString = await rootBundle.loadString('lib/data/data.json');
      final jsonData = json.decode(jsonString) as Map<String, dynamic>;

      final List<dynamic> jsonList = [...?jsonData['carousel']];

      final List<Wine> loadedWines = jsonList
          .map((item) => Wine.fromJson(item as Map<String, dynamic>))
          .whereType<Wine>()
          .toList();

      wines.value = loadedWines;

      if (loadedWines.isEmpty) {
        errorMessage.value = 'No wines found in the data source';
      }
    } catch (e) {
      errorMessage.value = 'Failed to load wines: ${e.toString()}';

      if (kDebugMode) {
        debugPrint('Error loading wines: $e');
      }
    }
  }
}