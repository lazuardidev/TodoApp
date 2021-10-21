import 'dart:convert';

import 'json_sample.dart';

List<Item> itemFromJson(String str) =>
    List<Item>.from(json.decode(str).map((x) => Item.fromJson(x)));

String itemToJson(List<Item> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Item {
  Item({
    required this.inventoryId,
    required this.name,
    required this.type,
    required this.tags,
    required this.purchasedAt,
    required this.placement,
  });

  int inventoryId;
  String name;
  String type;
  List<String> tags;
  int purchasedAt;
  Placement placement;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        inventoryId: json["inventory_id"],
        name: json["name"],
        type: json["type"],
        tags: List<String>.from(json["tags"].map((x) => x)),
        purchasedAt: json["purchased_at"],
        placement: Placement.fromJson(json["placement"]),
      );

  Map<String, dynamic> toJson() => {
        "inventory_id": inventoryId,
        "name": name,
        "type": type,
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "purchased_at": purchasedAt,
        "placement": placement.toJson(),
      };
}

class Placement {
  Placement({
    required this.roomId,
    required this.name,
  });

  int roomId;
  String name;

  factory Placement.fromJson(Map<String, dynamic> json) => Placement(
        roomId: json["room_id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "room_id": roomId,
        "name": name,
      };
}

// =================================================================

List<Item> listItem = [];

collectJson() {
  for (var i = 0; i < JsonSample.jsonItem.length; i++) {
    listItem.add(Item.fromJson(JsonSample.jsonItem[i]));
  }
}

meetingRoomItem() {
  print("Find items in the Meeting Room.");
  var meetingRoom =
      listItem.where((element) => element.placement.name == "Meeting Room");
  print(meetingRoom.map((e) => e.toJson()));
}

electronicDevice() {
  print("\nFind all electronic devices.");
  var electronic = listItem.where((element) => element.type == "electronic");
  print(electronic.map((e) => e.toJson()));
}

furnitureItem() {
  print("\nFind all the furniture.");
  var furniture = listItem.where((element) => element.type == "furniture");
  print(furniture.map((e) => e.toJson()));
}

purchasedItem() {
  print("\nFind all items were purchased on 16 Januari 2020.");
  var correctItemPurchased = listItem.where((element) =>
      element.purchasedAt >= 1579132800 && element.purchasedAt <= 1579219199);
  print(correctItemPurchased.map((e) => e.toJson()));
}

brownItem() {
  print("\nFind all items with brown color.");
  var brownProduct =
      listItem.where((element) => element.tags.contains("brown"));
  print(brownProduct.map((e) => e.toJson()));
}

main() {
  collectJson();
  meetingRoomItem();
  electronicDevice();
  furnitureItem();
  purchasedItem();
  brownItem();
}
