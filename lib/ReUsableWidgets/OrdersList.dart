import 'package:flutter/material.dart';
import 'package:i_supply_task/ReUsableWidgets/ColoredLabel.dart';
import 'package:i_supply_task/ReUsableWidgets/CustomButton.dart';
import 'package:i_supply_task/ReUsableWidgets/CustomDashboardLabel.dart';

final List<Order> mockOrders = [
  Order('#211221', '21/10/2023', 100.0, 5, 'Approved'),
  Order('#211222', '22/10/2023', 75.0, 3, 'Rejected'),
  Order('#211223', '23/10/2023', 50.0, 2, 'Pending'),
  Order('#211221', '21/10/2023', 100.0, 5, 'Approved'),
  Order('#211222', '22/10/2023', 75.0, 3, 'Rejected'),
  Order('#211223', '23/10/2023', 50.0, 2, 'Pending'),
  Order('#211221', '21/10/2023', 100.0, 5, 'Approved'),
  Order('#211222', '22/10/2023', 75.0, 3, 'Rejected'),
  Order('#211223', '23/10/2023', 50.0, 2, 'Pending'),
  Order('#211221', '21/10/2023', 100.0, 5, 'Approved'),
  Order('#211222', '22/10/2023', 75.0, 3, 'Rejected'),
  Order('#211223', '23/10/2023', 50.0, 2, 'Pending'),
  Order('#211221', '21/10/2023', 100.0, 5, 'Approved'),
  Order('#211222', '22/10/2023', 75.0, 3, 'Rejected'),
  Order('#211223', '23/10/2023', 50.0, 2, 'Pending'),
  Order('#211221', '21/10/2023', 100.0, 5, 'Approved'),
  Order('#211222', '22/10/2023', 75.0, 3, 'Rejected'),
  Order('#211223', '23/10/2023', 50.0, 2, 'Pending'),
  Order('#211221', '21/10/2023', 100.0, 5, 'Approved'),
  Order('#211222', '22/10/2023', 75.0, 3, 'Rejected'),
  Order('#211223', '23/10/2023', 50.0, 2, 'Pending'),
  Order('#211221', '21/10/2023', 100.0, 5, 'Approved'),
  Order('#211222', '22/10/2023', 75.0, 3, 'Rejected'),
  Order('#211223', '23/10/2023', 50.0, 2, 'Pending'),
  Order('#211221', '21/10/2023', 100.0, 5, 'Approved'),
  Order('#211222', '22/10/2023', 75.0, 3, 'Rejected'),
  Order('#211223', '23/10/2023', 50.0, 2, 'Pending'),
  Order('#211221', '21/10/2023', 100.0, 5, 'Approved'),
  Order('#211222', '22/10/2023', 75.0, 3, 'Rejected'),
  Order('#211223', '23/10/2023', 50.0, 2, 'Pending'),
];

class DashboardLabels extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          CustomDashboardLabel(
            backgroundColor: Color(0xFF4D6CAD),
            headerText: 'Total orders',
            iconData: Icons.list,
            dataText: '50',
          ),
          CustomDashboardLabel(
            backgroundColor: Colors.grey,
            headerText: 'Pending',
            iconData: Icons.pending,
            dataText: '50',
          ),
          CustomDashboardLabel(
            backgroundColor: Colors.green,
            headerText: 'Approved',
            iconData: Icons.check_circle,
            dataText: '50',
          ),
          CustomDashboardLabel(
            backgroundColor: Colors.red,
            headerText: 'Rejected',
            iconData: Icons.close,
            dataText: '50',
          ),
        ],
      ),
    );
  }
}

class OrdersSection extends StatelessWidget {
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
  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: const <DataColumn>[
        DataColumn(label: Text('ID')),
        DataColumn(label: Text('Created')),
        DataColumn(label: Text('Price')),
        DataColumn(label: Text('Quantity')),
        DataColumn(label: Text('Status')),
      ],
      rows: mockOrders
          .map(
            (order) => DataRow(
              cells: [
                DataCell(Text(order.id)),
                DataCell(Text(order.created)),
                DataCell(Text('EGP ${order.totalPrice.toStringAsFixed(2)}')),
                DataCell(Text(order.qty.toString())),
                DataCell(ColoredLabel(text: order.status)),
              ],
            ),
          )
          .map(
            (dataRow) => DataRow(
              cells: dataRow.cells
                  .map(
                    (dataCell) => DataCell(
                      InkWell(
                        onTap: () {
                          // Handle the tap on this row (order)
                          print('Order ${dataRow.cells[0].child} tapped.');
                        },
                        child: dataCell.child,
                      ),
                    ),
                  )
                  .toList(),
            ),
          )
          .toList(),
    );
  }
}

class OrderListHeader extends StatefulWidget {
  const OrderListHeader({super.key});

  @override
  _OrderListHeaderState createState() => _OrderListHeaderState();
}

class _OrderListHeaderState extends State<OrderListHeader> {
  String dropdownValue = 'All orders';
  bool idChecked = true;
  bool createdChecked = true;
  bool totalPriceChecked = true;
  bool qtyChecked = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              DropdownButton<String>(
                value: dropdownValue,
                items: <String>['All orders', 'Pending', 'Approved', 'Rejected']
                    .map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValue = newValue!;
                  });
                },
              ),
              SizedBox(width: 10),
              Flexible(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search orders',
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
              ),
              SizedBox(width: 10),
              Row(
                children: [
                  Checkbox(
                    value: idChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        idChecked = value!;
                      });
                    },
                  ),
                  Text('ID'),
                ],
              ),
              Row(
                children: [
                  Checkbox(
                    value: createdChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        createdChecked = value!;
                      });
                    },
                  ),
                  Text('Created'),
                ],
              ),
              Row(
                children: [
                  Checkbox(
                    value: totalPriceChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        totalPriceChecked = value!;
                      });
                    },
                  ),
                  Text('Total Price'),
                ],
              ),
              Row(
                children: [
                  Checkbox(
                    value: qtyChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        qtyChecked = value!;
                      });
                    },
                  ),
                  Text('Qty'),
                ],
              ),
            ],
          ),
          Divider(),
        ],
      ),
    );
  }
}

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

class Order {
  final String id;
  final String created;
  final double totalPrice;
  final int qty;
  final String status;

  Order(this.id, this.created, this.totalPrice, this.qty, this.status);
}
