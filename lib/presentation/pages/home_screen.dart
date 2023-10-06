import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:subspace/presentation/widgets/blogCard.dart';

import '../../provider/provider.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Provider.of<AppState>(context, listen: false).getData();
  }

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<AppState>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Subspace",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, FAVOURITES);
                },
                icon: Icon(Icons.favorite))
          ],
        ),
        body: state.blogModel != null
            ? ListView.builder(
                itemCount: state.blogModel!.blogs!.length,
                itemBuilder: (context, index) {
                  return BlogCard(
                    isHomePage: true,
                    blog: state.blogModel!.blogs![index],
                  );
                })
            : Center(
                child: CircularProgressIndicator(),
              ));
  }
}
