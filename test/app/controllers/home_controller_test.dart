import 'package:conversor_curso/app/controllers/home_controller.dart';
import 'package:conversor_curso/app/models/currency_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  final TextEditingController toText = TextEditingController();
  final TextEditingController fromText = TextEditingController();
  final homeController = HomeController(toText: toText, fromText: fromText);

  test("Deve converter de real para dolar", () {
    toText.text = "2.0";
    homeController.convert();
    expect(fromText.text, "0.36");
  });
  test("Deve converter de dolar para real com ponto", () {
    toText.text = "1.0";
    homeController.toCurrency =
        CurrencyModel('Dollar', 5.57, 1.0, 0.9, 0.000018);
    homeController.fromCurrency =
        CurrencyModel('Real', 1.0, 0.18, 0.16, 0.0000032);
    homeController.convert();
    expect(fromText.text, "5.57");
  });
  test("Deve converter de dolar para real com virgula", () {
    toText.text = "1,0";
    homeController.toCurrency =
        CurrencyModel('Dollar', 5.57, 1.0, 0.9, 0.000018);
    homeController.fromCurrency =
        CurrencyModel('Real', 1.0, 0.18, 0.16, 0.0000032);
    homeController.convert();
    expect(fromText.text, "5.57");
  });
}
