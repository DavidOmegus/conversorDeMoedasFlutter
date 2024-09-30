import 'package:conversor_curso/app/models/currency_model.dart';
import 'package:flutter/material.dart';

String dropDownValue = "real";

class CurrencyBox extends StatelessWidget {
  final List<CurrencyModel> items;
  final TextEditingController controller;
  final CurrencyModel? selectedItem;
  final void Function(CurrencyModel? model) onChanged;

  const CurrencyBox({
    Key? key,
    required this.items,
    required this.controller,
    required this.onChanged,
    this.selectedItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: SizedBox(
            height: 56,
            child: DropdownButton<CurrencyModel>(
              style: TextStyle(fontSize: 22),
              iconSize: 30,
              iconEnabledColor: Colors.white,
              isExpanded: true,
              value: selectedItem,
              icon: Icon(Icons.menu),
              underline: Container(
                height: 2,
                color: Colors.purple,
              ),
              items: items
                  .map((e) => DropdownMenuItem<CurrencyModel>(
                        child: Text(e.name),
                        value: e,
                      ))
                  .toList(),
              onChanged: onChanged,
            ),
          ),
        ),
        const SizedBox(width: 30),
        Expanded(
          flex: 2,
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.purple, width: 2),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.purple, width: 2),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
