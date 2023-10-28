import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_supply_task/Bloc/PastOrders.dart';
import 'package:i_supply_task/Bloc/States.dart';
import 'package:i_supply_task/ReUsableWidgets/ColoredLabel.dart';
import 'package:i_supply_task/ReUsableWidgets/CustomButton.dart';
import 'package:i_supply_task/ReUsableWidgets/CustomDashboardLabel.dart';

class DashboardLabels extends StatelessWidget {
  const DashboardLabels({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PastOrdersBloc, PastOrdersState>(
      listener: (context, state) {},
      builder: (context, state) {
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              CustomDashboardLabel(
                backgroundColor: const Color(0xFF4D6CAD),
                headerText: 'Total orders',
                iconData: Icons.list,
                dataText:
                    PastOrdersBloc.get(context).mockOrders.length.toString(),
              ),
              CustomDashboardLabel(
                backgroundColor: Colors.grey,
                headerText: 'Pending',
                iconData: Icons.pending,
                dataText: PastOrdersBloc.get(context).calcPending().toString(),
              ),
              CustomDashboardLabel(
                backgroundColor: Colors.green,
                headerText: 'Approved',
                iconData: Icons.check_circle,
                dataText: PastOrdersBloc.get(context).calcApproved().toString(),
              ),
              CustomDashboardLabel(
                backgroundColor: Colors.red,
                headerText: 'Rejected',
                iconData: Icons.close,
                dataText: PastOrdersBloc.get(context).calcRejected().toString(),
              ),
            ],
          ),
        );
      },
    );
  }
}

class OrdersSection extends StatelessWidget {
  const OrdersSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: <Widget>[
          OrdersTable(),
        ],
      ),
    );
  }
}

class OrdersTable extends StatelessWidget {
  const OrdersTable({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PastOrdersBloc, PastOrdersState>(
      listener: (context, state) {
        print('State in listener: $state');
      },
      builder: (context, state) {
        if (state is AddedOrderToPastOrdersState) {
          // Access the list of orders from the state
          List<Order> orders = state.orders;

          // Now you can work with the orders
          print('State in builder has ${orders.length} orders');
          print('Cart passed: ${state.cartItems}');
          for (Order order in orders) {
            order.printOrderDetails();
          }
        }

        if (PastOrdersBloc.get(context).mockOrders.isEmpty) {
          print('entered if');
          return const Text("You didn't have any past orders.");
        }
        return DataTable(
          columns: const <DataColumn>[
            DataColumn(label: Text('ID')),
            DataColumn(label: Text('Created')),
            DataColumn(label: Text('Price')),
            DataColumn(label: Text('Quantity')),
            DataColumn(label: Text('Status')),
          ],
          rows: PastOrdersBloc.get(context)
              .mockOrders
              .map(
                (order) => DataRow(
                  cells: [
                    DataCell(TextButton(
                        onPressed: () {
                          print(order["cartItems"]);

                        },
                        child: Text(order["ID"]))),
                    DataCell(Text(order["Created"])),
                    DataCell(Text('EGP ${order["Price"].toStringAsFixed(2)}')),
                    DataCell(Text(order["Qty"].toString())),
                    DataCell(ColoredLabel(text: order["Status"])),
                  ],
                ),
              )
              .toList(),
        );
      },
    );
  }
}

// class OrderListHeader extends StatefulWidget {
//   const OrderListHeader({super.key});
//
//   @override
//   _OrderListHeaderState createState() => _OrderListHeaderState();
// }
//
// class _OrderListHeaderState extends State<OrderListHeader> {
//   String dropdownValue = 'All orders';
//   bool idChecked = true;
//   bool createdChecked = false;
//   bool totalPriceChecked = false;
//   bool qtyChecked = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<PastOrdersState,PastOrdersState>(
//       listener: (context,state){},
//       builder: (context,state){
//         return Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   Expanded(
//                     flex: 1,
//                     child: DropdownButton<String>(
//                       value: dropdownValue,
//                       items: <String>[
//                         'All orders',
//                         'Pending',
//                         'Approved',
//                         'Rejected'
//                       ].map((String value) {
//                         return DropdownMenuItem<String>(
//                           value: value,
//                           child: Text(value),
//                         );
//                       }).toList(),
//                       onChanged: (String? newValue) {
//                         setState(() {
//                           dropdownValue = newValue!;
//                         });
//                       },
//                     ),
//                   ),
//                   SizedBox(width: 10),
//                   const Expanded(
//                     flex: 1,
//                     child: TextField(
//                       decoration: InputDecoration(
//                         hintText: 'Search orders',
//                         prefixIcon: Icon(Icons.search),
//                       ),
//                     ),
//                   ),
//                   SizedBox(width: 10),
//                   Expanded(
//                       flex: 2,
//                       child: Row(
//                         children: [
//                           Text(
//                             'Filter in ',
//                             style: TextStyle(fontSize: 20),
//                           ),
//                           Row(
//                             children: [
//                               Checkbox(
//                                 value: idChecked,
//                                 onChanged: (bool? value) {
//                                   setState(() {
//                                     idChecked = value!;
//                                     createdChecked = false;
//                                     totalPriceChecked = false;
//                                     qtyChecked = false;
//                                   });
//                                 },
//                               ),
//                               Text('ID'),
//                             ],
//                           ),
//                           Row(
//                             children: [
//                               Checkbox(
//                                 value: createdChecked,
//                                 onChanged: (bool? value) {
//                                   setState(() {
//                                     idChecked = false;
//                                     createdChecked = value!;
//                                     totalPriceChecked = false;
//                                     qtyChecked = false;
//                                   });
//                                 },
//                               ),
//                               Text('Created'),
//                             ],
//                           ),
//                           Row(
//                             children: [
//                               Checkbox(
//                                 value: totalPriceChecked,
//                                 onChanged: (bool? value) {
//                                   setState(() {
//                                     idChecked = false;
//                                     createdChecked = false;
//                                     totalPriceChecked = value!;
//                                     qtyChecked = false;
//                                   });
//                                 },
//                               ),
//                               Text('Total Price'),
//                             ],
//                           ),
//                           Row(
//                             children: [
//                               Checkbox(
//                                 value: qtyChecked,
//                                 onChanged: (bool? value) {
//                                   setState(() {
//                                     idChecked = false;
//                                     createdChecked = false;
//                                     totalPriceChecked = false;
//                                     qtyChecked = value!;
//                                   });
//                                 },
//                               ),
//                               const Text('Qty'),
//                             ],
//                           ),
//                         ],
//                       ))
//                 ],
//               ),
//               Divider(),
//             ],
//           ),
//         );
//       },
//
//     );
//   }
// }

class OrderListItem extends StatelessWidget {
  final Order order;

  const OrderListItem({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Handle order item press
        print('Order ${order.id} pressed.');
      },
      child: Card(
        elevation: 4,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  order.id,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: Text(order.created),
              ),
              Expanded(
                child: Text('EGP ${order.totalPrice.toStringAsFixed(2)}'),
              ),
              Expanded(
                child: Text(order.qty.toString()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
