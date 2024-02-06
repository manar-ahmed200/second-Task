import 'package:flutter/material.dart';

import '../../service/categories_service.dart';
import '../../shared/components/item_card_widget.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  bool isLoading = true;
  List<dynamic> productList = [];

  Future<void> getData() async {
    productList = await CategoriesService.getProductsData();
    isLoading = false;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Center(
      child: CircularProgressIndicator(),
    )
        : ListView.builder(
      itemCount: productList.length,
      itemBuilder: (BuildContext context, int index) {
        return ItemCard(
          productName: productList[index].title ?? "--",
          price: "${productList[index].price}",
          thumbnail: productList[index].thumbnail ?? "",
        );
      },
    );
  }
}
