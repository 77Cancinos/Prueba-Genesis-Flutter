import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CarouselPage extends StatelessWidget {
  final List<String> images = [
    'https://media.istockphoto.com/id/1411192496/es/foto/hermosa-joven-tomando-notas-mientras-aprende-desde-casa.jpg?s=2048x2048&w=is&k=20&c=DWNy2N9jSkzNXMfLyEywxDqCv4IQR06qLN3oHzYuK3s=',
    'https://media.istockphoto.com/id/1392902321/es/foto/vista-lateral-de-la-mujer-enfocada-en-escribir-tomando-notas-estudiando-en-l%C3%ADnea-en-la.jpg?s=2048x2048&w=is&k=20&c=gm5RwYvkaB58k49_jI-P767VVviNv0pazeM9L4ofRxo=',
    'https://cdn.pixabay.com/photo/2015/03/10/17/23/youtube-667451_1280.png',
    'https://images.ecestaticos.com/h34TvzTFVdrau9Un4Wdmwhed_e4=/0x115:2265x1390/1200x900/filters:fill(white):format(jpg)/f.elconfidencial.com%2Foriginal%2F8ec%2F08c%2F85c%2F8ec08c85c866ccb70c4f1c36492d890f.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 200.0,
        autoPlay: true,
      ),
      items: images.map((String imageUrl) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
