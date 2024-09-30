class CurrencyModel {
  final String name;
  final double real;
  final double dollar;
  final double euro;
  final double bitcoin;

  CurrencyModel(this.name, this.real, this.dollar, this.euro, this.bitcoin);

  static List<CurrencyModel> getCurrencies() {
    return <CurrencyModel>[
      CurrencyModel('Real', 1.0, 0.18, 0.16, 0.0000032),
      CurrencyModel('Dollar', 5.57, 1.0, 0.9, 0.000018),
      CurrencyModel('Euro', 6.26, 1.11, 1.0, 0.000020),
      CurrencyModel('Bitcoin', 316068.71, 56761.67, 51064.56, 1),
    ];
  }
}
