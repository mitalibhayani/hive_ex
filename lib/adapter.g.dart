// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class adapterAdapter extends TypeAdapter<adapter> {
  @override
  final int typeId = 1;

  @override
  adapter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return adapter(
      fields[0] as String,
      fields[1] as String,
      fields[2] as String,

    );
  }

  @override
  void write(BinaryWriter writer, adapter obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.contact)
      ..writeByte(2)
      ..write(obj.city);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is adapterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
