import 'package:flutter/material.dart';
import 'package:item_exchange/Model/postModel.dart';
import 'package:item_exchange/repositories/postRepository.dart';

class PostViewModel with ChangeNotifier {
  final PostRepository _repository = PostRepository();

  Post _post = Post();
  Post get post => _post;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> postItem() async {
    _isLoading = true;
    notifyListeners();

    try {
      await _repository.postItem(_post);
    } catch (e) {
      print("Error posting item: $e");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void updateProductName(String value) {
    _post.productName = value;
    notifyListeners();
  }

  void updateDescription(String value) {
    _post.description = value;
    notifyListeners();
  }

  void updateCategory(String value) {
    _post.category = value;
    notifyListeners();
  }

  void updateItemCondition(String value) {
    _post.itemCondition = value;
    notifyListeners();
  }

  void updateRemarks(String value) {
    _post.remarks = value;
    notifyListeners();
  }
}