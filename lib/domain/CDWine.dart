import 'CDFrom.dart';

class Wine {
  final String name;
  final String image;
  final int critic_score;
  final String bottle_size;
  final int price_usd;
  final String type;
  final From from;
  final String available;
  final bool isFavorite;

  Wine({
    required this.name,
    required this.image,
    required this.critic_score,
    required this.bottle_size,
    required this.price_usd,
    required this.type,
    required this.from,
    required this.available,
    required this.isFavorite,
  });

  factory Wine.fromJson(Map<String, dynamic> json) {
    return Wine(
      name: json['name'],
      image: json['image'],
      critic_score: json['critic_score'],
      bottle_size: json['bottle_size'],
      price_usd: json['price_usd'],
      type: json['type'],
      from: From(countryCode: json['from']['countryCode'],country: json['from']['country'], city: json['from']['city']),
      available: json['available'],
      isFavorite: json['isFavorite'] == 'true',
    );
  }
}