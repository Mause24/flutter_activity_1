import 'package:activity_1/shared/custom_route.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void onImcCalculatorNavigation(BuildContext context) {
    context.push("/imc");
  }

  void onSalaryCalculatorNavigation(BuildContext context) {
    context.push("/salary");
  }

  @override
  Widget build(BuildContext context) {
    return CustomRoute(
      title: 'Activity 1',
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 50,
            children: <Widget>[
              SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      side: BorderSide(
                        width: 2,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                  onPressed: () => onImcCalculatorNavigation(context),
                  child: Text("IMC", style: TextStyle(fontSize: 24)),
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      side: BorderSide(
                        width: 2,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                  onPressed: () => onSalaryCalculatorNavigation(context),
                  child: Text(
                    "Calcular Salarios",
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
