import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:lab_3/domain/CDWine.dart';

class WineCard extends StatelessWidget {
  final Wine wine;

  const WineCard({super.key, required this.wine});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 5,
      child: Column(
        children: [
          _buildWineHeader(),
          const Divider(thickness: 1, height: 1),
          _buildWineFooter(),
        ],
      ),
    );
  }

  Widget _buildWineHeader() {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildWineImage(),
          const SizedBox(width: 16),
          Expanded(child: _buildWineDetails()),
        ],
      ),
    );
  }

  Widget _buildWineImage() {
    return Image.network(
      wine.image,
      height: 180,
      width: 110,
      fit: BoxFit.cover,
    );
  }

  Widget _buildWineDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildAvailabilityTag(),
        const SizedBox(height: 8),
        _buildWineName(),
        const SizedBox(height: 8),
        _buildWineType(),
        const SizedBox(height: 8),
        _buildWineOrigin(),
      ],
    );
  }

  Widget _buildAvailabilityTag() {
    return Container(
      width: 80,
      height: 30,
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 5),
      decoration: BoxDecoration(
        color: wine.available == 'Available'
            ? Colors.green.shade100
            : Colors.red.shade100,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        wine.available,
        style: TextStyle(
          color: wine.available == 'Available'
              ? Colors.green
              : Colors.red,
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildWineName() {
    return Text(
      wine.name,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildWineType() {
    return Row(
      children: [
        const Image(
          image: AssetImage('assets/images/img.png'),
          width: 22,
          height: 22,
        ),
        const SizedBox(width: 2),
        Flexible(
          child: Text(
            '${wine.type} Wine (Green and Flinty)',
            style: TextStyle(
              color: Colors.grey.shade600,
              fontSize: 12,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ),
      ],
    );
  }

  Widget _buildWineOrigin() {
    return Row(
      children: [
        CountryFlag.fromCountryCode(
          wine.from.countryCode,
          shape: const Circle(),
          width: 20,
          height: 20,
        ),
        const SizedBox(width: 6),
        Flexible(
          child: Text(
            ' From ${wine.from.country}, ${wine.from.city}',
            style: TextStyle(
              color: Colors.grey.shade600,
              fontSize: 14,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ),
      ],
    );
  }

  Widget _buildWineFooter() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
      ),
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          _buildFavoriteAndPrice(),
          const SizedBox(height: 8),
          _buildCriticsScore(),
        ],
      ),
    );
  }

  Widget _buildFavoriteAndPrice() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildFavoriteButton(),
        _buildPriceDetails(),
      ],
    );
  }

  Widget _buildFavoriteButton() {
    return wine.isFavorite
        ? _buildActiveFavoriteButton()
        : _buildInactiveFavoriteButton();
  }

  Widget _buildActiveFavoriteButton() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.favorite, color: Colors.white, size: 18),
          SizedBox(width: 6),
          Text(
            'Added',
            style: TextStyle(fontSize: 14, color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget _buildInactiveFavoriteButton() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.black),
      ),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.favorite_border, color: Colors.black, size: 18),
          SizedBox(width: 6),
          Text(
            'Favourite',
            style: TextStyle(fontSize: 14, color: Colors.black),
          ),
        ],
      ),
    );
  }

  Widget _buildPriceDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          '₹ ${wine.price_usd}',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'Bottle (750ml)',
          style: TextStyle(
            color: Colors.grey.shade600,
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  Widget _buildCriticsScore() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          "Critics' Scores: ${wine.critic_score} / 100",
          style: TextStyle(
            color: Colors.grey.shade600,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}