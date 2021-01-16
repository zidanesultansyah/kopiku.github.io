class Coffee {
  final String name;
  final String type;
  final String shortDesc;
  final String desc;
  final String image;
  final int rate;
  final int price;

  Coffee(
      {this.name,
      this.type,
      this.shortDesc,
      this.desc,
      this.image,
      this.rate,
      this.price});
}

List<Coffee> menu2 = [
  Coffee(
      name: "CappucinoCingcau",
      type: "Cold",
      shortDesc: "Cappucino Dengan Toping Cingcau",
      desc:
          "Kalau kamu bosan dengan kopi yang monoton, Coffee Caooucino Cingcau adalah alternatif yang cocok untuk anda. Karena Cappucino Cingcau ini memiliki rasa yang menarik dan di badukan dengan minuman tradisional",
      image: "assets/cappucinocingcau.jpg",
      rate: 5,
      price: 22000),
  Coffee(
      name: "CaramelMacchiato",
      type: "Cold",
      shortDesc:
          "Macchiato dengan creamy vanila",
      desc:
          "Kalau kamu gak terlalu menikmati kopi yang cenderung pahit coffe ini cocok untuk anda karena memiliki caramel yang creamy",
      image: "assets/caramelmacchiato.jpg",
      rate: 5,
      price: 22000),
  Coffee(
      name: "Freappe",
      type: "Cold",
      shortDesc: "Kopi yang dipadukan es kocok serta susu",
      desc:
          "Anda dapat menikmati sensasi meminum kopi bersamaan dengan desert di dalam satu hidangan",
      image: "assets/kopifrappe.jpg",
      rate: 5,
      price: 12000),
  Coffee(
      name: "Latte",
      type: "Cold",
      shortDesc: "Kopi ekspresso yang diberi dengan susu",
      desc:
          "Kopi Latte sering kali di jumpai di semua caffe karena rasa yang sangat enak dan banyak di gemari oleh kaum milenial dan cocok untuk anda yang sedang berkumpul dengan sahabat kalian",
      image: "assets/kopilatte.jpg",
      rate: 5,
      price: 15000),
];
