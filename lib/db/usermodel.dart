import 'package:hive/hive.dart';
part 'usermodel.g.dart';
@HiveType(typeId: 0)
class User{
  @HiveField(0)
  String? name;
  @HiveField(1)
  String? age;
  User({required this.name,required this.age});
}
