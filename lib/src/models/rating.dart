class Rating {
  final num average;
  final int total;

  const Rating({required this.average, required this.total});
  Rating.fromJson(Map data)
      : average = num.parse(data['average'].toString()),
        total = int.parse(data['total'].toString());
}
