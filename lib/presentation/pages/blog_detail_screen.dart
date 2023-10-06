// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:subspace/models/blog.dart';
import 'package:subspace/provider/provider.dart';

class BlogDetail extends StatefulWidget {
  Blogs blog;
   BlogDetail({
    Key? key,
    required this.blog,
  }) : super(key: key);

  @override
  _BlogDetailState createState() => _BlogDetailState();
}

class _BlogDetailState extends State<BlogDetail> {

  @override
  Widget build(BuildContext context) {
        final state = Provider.of<AppState>(context);
    bool isFavourite = state.favourites.contains(widget.blog);
    return Scaffold(
      appBar: AppBar(),
      body: Card(
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.network(
              widget.blog.imageUrl!,
              height: 200,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.blog.title!,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
             IconButton(
                onPressed: () {
                  state.toggleFavorite(widget.blog);
                },
                icon:isFavourite ?  Icon(
                  Icons.favorite ,
                  color: Colors.redAccent,
                ):Icon(Icons.favorite_border,color: Colors.redAccent,)),
          ],
        ),
      ),
    );
  }
}
