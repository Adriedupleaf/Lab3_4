import 'package:flutter/material.dart';

import '../../domain/WineCarrousel.dart';

class WineCategoryCard extends StatelessWidget {
  final WineCarrousel wineCarrousel;

  const WineCategoryCard({
    super.key,
    required this.wineCarrousel,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          _buildImageContainer(),
          const Divider(thickness: 1, height: 1),
          _buildTitleContainer(),
        ],
      ),
    );
  }

  Widget _buildImageContainer() {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(
        top: Radius.circular(16),
      ),
      child: Image.asset(
        wineCarrousel.imageUrl,
        width: 150,
        height: 160,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildTitleContainer() {
    return Container(
      width: 150,
      height: 43,
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(16),
        ),
        color: Colors.white
      ),
      child: Center(
        child: Text(
          wineCarrousel.title,
          style: const TextStyle(
            fontFamily: 'Archivo',
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}