import 'dart:math';

import 'package:activity_1/shared/custom_route.dart';
import 'package:flutter/material.dart';

class ImcCalculatorScreen extends StatefulWidget {
  const ImcCalculatorScreen({super.key});

  @override
  State<ImcCalculatorScreen> createState() => _ImcCalculatorScreen();
}

class _ImcCalculatorScreen extends State<ImcCalculatorScreen> {
  final _formKey = GlobalKey<FormState>();

  final _weightCtrl = TextEditingController();
  final _heightCtrl = TextEditingController();

  String? _result;

  void calculateTotal() {
    if (_formKey.currentState!.validate()) {
      final weight = double.parse(_weightCtrl.text);
      final height = double.parse(_heightCtrl.text);

      setState(() {
        _result =
            "El peso es $weight, y la altura es $height por tanto su IMC es ${(weight / (pow(height, 2))).toStringAsFixed(3)}";
      });
    }
  }

  @override
  void dispose() {
    _weightCtrl.dispose();
    _heightCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomRoute(
      title: "Calculadora de IMC",
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(flex: 2, child: Text("Peso (kg)")),
                  Expanded(
                    flex: 3,
                    child: TextFormField(
                      controller: _weightCtrl,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: Theme.of(context).primaryColor,
                            width: 2,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: Colors.grey.shade400,
                            width: 1.5,
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: Colors.red, width: 2),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: Colors.red, width: 2),
                        ),
                        filled: true,
                        fillColor: Colors.grey.shade50,
                      ),
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Ingrese el peso en kg";
                        }
                        if (double.tryParse(value) == null) {
                          return "El peso debe ser un numero real";
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(flex: 2, child: Text("Altura (mts)")),
                  Expanded(
                    flex: 3,
                    child: TextFormField(
                      controller: _heightCtrl,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: Theme.of(context).primaryColor,
                            width: 2,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: Colors.grey.shade400,
                            width: 1.5,
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: Colors.red, width: 2),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: Colors.red, width: 2),
                        ),
                        filled: true,
                        fillColor: Colors.grey.shade50,
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Ingrese su altura en metros";
                        }
                        if (double.tryParse(value) == null) {
                          return "La altura debe ser un numero real";
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),

              if (_result != null)
                Column(children: [SizedBox(height: 50), Text("$_result")]),
              SizedBox(height: 50),
              ElevatedButton(
                onPressed: calculateTotal,
                child: Text("Calcular"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
