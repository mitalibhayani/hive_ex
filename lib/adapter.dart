import 'package:hive/hive.dart';
part 'adapter.g.dart';
@HiveType(typeId: 1)
class adapter extends HiveObject
{
  @HiveField(0)
  String name;

  @HiveField(1)
  String contact;

  @HiveField(2)
  String city;

  adapter(this.name, this.contact, this.city);

  @override
  String toString() {
    return 'adapter{name: $name, contact: $contact, city: $city}';
  }
}