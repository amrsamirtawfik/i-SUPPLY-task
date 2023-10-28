import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_supply_task/Bloc/States.dart';

class PastOrdersBloc extends Cubit<PastOrdersState> {
  PastOrdersBloc() : super(PastOrdersState());

  static PastOrdersBloc get(context) => BlocProvider.of(context);

  final List<Map<String, dynamic>> mockOrders = [
    {
      "ID": "#389787",
      "Created": "28/10/2023",
      "Qty": 1,
      "Price": 443.5,
      "Status": "Approved",
      "cartItems":
          "[{\"productName\":\"Accu Fine Insulin Pen Needles 5Mm 100 Pieces\",\"productPrice\":\"443.5\",\"imageUrl\":\"https://misr-online.com/media/catalog/product/cache/f4c520eccbadb01ffa4ab0fe869fee93/1/5/155659_304298.jpg\",\"quantity\":\"1\"}]"
    },
    {
      "ID": "#781708",
      "Created": "28/10/2023",
      "Qty": 12,
      "Price": 3442.0,
      "Status": "Cancelled",
      "cartItems":
          "[{\"productName\":\"Accu Chek Performa Test Strips 50 Strips\",\"productPrice\":\"396.0\",\"imageUrl\":\"https://misr-online.com/media/catalog/product/cache/f4c520eccbadb01ffa4ab0fe869fee93/0/9/093538_300012.jpg\",\"quantity\":\"3\"},{\"productName\":\"Accu Chek Guide Me 50 Strip\",\"productPrice\":\"430.0\",\"imageUrl\":\"https://misr-online.com/media/catalog/product/cache/f4c520eccbadb01ffa4ab0fe869fee93/1/2/122319_304768.jpg\",\"quantity\":\"1\"},{\"productName\":\"Syringe Insulin 100Iu 1Ml\",\"productPrice\":\"5.0\",\"imageUrl\":\"https://misr-online.com/media/catalog/product/cache/f4c520eccbadb01ffa4ab0fe869fee93/0/9/093213_300452.jpg\",\"quantity\":\"1\"},{\"productName\":\"Accu Chek Active Test Strips 50 Strips\",\"productPrice\":\"360.0\",\"imageUrl\":\"https://misr-online.com/media/catalog/product/cache/f4c520eccbadb01ffa4ab0fe869fee93/1/4/144455_300006.jpg\",\"quantity\":\"2\"},{\"productName\":\"Accu Fine Insulin Pen Needles 5Mm 100 Pieces\",\"productPrice\":\"443.5\",\"imageUrl\":\"https://misr-online.com/media/catalog/product/cache/f4c520eccbadb01ffa4ab0fe869fee93/1/5/155659_304298.jpg\",\"quantity\":\"2\"},{\"productName\":\"Nido +1 Milk Powder 145Gm\",\"productPrice\":\"70.0\",\"imageUrl\":\"https://misr-online.com/media/catalog/product/cache/f4c520eccbadb01ffa4ab0fe869fee93/4/3/438219_3.jpg\",\"quantity\":\"2\"},{\"productName\":\"Johnson Baby Oil 200Ml\",\"productPrice\":\"72.0\",\"imageUrl\":\"https://misr-online.com/media/catalog/product/cache/f4c520eccbadb01ffa4ab0fe869fee93/0/9/090933_452078.jpg\",\"quantity\":\"1\"}]"
    },
    {
      "ID": "#728097",
      "Created": "28/10/2023",
      "Qty": 3,
      "Price": 976.0,
      "Status": "Pending",
      "cartItems":
          "[{\"productName\":\"Accu Chek Instant Test Strips 50 Strips\",\"productPrice\":\"420.0\",\"imageUrl\":\"https://misr-online.com/media/catalog/product/cache/f4c520eccbadb01ffa4ab0fe869fee93/0/9/093538_303539.jpg\",\"quantity\":\"2\"},{\"productName\":\"One Touch Delica 100 Lancet\",\"productPrice\":\"136.0\",\"imageUrl\":\"https://misr-online.com/media/catalog/product/cache/f4c520eccbadb01ffa4ab0fe869fee93/0/9/091400_303307.jpg\",\"quantity\":\"1\"}]"
    },
    {
      "ID": "#399669",
      "Created": "28/10/2023",
      "Qty": 3,
      "Price": 359.0,
      "Status": "Rejected",
      "cartItems":
          "[{\"productName\":\"Utrocare 100Mg 30 Capsules\",\"productPrice\":\"54.0\",\"imageUrl\":\"https://misr-online.com/media/catalog/product/cache/f4c520eccbadb01ffa4ab0fe869fee93/0/8/085554_111097.jpg\",\"quantity\":\"1\"},{\"productName\":\"Dostilact 0.5Mg 2 Tablets\",\"productPrice\":\"36.0\",\"imageUrl\":\"https://misr-online.com/media/catalog/product/cache/f4c520eccbadb01ffa4ab0fe869fee93/0/8/085758_123528.jpg\",\"quantity\":\"1\"},{\"productName\":\"Duphaston 10Mg 60 Tablets\",\"productPrice\":\"269.0\",\"imageUrl\":\"https://misr-online.com/media/catalog/product/cache/f4c520eccbadb01ffa4ab0fe869fee93/0/9/094721_115649.jpg\",\"quantity\":\"1\"}]"
    },
    {
      "ID": "#316806",
      "Created": "28/10/2023",
      "Qty": 3,
      "Price": 146.8,
      "Status": "Delivered",
      "cartItems":
          "[{\"productName\":\"Conjyclear 1Mg/Ml Eye Drops 5Ml\",\"productPrice\":\"16.8\",\"imageUrl\":\"https://misr-online.com/media/catalog/product/cache/f4c520eccbadb01ffa4ab0fe869fee93/0/9/094545_109518.jpg\",\"quantity\":\"1\"},{\"productName\":\"Johnson Baby Oil 75Ml\",\"productPrice\":\"35.0\",\"imageUrl\":\"https://misr-online.com/media/catalog/product/cache/f4c520eccbadb01ffa4ab0fe869fee93/0/9/090933_452093.jpg\",\"quantity\":\"1\"},{\"productName\":\"Diapella Soothing Baby Cream 125Gm\",\"productPrice\":\"95.0\",\"imageUrl\":\"https://misr-online.com/media/catalog/product/cache/f4c520eccbadb01ffa4ab0fe869fee93/1/1/112440_124153.jpg\",\"quantity\":\"1\"}]"
    },
    {
      "ID": "#202919",
      "Created": "28/10/2023",
      "Qty": 3,
      "Price": 521.5,
      "Status": "Out for delivery",
      "cartItems":
          "[{\"productName\":\"Dixy Oral Syringe 5Ml\",\"productPrice\":\"4.0\",\"imageUrl\":\"https://misr-online.com/media/catalog/product/cache/f4c520eccbadb01ffa4ab0fe869fee93/0/9/094638_300455.jpg\",\"quantity\":\"1\"},{\"productName\":\"Baby Steps (1) Goat Milk Powder 300Gm\",\"productPrice\":\"485.0\",\"imageUrl\":\"https://misr-online.com/media/catalog/product/cache/f4c520eccbadb01ffa4ab0fe869fee93/1/2/122305_3.jpg\",\"quantity\":\"1\"},{\"productName\":\"Dexamethasone (Mup) 8Mg 2Ml 5 Amp\",\"productPrice\":\"32.5\",\"imageUrl\":\"https://misr-online.com/media/catalog/product/cache/f4c520eccbadb01ffa4ab0fe869fee93/1/5/155737_122100.jpg\",\"quantity\":\"1\"}]"
    }
  ];

