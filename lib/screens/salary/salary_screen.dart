import 'package:activity_1/shared/custom_route.dart';
import 'package:flutter/material.dart';

class SalaryCalculatorScreen extends StatefulWidget {
  const SalaryCalculatorScreen({super.key});

  @override
  State<SalaryCalculatorScreen> createState() => _SalaryCalculatorScreen();
}

class _SalaryCalculatorScreen extends State<SalaryCalculatorScreen> {
  final _formKey = GlobalKey<FormState>();

  final _nameCtrl = TextEditingController();
  final _hoursCtrl = TextEditingController();
  final _valueCtrl = TextEditingController();

  String? _result;

  void calculateTotal() {
    if (_formKey.currentState!.validate()) {
      final name = _nameCtrl.text;
      final hours = int.parse(_hoursCtrl.text);
      final value = double.parse(_valueCtrl.text);

      setState(() {
        _result =
            "El empleado $name hizo $hours horas por un valor de $value COP la hora, dando un total de ${value * hours}";
      });
    }
  }

  @override
  void dispose() {
    _nameCtrl.dispose();
    _hoursCtrl.dispose();
    _valueCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomRoute(
      title: "Calculadora de Salario",
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
                  Expanded(flex: 2, child: Text("Nombre del empleado")),
                  Expanded(
                    flex: 3,
                    child: TextFormField(
                      controller: _nameCtrl,
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Ingrese el nombre";
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(flex: 2, child: Text("Horas Trabajadas")),
                  Expanded(
                    flex: 3,
                    child: TextFormField(
                      controller: _hoursCtrl,
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Ingrese las horas trabajadas";
                        }
                        if (int.tryParse(value) == null) {
                          return "Las horas trabajadas deben ser un numero entero";
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(flex: 2, child: Text("Valor hora")),
                  Expanded(
                    flex: 3,
                    child: TextFormField(
                      controller: _valueCtrl,
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Ingrese el valor de las horas";
                        }
                        if (int.tryParse(value) == null) {
                          return "El valor de las horas deben ser un numero entero";
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
