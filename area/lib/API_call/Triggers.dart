class Trigger {
  int id;
  TriggerAction action;
  Reaction reaction;

  Trigger({
    required this.id,
    required this.action,
    required this.reaction,
  });

  factory Trigger.fromJson(Map<String, dynamic> json) {
    return Trigger(
      id: json['id'] is String ? int.tryParse(json['id']) ?? json['id'] : json['id'],
      action: TriggerAction.fromJson(json['action']),
      reaction: Reaction.fromJson(json['reaction']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "action": action.toJson(),
      "reaction": reaction.toJson(),
    };
  }
}

class TriggerAction {
  String name;
  bool active;
  Data data;

  TriggerAction({
    required this.name,
    required this.active,
    required this.data,
  });

  factory TriggerAction.fromJson(Map<String, dynamic> json) {
    return TriggerAction(
      name: json['name'],
      active: json['active'],
      data: Data.fromJson(json['data']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "active": active,
      "data": data.toJson(),
    };
  }
}

class Reaction {
  String name;
  Data data;

  Reaction({
    required this.name,
    required this.data,
  });

  factory Reaction.fromJson(Map<String, dynamic> json) {
    return Reaction(
      name: json['name'],
      data: Data.fromJson(json['data']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "data": data.toJson(),
    };
  }
}

class Data {
  Map<String, dynamic> data;

  Data({
    required this.data,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(data: json);
  }

  Map<String, dynamic> toJson() {
    return data;
  }
}