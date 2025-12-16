import 'package:flutter/material.dart';
import '../models/room.dart';

class RoomProvider with ChangeNotifier {
  List<Room> _rooms = [];

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
