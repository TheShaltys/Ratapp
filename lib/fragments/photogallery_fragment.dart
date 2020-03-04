import 'package:flutter/material.dart';
import 'package:ratapp/functions/galleryitem_function.dart' as _galleryItemFunction;

class PhotogalleryFragment extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return FutureBuilder(
      future: _galleryItemFunction.getItems('https://galerie.ratab.cz/'),
      builder: (context, snapshot){
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return Text('none');
          case ConnectionState.active:
            return Text('active');
          case ConnectionState.waiting:
            return LinearProgressIndicator();
          case ConnectionState.done:
            return buildDataStructure(snapshot.data);
        }
      },
    );
  }
}

Widget buildDataStructure(List<_galleryItemFunction.GalleryItem> data){
  return GridView.count(
    crossAxisCount: 3,
    children: List.generate(data.length, (index){
      return Stack(
        children: <Widget>[
          Image.network(data[index].imageUrl),//_getResizedImage(data[index].imageUrl, 100, 100),
          Container(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: Text(
              data[index].title,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 12,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                backgroundColor: _hexToColor('#002A3D'),
              ),
              ),
          ),
        ],
      );
    }),
  );
}

Image _getResizedImage(String path, double _width, double _height){
  return new Image(
    image: new NetworkImage(path),
    height: _height,
    width: _width,
    alignment: FractionalOffset.center,
    );
}

Color _hexToColor(String code) {
  return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
}
