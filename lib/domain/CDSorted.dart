class Sorted
{
  final String tag;
  final String name;

  Sorted({
    required this.tag,
    required this.name,
  });

  factory Sorted.fromJson(Map<String, dynamic> json) {
    return Sorted(
      tag: json['tag'],
      name: json['name'],
    );
  }
}