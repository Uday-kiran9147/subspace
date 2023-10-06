// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:subspace/models/blog.dart';
import 'package:subspace/presentation/pages/blog_detail_screen.dart';
import 'package:subspace/provider/provider.dart';

class BlogCard extends StatefulWidget {
  final Blogs blog;
  bool? isHomePage=false;
  BlogCard({
    Key? key,this.isHomePage,
    required this.blog,
  }) : super(key: key);

  @override
  State<BlogCard> createState() => _BlogCardState();
}

class _BlogCardState extends State<BlogCard> {
  @override
  Widget build(BuildContext context) {
    final state = Provider.of<AppState>(context);
    bool isFavourite = state.favourites.contains(widget.blog);
    return Stack(
      children: [
        Card(
          elevation: 4,
          margin: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              GestureDetector(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BlogDetail(
                        blog: widget.blog,
                      )
                    )),
                child: Image.network(
                  widget.blog.imageUrl!,
                  height: 200,
                  fit: BoxFit.cover,
                ),
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
            ],
          ),
        ),
       widget.isHomePage==true? Positioned(
            child: IconButton(
                onPressed: () {
                  state.toggleFavorite(widget.blog);
                },
                icon:isFavourite ?  Icon(
                  Icons.favorite ,
                  color: Colors.redAccent,
                ):Icon(Icons.favorite_border,color: Colors.redAccent,)),
            right: 20,
            bottom: 20):Container()
      ],
    );
  }
}