  int calcPending() {
    int total = 0;
    for (var order in mockOrders) {
      if (order["Status"] == 'Pending') {
        total++;
      }
    }
    return total;
  }

  int calcApproved() {
    int total = 0;
    for (var order in mockOrders) {
      if (order["Status"] == 'Approved') {
        total++;
      }
    }
    return total;
  }

  int calcRejected() {
    int total = 0;
    for (var order in mockOrders) {
      if (order["Status"] == 'Rejected') {
        total++;
      }
    }
    return total;
  }

  int calcOutForDeleivry() {
    int total = 0;
    for (var order in mockOrders) {
      if (order["Status"] == 'Out for delivery') {
        total++;
      }
    }
    return total;
  }

  int calcReady() {
    int total = 0;
    for (var order in mockOrders) {
      if (order["Status"] == 'Ready') {
        total++;
      }
    }
    return total;
  }

  int calcCancelled() {
    int total = 0;
    for (var order in mockOrders) {
      if (order["Status"] == 'Cancelled') {
        total++;
      }
    }
    return total;
  }

  int calcDelevired() {
    int total = 0;
    for (var order in mockOrders) {
      if (order["Status"] == 'Delivered') {
        total++;
      }
    }
    return total;
  }

  void addOrder(Map<String, dynamic> o) {
    mockOrders.add(o);
    print(jsonEncode(mockOrders));

    emit(PastOrdersState());
  }

