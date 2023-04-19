import 'package:checkbox_grouped/checkbox_grouped.dart';
import 'package:flutter/material.dart';
import 'package:uikit_form/model/country.dart';
import 'package:uikit_form/state_util.dart';
import '../view/home_view.dart';

class HomeController extends State<HomeView> implements MvcController {
  static late HomeController instance;
  late HomeView view;

  final userEditTextController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  GroupController controllerGroup = GroupController();
  GroupController multipleCheckController = GroupController(
    isMultipleSelection: true,
    // initSelectedItem: List.generate(5, (index) => index),
  );
  GroupController chipsController = GroupController(isMultipleSelection: true);

  Country? selectedItem;
  List<Country>? options;

  List<Country> dataList = [];
  Country? selectedValue;
  String defaultValue = 'N';

  @override
  void initState() {
    instance = this;
    super.initState();

    setState(() {
      // dataList = fetchData();
      // int index =
      //     dataList.indexWhere((country) => country.name == defaultValue);
      // selectedValue = dataList[index];
    });
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  List<Map<String, dynamic>> items = [
    {'id': 1, 'name': 'Item 1'},
    {'id': 2, 'name': 'Item 2'},
    {'id': 3, 'name': 'Item 3'},
  ];

  List<Map<String, dynamic>> countries = [
    {'label': 'Indonesia', 'value': 'ID'},
    {'label': 'United States', 'value': 'US'},
    {'label': 'United Kingdom', 'value': 'GB'},
    {'label': 'Germany', 'value': 'DE'},
    {'label': 'Japan', 'value': 'JP'},
    {'label': 'France', 'value': 'FR'},
    {'label': 'Canada', 'value': 'CA'},
    {'label': 'South Korea', 'value': 'KR'},
    {'label': 'Australia', 'value': 'AU'},
    {'label': 'Brazil', 'value': 'BR'},
  ];

  final List products = [
    {
      "id": 1,
      "photo":
          "https://i.ibb.co/dG68KJM/photo-1513104890138-7c749659a591-crop-entropy-cs-tinysrgb-fit-max-fm-jpg-ixid-Mnwy-ODA4-ODh8-MHwxf-H.jpg",
      "product_name": "Frenzy Pizza",
      "price": 25,
      "category": "Food",
      "description":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
    },
    {
      "id": 2,
      "photo":
          "https://i.ibb.co/mHtmhmP/photo-1521305916504-4a1121188589-crop-entropy-cs-tinysrgb-fit-max-fm-jpg-ixid-Mnwy-ODA4-ODh8-MHwxf-H.jpg",
      "product_name": "Beef Burger",
      "price": 22,
      "category": "Food",
      "description":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
    },
    {
      "id": 3,
      "photo":
          "https://images.unsplash.com/photo-1625869016774-3a92be2ae2cd?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
      "product_name": "Seperait",
      "price": 33,
      "category": "Drink",
      "description":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
    },
    {
      "id": 4,
      "photo":
          "https://images.unsplash.com/photo-1578160112054-954a67602b88?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80",
      "product_name": "Fried Rice",
      "price": 31,
      "category": "Food",
      "description":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
    },
    {
      "id": 5,
      "photo":
          "https://i.ibb.co/mHCx9Nj/photo-1517487881594-2787fef5ebf7-crop-entropy-cs-tinysrgb-fit-max-fm-jpg-ixid-Mnwy-ODA4-ODh8-MHwxf-H.jpg",
      "product_name": "Terrano Milk",
      "price": 32,
      "category": "Drink",
      "description":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
    },
    {
      "id": 6,
      "photo":
          "https://images.unsplash.com/photo-1626082927389-6cd097cdc6ec?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
      "product_name": "Fried Chicken",
      "price": 49,
      "category": "Food",
      "description":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
    },
    {
      "id": 7,
      "photo":
          "https://images.unsplash.com/photo-1525385133512-2f3bdd039054?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=685&q=80",
      "product_name": "Mango Juice",
      "price": 62,
      "category": "Drink",
      "description":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
    },
    {
      "id": 8,
      "photo":
          "https://images.unsplash.com/photo-1600271886742-f049cd451bba?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
      "product_name": "Orange Juice",
      "price": 56,
      "category": "Drink",
      "description":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
    },
    {
      "id": 9,
      "photo":
          "https://images.unsplash.com/photo-1604085792782-8d92f276d7d8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=764&q=80",
      "product_name": "Avocado Juice",
      "price": 56,
      "category": "Drink",
      "description":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
    },
    {
      "id": 10,
      "photo":
          "https://images.unsplash.com/photo-1622240506921-042a4e71c172?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
      "product_name": "Puncak Coffe",
      "price": 56,
      "category": "Drink",
      "description":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
    },
    {
      "id": 11,
      "photo":
          "https://images.unsplash.com/photo-1594631252845-29fc4cc8cde9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
      "product_name": "Silvana Tea",
      "price": 56,
      "category": "Drink",
      "description":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
    },
    {
      "id": 12,
      "photo":
          "https://images.unsplash.com/photo-1576092768241-dec231879fc3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
      "product_name": "Paradox Tea",
      "price": 56,
      "category": "Drink",
      "description":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
    },
  ];

  List<Map<String, dynamic>> itemsProduct = [];

  List<Map<String, dynamic>> getListProduct() {
    List productsFur = [
      {
        'id': 1,
        'product_name': 'Modern Sofa',
        'photo':
            "https://images.unsplash.com/photo-1578500494198-246f612d3b3d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
        'price': 500,
        'category': 'Living Room',
        'description': 'This modern sofa is perfect for your living room.'
      },
      {
        'id': 2,
        'product_name': 'Wooden Table',
        'photo':
            'https://images.unsplash.com/photo-1604074131665-7a4b13870ab4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
        'price': 200,
        'category': 'Dining Room',
        'description': 'This wooden table is perfect for your dining room.'
      },
      {
        'id': 3,
        'product_name': 'Bed Frame',
        'photo':
            'https://images.unsplash.com/photo-1505693416388-ac5ce068fe85?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
        'price': 300,
        'category': 'Bedroom',
        'description': 'This bed frame is perfect for your bedroom.'
      },
      {
        'id': 4,
        'product_name': 'Cabinet',
        'photo':
            'https://images.unsplash.com/photo-1601760561441-16420502c7e0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
        'price': 400,
        'category': 'Storage',
        'description': 'This cabinet is perfect for your storage.'
      },
      {
        'id': 5,
        'product_name': 'Rug',
        'photo':
            'https://images.unsplash.com/photo-1575414003591-ece8d0416c7a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=735&q=80',
        'price': 100,
        'category': 'Flooring',
        'description': 'This rug is perfect for your flooring.'
      },
      {
        'id': 6,
        'product_name': 'Lamp',
        'photo':
            'https://images.unsplash.com/photo-1543198126-a8ad8e47fb22?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
        'price': 50,
        'category': 'Lighting',
        'description': 'This lamp is perfect for your lighting.'
      },
      {
        'id': 7,
        'product_name': 'Mirror',
        'photo':
            'https://images.unsplash.com/photo-1618220252344-8ec99ec624b1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80',
        'price': 150,
        'category': 'Decoration',
        'description': 'This mirror is perfect for your decoration.'
      },
      {
        'id': 8,
        'product_name': 'Bookshelf',
        'photo':
            'https://images.unsplash.com/photo-1594620302200-9a762244a156?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1139&q=80',
        'price': 250,
        'category': 'Book Storage',
        'description': 'This bookshelf is perfect for your book storage.'
      },
      {
        'id': 9,
        'product_name': 'Chair',
        'photo':
            'https://images.unsplash.com/photo-1519947486511-46149fa0a254?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
        'price': 150,
        'category': 'Seating',
        'description': 'This chair is perfect for your seating.'
      },
      {
        'id': 10,
        'product_name': 'Cushion',
        'photo':
            'https://images.unsplash.com/photo-1579656381226-5fc0f0100c3b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=684&q=80',
        'price': 50,
        'category': 'Comfort',
        'description': 'This cushion is perfect for your comfort.'
      },
    ];

    for (var item in productsFur) {
      itemsProduct.add({
        "label": item['product_name'],
        "value": item['id'],
      });
    }

    return itemsProduct;
  }

  Map<String, dynamic>? currentValue() {
    var foundItems = getListProduct().where((i) => i["value"] == 10).toList();
    return foundItems.first;
  }

  // List<String> fruits = ['Apple', 'Banana', 'Orange', 'Mango'];
  // List<bool> checked = [false, false, false, false];
  // bool selectAll = false;

  // void changeSelectAll(bool value) {
  //   selectAll = value;
  //   checked = List.filled(checked.length, value);
  //   setState(() {});
  // }

  // void getCheckedList(bool value, int index) {
  //   checked[index] = value;
  //   if (!checked.contains(false)) {
  //     selectAll = true;
  //   } else {
  //     selectAll = false;
  //   }
  //   setState(() {});
  // }

  List<bool> isCheckedList = [false, false, false, false];
  bool isCheckedAll = false;

  void selectAll(bool value) {
    setState(() {
      isCheckedAll = value;
      isCheckedList = List.filled(isCheckedList.length, value);
    });
  }

  void checkList(index, value) {
    isCheckedList[index] = value;
    isCheckedAll = isCheckedList.every((isChecked) => isChecked);
    setState(() {});
  }

  List<String> listLanguageProgram = [
    'Flutter',
    'Dart',
    'Android',
    'iOS',
    'Kotlin',
    'Java',
    'React',
    'Vue',
    'Angular'
  ];
}
