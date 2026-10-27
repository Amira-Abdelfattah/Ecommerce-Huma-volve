import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class ShareProductButton extends StatelessWidget {
  final String productId;
  const ShareProductButton({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.9),
        shape: BoxShape.circle,
      ),
      child: IconButton(
        padding: EdgeInsets.zero,
        constraints: const BoxConstraints(),
        icon: const Icon(Icons.share, size: 18, color: Colors.black),
        onPressed: () async {
          final String shareMessage =
              "Look at this product: https://ecommerce-humavolve-app.web.app/products/$productId";
          await SharePlus.instance.share(ShareParams(text: shareMessage));
        },
      ),
    );
  }
}
