class Coffee3 {
  final String name;
  final String type;
  final String shortDesc;
  final String desc;
  final String image;
  final int rate;
  final int price;

  Coffee3(
      {this.name,
      this.type,
      this.shortDesc,
      this.desc,
      this.image,
      this.rate,
      this.price});
}

List<Coffee3> menu3 = [
  
  Coffee3(
      name: "Coklat Kenangan",
      type: "Hot/Cold",
      shortDesc: "Minuman coklat yang manis dan toping kue",
      desc:
          "Jika kamu penggemar coklat ini sangat cocok untuk anda, sedang kan anda yang sedang patah hati minuman ini tidak rekomendasi untuk anda karena banyak cerita di balik coklat yang anda berikan ke mantan:(",
      image: "assets/coklat.jpg",
      rate: 5,
      price: 22000),
  Coffee3(
      name: "Redvelvet",
      type: 'Hot/Cold',
      shortDesc: "Redvelvet, rasa tidak terlalu manis",
      desc:
          "Dengan rasa yang sedikit aga pahit seperti janji doi yang begitu pait wkwkwk",
      image: "assets/Redvelvet.png",
      rate: 5,
      price: 22000),
  Coffee3(
      name: "Green Tea",
      type: "Hot/Cold",
      shortDesc: "Matcha dengan susu full cream",
      desc:
          "Minuman ini dengan rasa aga pahit tidak cocok untuk anda yang jomblo di saat anda melihat kebahagian orang lain dengan pasangannya di caffe",
      image: "assets/Greentea.jpg",
      rate: 5,
      price: 12000),
  Coffee3(
      name: "Mojito",
      type: "Cold",
      shortDesc: "Soda segar + (lemon dan mint)",
      desc:
          "Ini cocok untuk anda yang sedang patah hati, dapat mengembalikan mood anda yang melihat pasangan anda dengan sahat yang anda kenal:(",
      image: "assets/mojito.jpeg",
      rate: 5,
      price: 15000),
];
