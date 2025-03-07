import 'package:flutter/material.dart';

class MessageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: 'Good morning!\n',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              TextSpan(
                text: 'Jennifer',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://gitee.com/chang-pengxiang/apk_test/raw/master/Avatar.png'),
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
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
          ),
          Expanded(
            child: ListView(
              children: const [
                ListTile(
                  leading: CircleAvatar(
                    child: Text('A'),
                  ),
                  title: Text('Albert Flores',style: TextStyle(fontWeight: FontWeight.bold),),
                  subtitle: Text(
                      'Juice Beauty Stem Cellular Anti-Wrinkle Solutions...'),
                  trailing: Text('2m ago',style: TextStyle(color:Color(0xFFF2625A) ),),
                ),
                ListTile(
                  leading: CircleAvatar(
                    child: Text('W'),
                  ),
                  title: Text('Wade Warren',style: TextStyle(fontWeight: FontWeight.bold),),
                  subtitle: Text(
                      'Glo Skin Beauty Bio-Renew EGF Cell Repairing Facial...'),
                  trailing: Text('2m ago',style: TextStyle(color:Color(0xFFF2625A) ),),
                ),
                ListTile(
                  leading: CircleAvatar(
                    child: Text('C'),
                  ),
                  title: Text('Courtney Henry',style: TextStyle(fontWeight: FontWeight.bold),),
                  subtitle: Text(
                      'Eltaxh UV Clear Facial Sunscreen Broad-Spectrum...'),
                  trailing: Text('2m ago'),
                ),
                ListTile(
                  leading: CircleAvatar(
                    child: Text('B'),
                  ),
                  title: Text('Brooklyn Simmons',style: TextStyle(fontWeight: FontWeight.bold),),
                  subtitle: Text(
                      'Fossil Women\'s Gen 5E 42mm Stainless Steel Touchscreen...'),
                  trailing: Text('2m ago'),
                ),
                ListTile(
                  leading: CircleAvatar(
                    child: Text('K'),
                  ),
                  title: Text('Kristin Watson',style: TextStyle(fontWeight: FontWeight.bold),),
                  subtitle: Text(
                      'BEAVO Set of 6 Mixed Pattern Foldable Womens Bag Purse...'),
                  trailing: Text('2m ago'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
