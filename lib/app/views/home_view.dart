import 'package:conversor_curso/app/components/currency_box.dart';
import 'package:conversor_curso/app/controllers/home_controller.dart';
import 'package:conversor_curso/app/models/currency_model.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final TextEditingController toText = TextEditingController();

  final TextEditingController fromText = TextEditingController();

  late HomeController homeController;

  @override
  void initState() {
    super.initState();
    homeController = HomeController(toText: toText, fromText: fromText);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding:
              const EdgeInsets.only(top: 100, left: 30, right: 30, bottom: 30),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: 250,
                  height: 250,
                  child: Image.asset('assets/images/logo.png'),
                ),
                SizedBox(height: 100),
                CurrencyBox(
                  selectedItem: homeController.toCurrency,
                  controller: toText,
                  items: homeController.currencies,
                  onChanged: (model) {
                    setState(() {
                      homeController.toCurrency = model!;
                    });
                  },
                ),
                SizedBox(height: 15),
                CurrencyBox(
                  selectedItem: homeController.fromCurrency,
                  controller: fromText,
                  items: homeController.currencies,
                  onChanged: (model) {
                    setState(() {
                      homeController.fromCurrency = model!;
                    });
                  },
                ),
                SizedBox(height: 40),
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: RaisedButton(
                    color: Colors.purple,
                    onPressed: () {
                      homeController.convert();
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 12, bottom: 12),
                      child: Text(
                        "CONVERTER",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
