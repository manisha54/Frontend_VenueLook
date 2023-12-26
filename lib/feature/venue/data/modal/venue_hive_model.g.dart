// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'venue_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class VenueHiveModelAdapter extends TypeAdapter<VenueHiveModel> {
  @override
  final int typeId = 1;

  @override
  VenueHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return VenueHiveModel(
      venueId: fields[0] as String?,
      venueName: fields[1] as String,
      location: fields[2] as String,
      established: fields[3] as String,
      advancePayment: fields[4] as String,
      spacePreference: fields[5] as String,
      venueType: fields[6] as String,
      venueHallCapacity: fields[7] as String,
      contactNumber: fields[8] as String,
      perPlate: fields[10] as String,
      picture: fields[9] as String,
    );
  }

  @override
  void write(BinaryWriter writer, VenueHiveModel obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.venueId)
      ..writeByte(1)
      ..write(obj.venueName)
      ..writeByte(2)
      ..write(obj.location)
      ..writeByte(3)
      ..write(obj.established)
      ..writeByte(4)
      ..write(obj.advancePayment)
      ..writeByte(5)
      ..write(obj.spacePreference)
      ..writeByte(6)
      ..write(obj.venueType)
      ..writeByte(7)
      ..write(obj.venueHallCapacity)
      ..writeByte(8)
      ..write(obj.contactNumber)
      ..writeByte(9)
      ..write(obj.picture)
      ..writeByte(10)
      ..write(obj.perPlate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VenueHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
