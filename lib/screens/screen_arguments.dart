import '../models/friend.dart';

class ScreenArguments {
  final List<Friend> friends;
  final Friend? person;

  const ScreenArguments(
    {required this.friends, this.person}
  );
}