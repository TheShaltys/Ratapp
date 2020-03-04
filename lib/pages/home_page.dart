import 'package:ratapp/fragments/about_fragment.dart';
import 'package:ratapp/fragments/home_fragment.dart';
import 'package:ratapp/fragments/photogallery_fragment.dart';
import 'package:ratapp/fragments/events_fragment.dart';
import 'package:ratapp/fragments/contact_fragment.dart';
import 'package:flutter/material.dart';

class DrawerItem{
  String title;
  IconData icon;
  DrawerItem(this.title, this.icon);
}

class HomePage extends StatefulWidget {
  final drawerItems = [
    new DrawerItem("Domů", Icons.home),
    new DrawerItem("O nás", Icons.message),
    new DrawerItem("Akce", Icons.calendar_today),
    new DrawerItem("Fotogalerie", Icons.photo_library),
    new DrawerItem("Kontakt", Icons.info)
  ];

  @override
  State<StatefulWidget> createState() {
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  int _selectedDrawerIndex = 0;

  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return new HomeFragment();
      case 1:
        return new AboutFragment();
      case 2:
        return new EventsFragment();
      case 3:
        return new PhotogalleryFragment();
      case 4:
        return new ContactFragment();

      default:
        return new Text("Error");
    }
  }
  


  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: new AppBar(
        title: _getResizedImage("assets/logo.png", 100, 50),
        backgroundColor: _hexToColor('#002A3D'),
      ),
      drawer: new Drawer(
        child: new Column(
          children: <Widget>[
            Container(
              color: _hexToColor('#002A3D'),
              child: Image.asset("assets/drawer.jpg"),
            ),
            new Column(children: _changeSelectedItem(widget.drawerItems, widget.drawerItems.length, _selectedDrawerIndex))
          ],
        ),
      ),
      body: _getDrawerItemWidget(_selectedDrawerIndex),
    );
  }
  
  _onSelectItem(int index) {
    setState(() => _selectedDrawerIndex = index);
    Navigator.of(context).pop(); // close the drawer
  }

  List<Widget> _changeSelectedItem(List<DrawerItem> widgetItems, int itemsCount, int selectedIndex){
    List<Widget> options = [];
    DrawerItem d;
    for (var i = 0; i < itemsCount; i++) {
      d = widgetItems[i];

      if(i == selectedIndex){
        options.add(
          Container(
            color: _hexToColor('#002A3D'),
            child: ListTile(
              leading: Icon(
                  d.icon,
                  color: Colors.white,
                ),
              title: new Text(
                  d.title,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              selected: i == selectedIndex,
              onTap: () {
                _onSelectItem(i);
              },
            ),
          )
        );
      }
      else{
        options.add(
          Container(
            color: Colors.white,
            child: ListTile(
              leading: Icon(
                  d.icon,
                  color: _hexToColor('#002A3D'),
                ),
              title: Text(
                  d.title,
                  style: TextStyle(
                    color: _hexToColor('#002A3D'),
                  ),
                ),
              selected: i == selectedIndex,
              onTap: () {
                _onSelectItem(i);
              }
            ),
          )
        );
      }
    }
    return options;
  }
  
  Image _getResizedImage(String path, double _width, double _height){
  return new Image(
    image: new ExactAssetImage(path),
    height: _height,
    width: _width,
    alignment: FractionalOffset.center,
    );
  }

  Color _hexToColor(String code) {
      return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }
}



