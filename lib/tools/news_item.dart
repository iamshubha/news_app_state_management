import 'package:flutter/material.dart';
import 'package:flutterapp/assets/url.dart';
import 'package:flutterapp/screen/details_screen.dart';

class NewsItem extends StatelessWidget {
  final String newsTitle;
  final String newsPoster;
  final String newsDescription;

  const NewsItem({
    Key key,
    @required this.newsTitle,
    @required this.newsPoster,
    @required this.newsDescription,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8.0,
        horizontal: 10.0,
      ),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 20.0,
        shadowColor: Colors.redAccent[100],
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => DetailsScreen(
                  image: newsPoster == null ? loadingImage : newsPoster,
                  title: newsTitle,
                  description: newsDescription,
                ),
              ),
            );
          },
          child: Container(
            width: 200.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                newsPoster == null
                    ? Image.network(
                        loadingImage,
                        scale: 2.5,
                      )
                    : Image.network(
                        newsPoster,
                      ),
                SizedBox(
                  height: 10.0,
                ),
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 3.0),
                    child: Text(
                      newsTitle,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.blueGrey[600],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
