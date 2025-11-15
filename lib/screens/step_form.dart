import 'package:flutter/material.dart';

class StepForm extends StatefulWidget {
  const StepForm({super.key});

  @override
  State<StepForm> createState() => _StepFormState();
}

class _StepFormState extends State<StepForm> {
  int activeIndex = 0;
  final int totalSteps = 5;
  Widget bodyBuilder() {
    switch (activeIndex) {
      case 0:
        return Text("1st form");
      case 1:
        return Text("2nd form");
      case 2:
        return Text("3nd form");
      case 3:
        return Text("4nd form");
      case 4:
        return Text("5nd form");

      default:
        return Text("1st form");
    }
  }

  Color getColor(int segmentIndex) {
    // active (completed/current) segments are green, others are grey
    return segmentIndex < activeIndex ? Colors.green : Colors.grey.shade400;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(height: 30),
              Row(
                spacing: 16,
                children: [
                  Expanded(child: Container(height: 6, color: getColor(0))),
                  Expanded(child: Container(height: 6, color: getColor(1))),
                  Expanded(child: Container(height: 6, color: getColor(2))),
                  Expanded(child: Container(height: 6, color: getColor(3))),
                ],
              ),
              bodyBuilder(),
              Row(
                spacing: 16,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        // go back but not below 0
                        setState(() {
                          if (activeIndex > 0) activeIndex--;
                        });
                      },
                      child: Text("Back"),
                    ),
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        // advance but not past last step
                        setState(() {
                          if (activeIndex < totalSteps - 1) activeIndex++;
                        });
                      },
                      child: Text("next"),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
