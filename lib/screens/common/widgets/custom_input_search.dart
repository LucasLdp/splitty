import 'package:flutter/material.dart';

class CustomInputSearch extends StatelessWidget {
  final bool isOrdernable;

  const CustomInputSearch({super.key, this.isOrdernable = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: "Pesquisar",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(36),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
          ),
          if (isOrdernable) ...[
            const SizedBox(width: 16),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(36),
              ),
              child: const Icon(Icons.sort),
            ),
          ],
        ],
      ),
    );
  }
}
