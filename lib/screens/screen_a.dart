import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:my_application/api/product.api.dart';
import 'package:my_application/models/product.model.dart';
import 'package:my_application/widgets/product_card_container.dart';

// import '../routes/auto_router.dart';

@RoutePage()
class ScreenA extends StatefulWidget {
  const ScreenA({super.key});

  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<ScreenA> {
  List<Product>? listProducts;

  ProductApi productApi = ProductApi();
  Future<void> parseAPIResponse() async {
    final list = await productApi.getAll();
    setState(() {
      listProducts = list;
    });
  }

  @override
  void initState() {
    super.initState();
    parseAPIResponse();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen A'),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: (listProducts ?? []).map((e) {
          return Container(
            child: ProductCardContainer(item: e),
          );
        }).toList(),
      )
    );
  }
}
