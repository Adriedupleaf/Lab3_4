import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab_3/presentation/widgets/MainHeader.dart';
import 'package:lab_3/presentation/widgets/WineCarrouselSection.dart';
import 'package:lab_3/presentation/widgets/WineSection.dart';
import '../data/CarrouselData.dart';
import 'controllers/WineController.dart';


class HomeScreen extends StatelessWidget {
  final WineController _wineController = Get.put(WineController());

  HomeScreen({super.key}) {
    _wineController.loadWinesFromJson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: _buildHomeScreenContent(),
          ),
        ),
      ),
    );
  }

  Widget _buildHomeScreenContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        const WineAppHeader(),
        const SizedBox(height: 20),
        _buildWineCarrousel(),
        const SizedBox(height: 20),
        _buildWineList(),
      ],
    );
  }

  Widget _buildWineCarrousel() {
    return SizedBox(
      height: 220,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: winesCarrouselStatic.length,
        separatorBuilder: (context, index) => const SizedBox(width: 20),
        itemBuilder: (context, index) => WineCategoryCard(
          wineCarrousel: winesCarrouselStatic[index],
        ),
      ),
    );
  }

  Widget _buildWineList() {
    return Obx(() {
      if (_wineController.wines.isEmpty) {
        return const Center(child: CircularProgressIndicator());
      }

      return Column(
        children: _wineController.wines
            .map((wine) => WineCard(wine: wine))
            .toList(),
      );
    });
  }
}