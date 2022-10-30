import 'package:flutter/material.dart';

class InfoModel {
  const InfoModel({
    required this.url,
    this.shimmerBaseColor,
    this.shimmerHighlightColor,
    this.shimmerBackColor,
    this.errorWidget,
  });

  final String url;
  final Color? shimmerBaseColor;
  final Color? shimmerHighlightColor;
  final Color? shimmerBackColor;
  final Widget? errorWidget;
}

final dataRandom = <InfoModel>[
  const InfoModel(
    url:
        'https://www.bookdesignmadesimple.com/wp-content/uploads/2015/08/Chrysanthemum.jpg',
    shimmerBaseColor: Colors.red,
    shimmerHighlightColor: Colors.red,
    shimmerBackColor: Colors.red,
  ),
  const InfoModel(
    url:
        'https://www.bookdesignmadesimple.com/wp-content/uploads/2015/08/Chrysanthemum.jpg',
    shimmerBaseColor: Colors.red,
    shimmerHighlightColor: Colors.red,
    shimmerBackColor: Colors.red,
  ),
  const InfoModel(
    url:
        'https://www.bookdesignmadesimple.com/wp-content/uploads/2015/08/Chrysanthemum.jpg',
    shimmerBaseColor: Colors.red,
    shimmerHighlightColor: Colors.red,
    shimmerBackColor: Colors.red,
  ),
  const InfoModel(
    url:
        'https://www.bookdesignmadesimple.com/wp-content/uploads/2015/08/Chrysanthemum.jpg',
    shimmerBaseColor: Colors.red,
    shimmerHighlightColor: Colors.red,
    shimmerBackColor: Colors.red,
  ),
  const InfoModel(
    url:
        'https://www.bookdesignmadesimple.com/wp-content/uploads/2015/08/Chrysanthemum.jpg',
    shimmerBaseColor: Colors.red,
    shimmerHighlightColor: Colors.red,
    shimmerBackColor: Colors.red,
  ),
  const InfoModel(
    url:
        'https://www.bookdesignmadesimple.com/wp-content/uploads/2015/08/Chrysanthemum.jpg',
    shimmerBaseColor: Colors.red,
    shimmerHighlightColor: Colors.red,
    shimmerBackColor: Colors.red,
  ),
  const InfoModel(
    url:
        'https://www.bookdesignmadesimple.com/wp-content/uploads/2015/08/Chrysanthemum.jpg',
    shimmerBaseColor: Colors.red,
    shimmerHighlightColor: Colors.red,
    shimmerBackColor: Colors.red,
  ),
  const InfoModel(
    url:
        'https://www.bookdesignmadesimple.com/wp-content/uploads/2015/08/Chrysanthemum.jpg',
    shimmerBaseColor: Colors.red,
    shimmerHighlightColor: Colors.red,
    shimmerBackColor: Colors.red,
  ),
];

final dataDefault = <InfoModel>[
  const InfoModel(
    url:
        'https://static.businessinsider.sg/2018/12/12/5c1c90f8e04d6243c7019cf6.png',
  ),
  const InfoModel(
    url:
        'https://66.media.tumblr.com/6a4b9ac513b14406ce53c4ec5bea3244/tumblr_ojghm5engn1vehqeko1_400.jpg',
  ),
  const InfoModel(
    url:
        'https://images.pexels.com/photos/221433/pexels-photo-221433.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
  ),
  const InfoModel(
    url: 'http://eskipaper.com/images/high-resolution-backgrounds-22.jpg',
  ),
  const InfoModel(
    url:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSPYaZYxi_68IX_oHuNOI2-LQHy_PBWSLYpCWc6MSga842C1Dpe&s',
  ),
  const InfoModel(
    url:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQs6ZykmCD6SlkX7cmLv-0zR1M_iHZczaU8gPlZtEZiii0MFAE_&s',
  ),
  const InfoModel(
    url:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR4a1oj3Do9ajb7ac48K6TV3nPcWbnjZ_RuK91NflYfTnB8KsIlxg&s',
  ),
  const InfoModel(
    url:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSpOwkeMxA8_h55GsTgIrHy_u70_s-Emkra1HmNnkTi3HRDsnq6&s',
  ),
  const InfoModel(
    url:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTK1uGRnmrX8_h2_K8ddvBh2wdYWQNi5s1aSPl_FXPcg5aa7w5hQw&s',
  ),
  const InfoModel(
    url:
        'https://vastphotos.com/files/uploads/photos/10551/beautiful-mountain-photo-l.jpg',
  ),
  const InfoModel(
    url:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS5UplwcFSbcH9J2zjdTButF2ilEZ8vNzg68iYAhLTI0J8k2pKt&s',
  ),
  const InfoModel(
    url:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT_Q_rvjZ5ozyCrjxrOqWByQOE8ywaYGC792Bp0lbNnoIX_u9uJMg&s',
  ),
  const InfoModel(
    url:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTn0jtO81k-PA5QH7yQ3vgNDn1uesE4uCRHzUe6QLrvE24fhiC8tw&s',
  ),
  const InfoModel(
    url:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTGKYA2425OnOHzz1j7Ikvp6ArBZNvDf1Zlok4LXlfbAZm28k2o&s',
  ),
  const InfoModel(
    url:
        'https://www.bookdesignmadesimple.com/wp-content/uploads/2015/08/Chrysanthemum.jpg',
  ),
];

