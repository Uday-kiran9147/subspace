import 'package:flutter/foundation.dart';
import 'package:subspace/data/api_Services.dart';
import '../models/blog.dart';

String FAVOURITES = '/favourites';

class AppState with ChangeNotifier {
  ApiService apiService = ApiService();

  BlogModel? blogModel;
  List<Blogs> _favourites = <Blogs>[];

  List<Blogs> get favourites => [..._favourites];

  void toggleFavorite(Blogs blog) {
    final Blogs CurrentBlog =
        blogModel!.blogs!.firstWhere((element) => element.id == blog.id);
    print(CurrentBlog == blog);
    if (_favourites.contains(CurrentBlog)) {
      _favourites.remove(CurrentBlog);
    } else {
      _favourites.add(CurrentBlog);
    }
    notifyListeners();
  }

  Future<void> getData() async {
    blogModel = await apiService.fetchBlogs();
    notifyListeners();
  }
}
