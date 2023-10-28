import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_supply_task/Bloc/CurrentScreenBloc.dart';
import 'package:i_supply_task/Bloc/PastOrders.dart';
import 'package:i_supply_task/Bloc/States.dart';
import 'package:i_supply_task/ReUsableWidgets/ColoredLabel.dart';
import 'package:i_supply_task/ReUsableWidgets/CustomButton.dart';
import 'package:i_supply_task/ReUsableWidgets/CustomDashboardLabel.dart';
import 'package:i_supply_task/Screens/TrackYourOrder.dart';

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
                backgroundColor: Colors.black,
                headerText: 'Pending',
                iconData: Icons.pending,
                dataText: PastOrdersBloc.get(context).calcPending().toString(),
              ),
              CustomDashboardLabel(
                backgroundColor: Colors.green,
                headerText: 'Approved',
                iconData: Icons.check,
                dataText: PastOrdersBloc.get(context).calcApproved().toString(),
              ),
              CustomDashboardLabel(
                backgroundColor: Colors.red,
                headerText: 'Rejected',
                iconData: Icons.close,
                dataText: PastOrdersBloc.get(context).calcRejected().toString(),
              ),
              CustomDashboardLabel(
                backgroundColor: Colors.green,
                headerText: 'Ready',
                iconData: Icons.check,
                dataText: PastOrdersBloc.get(context).calcReady().toString(),
              ),
              CustomDashboardLabel(
                backgroundColor: Colors.green,
                headerText: 'Out for delivery',
                iconData: Icons.local_shipping,
                dataText:
                    PastOrdersBloc.get(context).calcOutForDeleivry().toString(),
              ),
              CustomDashboardLabel(
                backgroundColor: Colors.green,
                headerText: 'Delivered',
                iconData: Icons.check,
                dataText:
                    PastOrdersBloc.get(context).calcDelevired().toString(),
              ),
              CustomDashboardLabel(
                backgroundColor: Colors.yellow,
                headerText: 'Cancelled',
                iconData: Icons.minimize,
                dataText:
                    PastOrdersBloc.get(context).calcCancelled().toString(),
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
      listener: (context, state) {},
      builder: (context, state) {
        if (state is AddedOrderToPastOrdersState) {
          // Access the list of orders from the state
          List<Order> orders = state.orders;

          for (Order order in orders) {
            order.printOrderDetails();
          }
        }

        if (PastOrdersBloc.get(context).mockOrders.isEmpty) {
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
                          context
                              .read<CurrentScreenBloc>()
                              .navToTrackYourOrder(order);
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
