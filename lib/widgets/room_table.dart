import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/room_provider.dart';
import '../screens/add_edit_room.dart';

class RoomTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final roomProvider = Provider.of<RoomProvider>(context);

    return SingleChildScrollView(
      child: DataTable(
        columns: [
          DataColumn(label: Text('Number')),
          DataColumn(label: Text('Type')),
          DataColumn(label: Text('Price')),
          DataColumn(label: Text('Stauts')),
          DataColumn(label: Text('Actions')),
        ],
        rows: List.generate(roomProvider.rooms.length, (index) {
          final room = roomProvider.rooms[index];
          return DataRow(
            color: MaterialStateProperty.resolveWith<Color?>(
    (states) {
      if (!room.isavailable) {
        return const Color.fromARGB(255, 255, 205, 201).withOpacity(0.15); 
      }
      return null;
    },
  ),
            cells: [
              DataCell(Text(room.number)),
              DataCell(Text(room.type)),
              // DataCell(Text(room.price.toString())),
              DataCell(
  Text(
    '\$${room.price}',
    style: TextStyle(fontWeight: FontWeight.bold),
  ),
),

              DataCell(Text(room.isavailable ? 'Available' : 'Occupied')),
              DataCell(
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.edit, color: Colors.blue),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) =>
                                AddEditRoom(room: room, index: index),
                          ),
                        );
                      },
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.delete,
                        color: Colors.red, // اللون الأحمر
                      ),
                      onPressed: () {
                        // delete logic
                        roomProvider.deleteRoom(index);
                      },
                    ),
                  ],
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
