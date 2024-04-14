// class PackerSummaryOneModel {
//   List<SelectionPopupModel> dropdownItemList = [
//     SelectionPopupModel(
//       id: 1,
//       title: "Item One",
//       isSelected: true,
//     ),
//     SelectionPopupModel(
//       id: 2,
//       title: "Item Two",
//     ),
//     SelectionPopupModel(
//       id: 3,
//       title: "Item Three",
//     )
//   ];
//
//   List<SelectionPopupModel> dropdownItemList1 = [
//     SelectionPopupModel(
//       id: 1,
//       title: "Item One",
//       isSelected: true,
//     ),
//     SelectionPopupModel(
//       id: 2,
//       title: "Item Two",
//     ),
//     SelectionPopupModel(
//       id: 3,
//       title: "Item Three",
//     )
//   ];
// }

// To parse this JSON data, do
//
//     final cancelOrderModel = cancelOrderModelFromMap(jsonString);

import 'dart:convert';

CancelOrderModel cancelOrderModelFromMap(String str) =>
    CancelOrderModel.fromMap(json.decode(str));

String cancelOrderModelToMap(CancelOrderModel data) =>
    json.encode(data.toMap());

class CancelOrderModel {
  String? heading;
  String? description;
  DateTime? startDate;
  DateTime? dueDate;
  String? priority;
  String? status;
  int? isPrivate;
  List<CreateBy>? taskUsers;
  Project? project;
  String? category;
  int? taskCategoryId;
  CreateBy? createBy;

  CancelOrderModel({
    this.heading,
    this.description,
    this.startDate,
    this.dueDate,
    this.priority,
    this.status,
    this.isPrivate,
    this.taskUsers,
    this.project,
    this.category,
    this.taskCategoryId,
    this.createBy,
  });

  factory CancelOrderModel.fromMap(Map<String, dynamic> json) =>
      CancelOrderModel(
        heading: json["heading"],
        description: json["description"],
        startDate: json["start_date"] == null
            ? null
            : DateTime.parse(json["start_date"]),
        dueDate:
            json["due_date"] == null ? null : DateTime.parse(json["due_date"]),
        priority: json["priority"],
        status: json["status"],
        isPrivate: json["is_private"],
        taskUsers: json["task_users"] == null
            ? []
            : List<CreateBy>.from(
                json["task_users"]!.map((x) => CreateBy.fromMap(x))),
        project:
            json["project"] == null ? null : Project.fromMap(json["project"]),
        category: json["category"],
        taskCategoryId: json["task_category_id"],
        createBy: json["create_by"] == null
            ? null
            : CreateBy.fromMap(json["create_by"]),
      );

  Map<String, dynamic> toMap() => {
        "heading": heading,
        "description": description,
        "start_date":
            "${startDate!.year.toString().padLeft(4, '0')}-${startDate!.month.toString().padLeft(2, '0')}-${startDate!.day.toString().padLeft(2, '0')}",
        "due_date":
            "${dueDate!.year.toString().padLeft(4, '0')}-${dueDate!.month.toString().padLeft(2, '0')}-${dueDate!.day.toString().padLeft(2, '0')}",
        "priority": priority,
        "status": status,
        "is_private": isPrivate,
        "task_users": taskUsers == null
            ? []
            : List<dynamic>.from(taskUsers!.map((x) => x.toMap())),
        "project": project?.toMap(),
        "category": category,
        "task_category_id": taskCategoryId,
        "create_by": createBy?.toMap(),
      };
}

class CreateBy {
  int? id;
  String? name;

  CreateBy({
    this.id,
    this.name,
  });

  factory CreateBy.fromMap(Map<String, dynamic> json) => CreateBy(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
      };
}

class Project {
  int? id;
  String? projectName;

  Project({
    this.id,
    this.projectName,
  });

  factory Project.fromMap(Map<String, dynamic> json) => Project(
        id: json["id"],
        projectName: json["project_name"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "project_name": projectName,
      };
}