  int findOrder(String query) {
    return mockOrders.indexWhere((element) => element["ID"] == query);
  }
}

class Order {
  String id;
  String created;
  double totalPrice;
  int qty;
  String status;
  List<Map<String, dynamic>> cartItems;

  Order(this.id, this.created, this.totalPrice, this.qty, this.status,
      this.cartItems);

  void printOrderDetails() {
    print('Order ID: $id');
    print('Created Date: $created');
    print('Total Price: $totalPrice');
    print('Quantity: $qty');
    print('Status: $status');
    print('Cart Items:');
    for (var item in cartItems) {
      print('  Product Name: ${item["productName"]}');
      print('  Product Price: ${item["productPrice"]}');
      print('  Quantity: ${item["quantity"]}');
      print('  Image URL: ${item["imageUrl"]}');
      print('**************************');
    }
  }
}
//final List<Map<String, dynamic>> mockOrders = [
//     {
//       "ID": "#389787",
//       "Created": "28/10/2023",
//       "Qty": 1,
//       "Price": 443.5,
//       "Status": "Approved",
//       "cartItems":
//           "[{\"productName\":\"Accu Fine Insulin Pen Needles 5Mm 100 Pieces\",\"productPrice\":\"443.5\",\"imageUrl\":\"https://misr-online.com/media/catalog/product/cache/f4c520eccbadb01ffa4ab0fe869fee93/1/5/155659_304298.jpg\",\"quantity\":\"1\"}]"
//     },
//     {
//       "ID": "#781708",
//       "Created": "28/10/2023",
//       "Qty": 12,
//       "Price": 3442.0,
//       "Status": "Cancelled",
//       "cartItems":
//           "[{\"productName\":\"Accu Chek Performa Test Strips 50 Strips\",\"productPrice\":\"396.0\",\"imageUrl\":\"https://misr-online.com/media/catalog/product/cache/f4c520eccbadb01ffa4ab0fe869fee93/0/9/093538_300012.jpg\",\"quantity\":\"3\"},{\"productName\":\"Accu Chek Guide Me 50 Strip\",\"productPrice\":\"430.0\",\"imageUrl\":\"https://misr-online.com/media/catalog/product/cache/f4c520eccbadb01ffa4ab0fe869fee93/1/2/122319_304768.jpg\",\"quantity\":\"1\"},{\"productName\":\"Syringe Insulin 100Iu 1Ml\",\"productPrice\":\"5.0\",\"imageUrl\":\"https://misr-online.com/media/catalog/product/cache/f4c520eccbadb01ffa4ab0fe869fee93/0/9/093213_300452.jpg\",\"quantity\":\"1\"},{\"productName\":\"Accu Chek Active Test Strips 50 Strips\",\"productPrice\":\"360.0\",\"imageUrl\":\"https://misr-online.com/media/catalog/product/cache/f4c520eccbadb01ffa4ab0fe869fee93/1/4/144455_300006.jpg\",\"quantity\":\"2\"},{\"productName\":\"Accu Fine Insulin Pen Needles 5Mm 100 Pieces\",\"productPrice\":\"443.5\",\"imageUrl\":\"https://misr-online.com/media/catalog/product/cache/f4c520eccbadb01ffa4ab0fe869fee93/1/5/155659_304298.jpg\",\"quantity\":\"2\"},{\"productName\":\"Nido +1 Milk Powder 145Gm\",\"productPrice\":\"70.0\",\"imageUrl\":\"https://misr-online.com/media/catalog/product/cache/f4c520eccbadb01ffa4ab0fe869fee93/4/3/438219_3.jpg\",\"quantity\":\"2\"},{\"productName\":\"Johnson Baby Oil 200Ml\",\"productPrice\":\"72.0\",\"imageUrl\":\"https://misr-online.com/media/catalog/product/cache/f4c520eccbadb01ffa4ab0fe869fee93/0/9/090933_452078.jpg\",\"quantity\":\"1\"}]"
//     },
//     {
//       "ID": "#728097",
//       "Created": "28/10/2023",
//       "Qty": 3,
//       "Price": 976.0,
//       "Status": "Pending",
//       "cartItems":
//           "[{\"productName\":\"Accu Chek Instant Test Strips 50 Strips\",\"productPrice\":\"420.0\",\"imageUrl\":\"https://misr-online.com/media/catalog/product/cache/f4c520eccbadb01ffa4ab0fe869fee93/0/9/093538_303539.jpg\",\"quantity\":\"2\"},{\"productName\":\"One Touch Delica 100 Lancet\",\"productPrice\":\"136.0\",\"imageUrl\":\"https://misr-online.com/media/catalog/product/cache/f4c520eccbadb01ffa4ab0fe869fee93/0/9/091400_303307.jpg\",\"quantity\":\"1\"}]"
//     },
//     {
//       "ID": "#399669",
//       "Created": "28/10/2023",
//       "Qty": 3,
//       "Price": 359.0,
//       "Status": "Rejected",
//       "cartItems":
//           "[{\"productName\":\"Utrocare 100Mg 30 Capsules\",\"productPrice\":\"54.0\",\"imageUrl\":\"https://misr-online.com/media/catalog/product/cache/f4c520eccbadb01ffa4ab0fe869fee93/0/8/085554_111097.jpg\",\"quantity\":\"1\"},{\"productName\":\"Dostilact 0.5Mg 2 Tablets\",\"productPrice\":\"36.0\",\"imageUrl\":\"https://misr-online.com/media/catalog/product/cache/f4c520eccbadb01ffa4ab0fe869fee93/0/8/085758_123528.jpg\",\"quantity\":\"1\"},{\"productName\":\"Duphaston 10Mg 60 Tablets\",\"productPrice\":\"269.0\",\"imageUrl\":\"https://misr-online.com/media/catalog/product/cache/f4c520eccbadb01ffa4ab0fe869fee93/0/9/094721_115649.jpg\",\"quantity\":\"1\"}]"
//     },
//     {
//       "ID": "#316806",
//       "Created": "28/10/2023",
//       "Qty": 3,
//       "Price": 146.8,
//       "Status": "Delivered",
//       "cartItems":
//           "[{\"productName\":\"Conjyclear 1Mg/Ml Eye Drops 5Ml\",\"productPrice\":\"16.8\",\"imageUrl\":\"https://misr-online.com/media/catalog/product/cache/f4c520eccbadb01ffa4ab0fe869fee93/0/9/094545_109518.jpg\",\"quantity\":\"1\"},{\"productName\":\"Johnson Baby Oil 75Ml\",\"productPrice\":\"35.0\",\"imageUrl\":\"https://misr-online.com/media/catalog/product/cache/f4c520eccbadb01ffa4ab0fe869fee93/0/9/090933_452093.jpg\",\"quantity\":\"1\"},{\"productName\":\"Diapella Soothing Baby Cream 125Gm\",\"productPrice\":\"95.0\",\"imageUrl\":\"https://misr-online.com/media/catalog/product/cache/f4c520eccbadb01ffa4ab0fe869fee93/1/1/112440_124153.jpg\",\"quantity\":\"1\"}]"
//     },
//     {
//       "ID": "#202919",
//       "Created": "28/10/2023",
//       "Qty": 3,
//       "Price": 521.5,
//       "Status": "Out for delivery",
//       "cartItems":
//           "[{\"productName\":\"Dixy Oral Syringe 5Ml\",\"productPrice\":\"4.0\",\"imageUrl\":\"https://misr-online.com/media/catalog/product/cache/f4c520eccbadb01ffa4ab0fe869fee93/0/9/094638_300455.jpg\",\"quantity\":\"1\"},{\"productName\":\"Baby Steps (1) Goat Milk Powder 300Gm\",\"productPrice\":\"485.0\",\"imageUrl\":\"https://misr-online.com/media/catalog/product/cache/f4c520eccbadb01ffa4ab0fe869fee93/1/2/122305_3.jpg\",\"quantity\":\"1\"},{\"productName\":\"Dexamethasone (Mup) 8Mg 2Ml 5 Amp\",\"productPrice\":\"32.5\",\"imageUrl\":\"https://misr-online.com/media/catalog/product/cache/f4c520eccbadb01ffa4ab0fe869fee93/1/5/155737_122100.jpg\",\"quantity\":\"1\"}]"
//     }
//   ];
