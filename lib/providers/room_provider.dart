import 'package:flutter/material.dart';
import '../models/room.dart';

class RoomProvider with ChangeNotifier {
  List<Room> _rooms = [Room(
      number: '101',
      type: 'Single',
      price: 100,
      isavailable: true,
    ),
        Room(
      number: '102',
      type: 'Double',
      price: 150,
      isavailable: false,
    ),
    Room(
      number: '103',
      type: 'Suite',
      price: 250,
      isavailable: true,
    ),
      Room(
      number: '104',
      type: 'Single',
      price: 90,
      isavailable: false,
    ),
    ];

  List<Room> get rooms => _rooms;

  void addRoom(Room room) {
    _rooms.add(room);
    notifyListeners();
  }

  void updateRoom(int index, Room room) {
    _rooms[index] = room;
    notifyListeners();
  }

  void deleteRoom(int index) {
    _rooms.removeAt(index);
    notifyListeners();
  }
}
