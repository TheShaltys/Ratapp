import 'package:http/http.dart';
import 'package:html/parser.dart';
import 'package:html/dom.dart';

Future getItems(String url) async {
  // Make API call to Hackernews homepage
  var client = Client();
  Response response = await client.get(url);

  // Use html parser
  var document = parse(response.body);
  List<Element> links = document.querySelectorAll('div.container > ul > li > a');
  List<Element> images = document.querySelectorAll('div.container > ul > li > a > img');
  List<Element> titles = document.querySelectorAll('div.container > ul > li > a > p');
  List<GalleryItem> itemList = [];

  for (int i = 0; i < links.length; i++) {
    itemList.add(
      new GalleryItem(
      'https://' + 'galerie.ratab.cz/' + (links[i].attributes['href']),
      'https://' + 'galerie.ratab.cz/' + (images[i].attributes['src']),
      (titles[i].text),
      )
    );
  }
  return itemList;
}

class GalleryItem{
  String linkUrl;
  String imageUrl;
  String title;
  
  GalleryItem(String linkUrl, String imageUrl, String title){
    this.linkUrl = linkUrl;
    this.imageUrl = imageUrl;
    this.title = title;
  }
}