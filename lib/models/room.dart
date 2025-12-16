class Room {
  String number;
  String type;
  double price;
  bool isavailable;

  Room({
    required this.number,
    required this.type,
    required this.price,
    this.isavailable = false,
  });
}
