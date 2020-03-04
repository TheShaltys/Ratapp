import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomeFragment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView(
      children: <Widget>[
        Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: <Widget>[
              _generateCarousel(),
              Container(
                child: _getResizedImage('assets/home/teepee.png', 120, 60),
                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
              ),
              Image.asset('assets/home/ground.png'),
            ],
        ),
        Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: <Widget>[
            Image.asset('assets/home/fade.png'),
            Container(
              padding: EdgeInsets.fromLTRB(20, 40, 20, 75),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(
                    color: _hexToColor('#002A3D'),
                    fontSize: 20,
                  ),
                  children: <TextSpan>[
                    TextSpan(text: 'Co je to Ratab?', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
                    TextSpan(text: '\n\nRatab', style: TextStyle(decoration: TextDecoration.underline)),
                    TextSpan(text: ' je spolek organizující volnočasové a rozvojové aktivity pro mladé lidi, zejména pro středoškoláky a pro rodiny s dětmi.\n\nNaším cílem je spolupodílet se na budování moderní společnosti odolné vůči patologickým jevům, napomáhat individuálnímu růstu odpovědných, schopných a zdravě sebevědomých lidí.'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

Color _hexToColor(String code) {
  return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
}

Image _getResizedImage(String path, double _width, double _height){
  return new Image(
    image: new ExactAssetImage(path),
    height: _height,
    width: _width,
    alignment: FractionalOffset.center,
    );
}

Widget _generateCarousel(){
  return CarouselSlider(
          height: 209.0,
          viewportFraction: 1.0,
          items: <Widget>[
            Image.asset(
              'assets/home/1.jpg',
            ),
            Image.asset(
              'assets/home/2.jpg',
            ),
            Image.asset(
              'assets/home/3.jpg',
            ),
            Image.asset(
              'assets/home/4.jpg',
            ),
            Image.asset(
              'assets/home/5.jpg',
            ),
            Image.asset(
              'assets/home/6.jpg',
            ),
          ],
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 5),
        );
}