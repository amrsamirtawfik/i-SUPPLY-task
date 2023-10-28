import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class ProgressTracker extends StatelessWidget {
  String currentStatus;

  ProgressTracker({
    required this.currentStatus,
  });

  @override
  Widget build(BuildContext context) {
    Color selectedColor;
    int currentStep;
    switch (currentStatus) {
      case 'Pending':
        selectedColor = Colors.black;
        currentStep = 1;
        break;
      case 'Approved':
        selectedColor = Colors.green;
        currentStep = 2;
        break;
      case 'Rejected':
        selectedColor = Colors.red;
        currentStep = 2;
        break;
      case 'Out for delivery':
        selectedColor = Colors.green;
        currentStep = 4;
        break;
      case 'Ready':
        selectedColor = Colors.green;
        currentStep = 3;
        break;
      case 'Delivered':
        selectedColor = Colors.green;
        currentStep = 5;
        break;
      case 'Cancelled':
        selectedColor = Color(0xFFFFE300);
        currentStep = 3;
        break;
      default:
        selectedColor = Colors.black;
        currentStep = 1;
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
                      selectedColor == Colors.red ? Icons.close : Icons.check,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    selectedColor == Colors.red ? 'Rejected' : 'Approved',
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
                    child: Icon(
                      currentStatus!='Cancelled'? Icons.check : Icons.minimize,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    currentStatus!='Cancelled'? 'Ready' : 'Cancelled',
                    style: const TextStyle(fontWeight: FontWeight.bold),
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
