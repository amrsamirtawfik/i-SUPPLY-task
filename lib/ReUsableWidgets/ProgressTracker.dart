import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class ProgressTracker extends StatelessWidget {
  int currentStep;
  bool approved;

  ProgressTracker({
    required this.currentStep,
    required this.approved,
  });

  @override
  Widget build(BuildContext context) {
    Color selectedColor;
    if (currentStep == 1) {
      selectedColor = Colors.black;
    } else {
      approved ? selectedColor = Colors.green : selectedColor=Colors.red;
    }
    return StepProgressIndicator(
        totalSteps: 5,
        currentStep: currentStep,
        size: 50,
        selectedColor: selectedColor,
        unselectedColor: Colors.grey,
        customStep: (index, color, _) {
          switch (index) {
            case 0: //pending
              return Column(
                children: [
                  Container(
                    width: 200,
                    height: 30,
                    color: color,
                    child: const Icon(
                      Icons.pending_outlined,
                      color: Colors.white,
                    ),
                  ),
                  const Text(
                    'Pending',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              );
            case 1: //approved or rejected
              return Column(
                children: [
                  Container(
                    width: 200,
                    height: 30,
                    color: color,
                    child: Icon(
                      approved ? Icons.check : Icons.close,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    approved ? 'Approved' : 'Rejected',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              );
            case 2: //Ready
              return Column(
                children: [
                  Container(
                    width: 200,
                    height: 30,
                    color: color,
                    child: const Icon(
                      Icons.check,
                      color: Colors.white,
                    ),
                  ),
                  const Text(
                    'Ready',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              );
            case 3: //Out for deleviry
              return Column(
                children: [
                  Container(
                    width: 200,
                    height: 30,
                    color: color,
                    child: const Icon(
                      Icons.local_shipping,
                      color: Colors.white,
                    ),
                  ),
                  const Text(
                    'Out for delivery',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              );
            case 4: //Delevired
              return Column(
                children: [
                  Container(
                    width: 200,
                    height: 30,
                    color: color,
                    child: const Icon(
                      Icons.check,
                      color: Colors.white,
                    ),
                  ),
                  const Text(
                    'Delivered',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              );
            default:
              return Container(
                width: 200,
                height: 30,
                color: color,
                child: const Icon(
                  Icons.check,
                  color: Colors.white,
                ),
              );
          }
        });
  }
}