final dataDefaultError = <InfoModel>[
  InfoModel(
    url:
        'https://static.businessinsider.sg/2018/12/12/5c1c90f8e04d6243c7019cf6.pngg',
    errorWidget: Image.network(
        'https://i0.wp.com/www.dobitaobyte.com.br/wp-content/uploads/2016/02/no_image.png?ssl=1'),
  ),
  InfoModel(
    url:
        'https://66.media.tumblr.com/6a4b9ac513b14406ce53c4ec5bea3244/tumblr_ojghm5engn1vehqeko1_400.jpgg',
    errorWidget: Image.network(
        'https://i0.wp.com/www.dobitaobyte.com.br/wp-content/uploads/2016/02/no_image.png?ssl=1'),
  ),
  InfoModel(
    url:
        'https://images.pexels.com/photos/221433/pexels-photo-221433.jpeg?auto=compress&cs=tinysggggrgb&dpr=1&w=500gg',
    errorWidget: Image.network(
        'https://i0.wp.com/www.dobitaobyte.com.br/wp-content/uploads/2016/02/no_image.png?ssl=1'),
  ),
  InfoModel(
    url: 'http://eskipaper.com/images/high-resolution-backgrounds-22.jpg',
    errorWidget: Image.network(
        'https://i0.wp.com/www.dobitaobyte.com.br/wp-content/uploads/2016/02/no_image.png?ssl=1'),
  ),
  InfoModel(
    url:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSPYaZYxi_ggg68IX_oHuNOI2-LQHy_PBWSLYpCWc6MSga842C1Dpe&s',
    errorWidget: Image.network(
        'https://i0.wp.com/www.dobitaobyte.com.br/wp-content/uploads/2016/02/no_image.png?ssl=1'),
  ),
  InfoModel(
    url:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQs6ZykmCDggg6SlkX7cmLv-0zR1M_iHZczaU8gPlZtEZiii0MFAE_&s',
    errorWidget: Image.network(
        'https://i0.wp.com/www.dobitaobyte.com.br/wp-content/uploads/2016/02/no_image.png?ssl=1'),
  ),
  InfoModel(
    url:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR4a1oj3Dggo9ajb7ac48K6TV3nPcWbnjZ_RuK91NflYfTnB8KsIlxg&s',
    errorWidget: Image.network(
        'https://i0.wp.com/www.dobitaobyte.com.br/wp-content/uploads/2016/02/no_image.png?ssl=1'),
  ),
  InfoModel(
    url:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTn0jtO81k-PA5QH7yQ3vgNDn1uesE4uCRHzUe6QLrvE24fhiC8tw&s',
    errorWidget: Image.network(
        'https://i0.wp.com/www.dobitaobyte.com.br/wp-content/uploads/2016/02/no_image.png?ssl=1'),
  ),
  InfoModel(
    url:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTK1ggguGRnmrX8_h2_K8ddvBh2wdYWQNi5s1aSPl_FXPcg5aa7w5hQw&s',
    errorWidget: Image.network(
        'https://i0.wp.com/www.dobitaobyte.com.br/wp-content/uploads/2016/02/no_image.png?ssl=1'),
  ),
  InfoModel(
    url:
        'https://vastphotos.com/files/uploads/photos/1055ggg1/beautiful-mountain-photo-l.jpg',
    errorWidget: Image.network(
        'https://i0.wp.com/www.dobitaobyte.com.br/wp-content/uploads/2016/02/no_image.png?ssl=1'),
  ),
  InfoModel(
    url:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANggd9GcS5UplwcFSbcH9J2zjdTButF2ilEZ8vNzg68iYAhLTI0J8k2pKt&s',
    errorWidget: Image.network(
        'https://i0.wp.com/www.dobitaobyte.com.br/wp-content/uploads/2016/02/no_image.png?ssl=1'),
  ),
  InfoModel(
    url:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANdggg9GcT_Q_rvjZ5ozyCrjxrOqWByQOE8ywaYGC792Bp0lbNnoIX_u9uJMg&s',
    errorWidget: Image.network(
        'https://i0.wp.com/www.dobitaobyte.com.br/wp-content/uploads/2016/02/no_image.png?ssl=1'),
  ),
  InfoModel(
    url:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS5UplwcFSbcH9J2zjdTButF2ilEZ8vNzg68iYAhLTI0J8k2pKt&s',
    errorWidget: Image.network(
        'https://i0.wp.com/www.dobitaobyte.com.br/wp-content/uploads/2016/02/no_image.png?ssl=1'),
  ),
  InfoModel(
    url:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANggd9GcTGKYA2425OnOHzz1j7Ikvp6ArBZNvDf1Zlok4LXlfbAZm28k2o&s',
    errorWidget: Image.network(
        'https://i0.wp.com/www.dobitaobyte.com.br/wp-content/uploads/2016/02/no_image.png?ssl=1'),
  ),
  InfoModel(
    url:
        'https://www.bookdesignmadesimple.com/wp-ggg/uploads/2015/08/Chrysanthemum.jpg',
    errorWidget: Image.network(
        'https://i0.wp.com/www.dobitaobyte.com.br/wp-content/uploads/2016/02/no_image.png?ssl=1'),
  ),
];
