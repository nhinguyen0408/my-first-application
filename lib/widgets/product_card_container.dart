import 'package:flutter/material.dart';
import 'package:my_application/models/product.model.dart';

class ProductCardContainer extends StatelessWidget {
  final Product item;
  const ProductCardContainer({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
            ),
            child: item.mediaData.isEmpty ? Image.asset('') : Image.network(item.mediaData[0].image, fit: BoxFit.cover)
          ),

          Container(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Expanded(
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 8),
                    child: Text(
                      item.title,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(item.code),
                      Text(item.priceSell.toString())
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}