import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/room.dart';
import '../providers/room_provider.dart';

class AddEditRoom extends StatefulWidget {
  final Room? room;
  final int? index;

  AddEditRoom({this.room, this.index});

  @override
  _AddEditRoomState createState() => _AddEditRoomState();
}

class _AddEditRoomState extends State<AddEditRoom> {
  final _formKey = GlobalKey<FormState>();
  late String number;
  late String type;
  late double price;
  bool isOccupied = false;

  @override
  void initState() {
    super.initState();
    if (widget.room != null) {
      number = widget.room!.number;
      type = widget.room!.type;
      price = widget.room!.price;
      isOccupied = widget.room!.isavailable;
    } else {
      number = '';
      type = '';
      price = 0.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    final roomProvider = Provider.of<RoomProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text(widget.room == null ? 'Add Room' : 'Edit Room')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                initialValue: number,
                decoration: InputDecoration(labelText: 'Room Number'),
                validator: (val) => val!.isEmpty ? 'Enter number' : null,
                onSaved: (val) => number = val!,
              ),
              TextFormField(
                initialValue: type,
                decoration: InputDecoration(labelText: 'Room Type'),
                validator: (val) => val!.isEmpty ? 'Enter type' : null,
                onSaved: (val) => type = val!,
              ),
              TextFormField(
                initialValue: price.toString(),
                decoration: InputDecoration(labelText: 'Price per night'),
                keyboardType: TextInputType.number,
                validator: (val) => val!.isEmpty ? 'Enter price' : null,
                onSaved: (val) => price = double.parse(val!),
              ),
              SwitchListTile(
                title: Text('available'),
                value: isOccupied,
                onChanged: (val) => setState(() => isOccupied = val),
              ),
              ElevatedButton(
                child: Text('Save'),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    if (widget.room == null) {
                      roomProvider.addRoom(Room(number: number, type: type, price: price, isavailable: isOccupied));
                    } else {
                      roomProvider.updateRoom(widget.index!, Room(number: number, type: type, price: price, isavailable: isOccupied));
                    }
                    Navigator.pop(context);
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
