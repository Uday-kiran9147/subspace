// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:subspace/provider/provider.dart';

import '../widgets/blogCard.dart';

class FavouritesScreen extends StatefulWidget {
  const FavouritesScreen({
    Key? key,
    // required this.blogCubit,
  }) : super(key: key);

  @override
  State<FavouritesScreen> createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> {
//  final BlogCubit blogCubit;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<AppState>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('Favourites'),
        ),
        body: Column(
          children: [
            Text("You have ${state.favourites.length} favourites"),
            Expanded(
              child: ListView.builder(
                itemCount: state.favourites.length,
                itemBuilder: (context, index) {
                  return BlogCard(isHomePage: true,
                    blog: state.blogModel!.blogs![index],
                  );
                },
              ),
            ),
          ],
        ));
  }
}
