class Price {
  final num value;
  final String currencyCode;
  final String currencySymbol;

  const Price(
      {required this.value,
      required this.currencyCode,
      required this.currencySymbol});
  Price.fromJson(Map data)
      : value = num.parse(data['value'].toString()),
        currencySymbol = data['currencySymbol'] ?? '',
        currencyCode = data['currencyCode'] ?? '';
}
