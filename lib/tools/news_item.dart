import 'package:flutter/material.dart';

class NewsItem extends StatelessWidget {
  final String newsTitle;
  final String newsPoster;

  const NewsItem({
    Key key,
    @required this.newsTitle,
    @required this.newsPoster,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 20.0,
        child: Container(
          width: 200.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              newsPoster == null
                  ? Image.network(
                      'https://miro.medium.com/max/882/1*9EBHIOzhE1XfMYoKz1JcsQ.gif',
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
                      fontSize: 16.0,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
