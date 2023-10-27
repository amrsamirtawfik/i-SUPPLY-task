class Product {
  String name;
  String imageUrl;
  double price;

  Product({
    required this.name,
    required this.imageUrl,
    required this.price,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'imageUrl': imageUrl,
      'price': price,
    };
  }
}

Map<String, List<Product>> productsMockData = {
  "Diabetes care": [
    Product(
        name: "Accu Chek Active Test Strips 50 Strips",
        imageUrl:
            'https://misr-online.com/media/catalog/product/cache/f4c520eccbadb01ffa4ab0fe869fee93/1/4/144455_300006.jpg',
        price: 360),
    Product(
        name: "Accu Chek Performa Test Strips 50 Strips",
        imageUrl:
            "https://misr-online.com/media/catalog/product/cache/f4c520eccbadb01ffa4ab0fe869fee93/0/9/093538_300012.jpg",
        price: 396),
    Product(
        name: "Accu Chek Guide Me 50 Strip",
        imageUrl:
            "https://misr-online.com/media/catalog/product/cache/f4c520eccbadb01ffa4ab0fe869fee93/1/2/122319_304768.jpg",
        price: 430),
    Product(
        name: "Syringe Insulin 100Iu 1Ml",
        imageUrl:
            "https://misr-online.com/media/catalog/product/cache/f4c520eccbadb01ffa4ab0fe869fee93/0/9/093213_300452.jpg",
        price: 5.00),
    Product(
        name: "Syringe Infant 3Ml",
        imageUrl:
            "https://misr-online.com/media/catalog/product/cache/f4c520eccbadb01ffa4ab0fe869fee93/1/6/160319_300441.jpg",
        price: 3.50),
    Product(
        name: "Syringe 10Ml",
        imageUrl:
            "https://misr-online.com/media/catalog/product/cache/f4c520eccbadb01ffa4ab0fe869fee93/0/9/093212_300440.jpg",
        price: 4.00),
    Product(
        name: "Contour Plus One Bg Monitor+5 Strips",
        imageUrl:
            "https://misr-online.com/media/catalog/product/cache/f4c520eccbadb01ffa4ab0fe869fee93/1/5/155915_304339.jpg",
        price: 295.00),
    Product(
        name: "One Touch Select Plus Flex Device",
        imageUrl:
            "https://misr-online.com/media/catalog/product/cache/f4c520eccbadb01ffa4ab0fe869fee93/1/5/155824_304337.jpg",
        price: 350.00),
    Product(
        name: "Accu Fine Insulin Pen Needles 5Mm 100 Pieces",
        imageUrl:
            "https://misr-online.com/media/catalog/product/cache/f4c520eccbadb01ffa4ab0fe869fee93/1/5/155659_304298.jpg",
        price: 443.50),
    Product(
        name: "Accu Chek Instant Test Strips 50 Strips",
        imageUrl:
            "https://misr-online.com/media/catalog/product/cache/f4c520eccbadb01ffa4ab0fe869fee93/0/9/093538_303539.jpg",
        price: 420.00),
    Product(
        name: "One Touch Delica 100 Lancet",
        imageUrl:
            "https://misr-online.com/media/catalog/product/cache/f4c520eccbadb01ffa4ab0fe869fee93/0/9/091400_303307.jpg",
        price: 136.00),
    Product(
        name: "Medlance Plus Lite 25G 1.5Mm 200Pcs",
        imageUrl:
            "https://misr-online.com/media/catalog/product/cache/f4c520eccbadb01ffa4ab0fe869fee93/0/9/091205_301545.jpg",
        price: 550.00),
    Product(
        name: "Dixy Oral Syringe 5Ml",
        imageUrl:
            "https://misr-online.com/media/catalog/product/cache/f4c520eccbadb01ffa4ab0fe869fee93/0/9/094638_300455.jpg",
        price: 4.0),
    Product(
        name: "Dixy Oral Syringe 10Ml",
        imageUrl:
            "https://misr-online.com/media/catalog/product/cache/f4c520eccbadb01ffa4ab0fe869fee93/0/9/094638_300453.jpg",
        price: 8.00),
  ],
  "Baby nutrition": [
    Product(
        name: "Nido +1 Milk Powder 145Gm",
        imageUrl:
            "https://misr-online.com/media/catalog/product/cache/f4c520eccbadb01ffa4ab0fe869fee93/4/3/438219_3.jpg",
        price: 70.00),
    Product(
        name: "Hero Baby Jar Prunes 130Gm",
        imageUrl:
            "https://misr-online.com/media/catalog/product/cache/f4c520eccbadb01ffa4ab0fe869fee93/0/9/095319_420677.jpg",
        price: 25.00),
    Product(
        name: "Hero Baby N Cereal Rice&Corn 150Gm",
        imageUrl:
            "https://misr-online.com/media/catalog/product/cache/f4c520eccbadb01ffa4ab0fe869fee93/0/8/084717_409592.jpg",
        price: 39.00),
    Product(
        name: "Baby Steps (1) Goat Milk Powder 300Gm",
        imageUrl:
            "https://misr-online.com/media/catalog/product/cache/f4c520eccbadb01ffa4ab0fe869fee93/1/2/122305_3.jpg",
        price: 485.00),
  ],
  "Baby Bathing Care": [
    Product(
        name: "Diapella Soothing Baby Cream 125Gm",
        imageUrl:
            "https://misr-online.com/media/catalog/product/cache/f4c520eccbadb01ffa4ab0fe869fee93/1/1/112440_124153.jpg",
        price: 95.00),
    Product(
        name: "Johnson Baby Oil 75Ml",
        imageUrl:
            "https://misr-online.com/media/catalog/product/cache/f4c520eccbadb01ffa4ab0fe869fee93/0/9/090933_452093.jpg",
        price: 35.00),
    Product(
        name: "Johnson Baby Oil 200Ml",
        imageUrl:
            "https://misr-online.com/media/catalog/product/cache/f4c520eccbadb01ffa4ab0fe869fee93/0/9/090933_452078.jpg",
        price: 72.00),
    Product(
        name: "Johnson Baby Shampoo 500Ml",
        imageUrl:
            "https://misr-online.com/media/catalog/product/cache/f4c520eccbadb01ffa4ab0fe869fee93/0/9/090934_452082.jpg",
        price: 100.0),
    Product(
        name: "Penduline Baby Body Lotion 200Ml",
        imageUrl:
            "https://misr-online.com/media/catalog/product/cache/f4c520eccbadb01ffa4ab0fe869fee93/1/5/151909_454927.jpg",
        price: 110.0)
  ],
  "Hormones": [
    Product(
        name: "Duphaston 10Mg 60 Tablets",
        imageUrl:
            "https://misr-online.com/media/catalog/product/cache/f4c520eccbadb01ffa4ab0fe869fee93/0/9/094721_115649.jpg",
        price: 269.00),
    Product(
        name: "Dostilact 0.5Mg 2 Tablets",
        imageUrl:
            "https://misr-online.com/media/catalog/product/cache/f4c520eccbadb01ffa4ab0fe869fee93/0/8/085758_123528.jpg",
        price: 36.00),
    Product(
        name: "Utrocare 100Mg 30 Capsules",
        imageUrl:
            "https://misr-online.com/media/catalog/product/cache/f4c520eccbadb01ffa4ab0fe869fee93/0/8/085554_111097.jpg",
        price: 54.00),
    Product(
        name: "Dexamethasone (Mup) 8Mg 2Ml 5 Amp",
        imageUrl:
            "https://misr-online.com/media/catalog/product/cache/f4c520eccbadb01ffa4ab0fe869fee93/1/5/155737_122100.jpg",
        price: 32.50),
    Product(
        name: "Omegapress 0.2Mg 30 Tablets",
        imageUrl:
            "https://misr-online.com/media/catalog/product/cache/f4c520eccbadb01ffa4ab0fe869fee93/0/9/091359_121217.jpg",
        price: 240.00),
    Product(
        name: "Glomethasone 8Mg/2Ml 3 Ampoule",
        imageUrl:
            "https://misr-online.com/media/catalog/product/cache/f4c520eccbadb01ffa4ab0fe869fee93/0/9/095153_121017.jpg",
        price: 45.00),
  ],
  "Eye & ear": [
    Product(
        name: "Conjyclear 1Mg/Ml Eye Drops 5Ml",
        imageUrl:
            "https://misr-online.com/media/catalog/product/cache/f4c520eccbadb01ffa4ab0fe869fee93/0/9/094545_109518.jpg",
        price: 16.80),
    Product(
        name: "Polyfresh 0.2% Eye Drops 10Ml",
        imageUrl:
            "https://misr-online.com/media/catalog/product/cache/f4c520eccbadb01ffa4ab0fe869fee93/1/5/155658_122004.jpg",
        price: 47.00)
  ],
  "Shaving tools": [
    Product(
        name: "Gillette Fusion Blades 8 Pieces",
        imageUrl:
            "https://misr-online.com/media/catalog/product/cache/f4c520eccbadb01ffa4ab0fe869fee93/1/2/121007_410719.jpg",
        price: 1069.54),
    Product(
        name: "Nivea Men Shaving Gel Deep Clean 200Ml",
        imageUrl:
            "https://misr-online.com/media/catalog/product/cache/f4c520eccbadb01ffa4ab0fe869fee93/0/9/091321_451159.jpg",
        price: 200.0),
    Product(
        name: 'Shave Code Gel Sensitive Skin150Ml',
        imageUrl:
            "https://misr-online.com/media/catalog/product/cache/f4c520eccbadb01ffa4ab0fe869fee93/0/9/093054_419962.jpg",
        price: 45.00)
  ]
};

