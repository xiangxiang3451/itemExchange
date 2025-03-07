import 'package:item_exchange/Model/postModel.dart';

class PostRepository {
  Future<void> postItem(Post post) async {
    // 模拟网络请求
    await Future.delayed(const Duration(seconds: 2));
    print("Item posted: ${post.productName}");
  }
}