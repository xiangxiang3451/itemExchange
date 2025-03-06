import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            TextField(
              decoration: InputDecoration(
                hintText: 'Search...',
                contentPadding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0), // 内边距
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0), // 圆角
                  borderSide: const BorderSide(
                    color: Color.fromARGB(255, 253, 234, 215), // 默认边框颜色
                    width: 2.0, // 默认边框宽度
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0), // 圆角
                  borderSide: const BorderSide(
                    color: Color.fromARGB(255, 253, 234, 215), // 未聚焦时的边框颜色
                    width: 3.0, // 未聚焦时的边框宽度
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0), // 圆角
                  borderSide: const BorderSide(
                    color: Color.fromARGB(255, 253, 234, 215), // 聚焦时的边框颜色
                    width: 20.0, // 聚焦时的边框宽度
                  ),
                ),
                prefixIcon: const Icon(Icons.search),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Suggestion category',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Kitchen'),
                Text('Clothes'),
                Text('Cosmetic'),
              ],
            ),
            const SizedBox(height: 10),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Shoes'),
                Text('Dress'),
                Text('Shirt'),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'Map',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            // 这里可以添加更多的布局元素
          ],
        ),
      ),
    );
  }
}