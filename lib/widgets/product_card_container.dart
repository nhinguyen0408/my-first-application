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
          SizedBox(
            width: 56,
            height: 56,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: item.mediaData.isEmpty ? Image.asset('') : Image.network(item.mediaData[0].image, fit: BoxFit.cover)
            ),
          ),

          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8),
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.title,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                    const SizedBox(
                      height: 12,
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
            ),
          )
        ],
      ),
    );
  }
}