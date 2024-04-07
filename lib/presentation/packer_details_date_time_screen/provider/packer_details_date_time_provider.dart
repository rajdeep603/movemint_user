import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../../../domain/providers/create_order_provider.dart';
import '../models/packer_details_date_time_model.dart';
import '../models/frame_item_model.dart';
import '../models/frame2_item_model.dart';

class DateTimeListModel {
  DateTimeListModel({required this.date, this.isSelected = false});

  DateTime date;
  bool isSelected;
}

class PackerDetailsDateTimeProvider extends ChangeNotifier {
  PackerDetailsDateTimeProvider(this.screenContext) {
    initState();
  }

  BuildContext screenContext;
  TextEditingController dateController = TextEditingController();

  PackerDetailsDateTimeModel packerDetailsDateTimeModelObj =
      PackerDetailsDateTimeModel();

  // DateTime selectedDate = DateTime.now();
  List<DateTimeListModel> dateTimeList = <DateTimeListModel>[];

  void initState() {
    for (int i = 0; i < 6; i++) {
      dateTimeList
          .add(DateTimeListModel(date: DateTime.now().add(Duration(days: i)),isSelected: i==0));
    }
  }

  Future<void> onDatePickedEvent(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate:  context.read<CreateOrderProvider>().selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime(2101));
    if (pickedDate != null) {
      context.read<CreateOrderProvider>().selectedDate = pickedDate;
      for (final DateTimeListModel element in dateTimeList) {
        if ( context.read<CreateOrderProvider>().selectedDate.day == element.date.day &&
            context.read<CreateOrderProvider>().selectedDate.month == element.date.month &&
            context.read<CreateOrderProvider>().selectedDate.year == element.date.year) {
          element.isSelected = true;
        } else {
          element.isSelected = false;
        }
      }
      notifyListeners();
    }
  }

  void onDateSelected(int index, bool value,BuildContext context) {
    for (final DateTimeListModel element in dateTimeList) {
      element.isSelected = false;
    }
    dateTimeList[index].isSelected = true;
    context.read<CreateOrderProvider>().selectedDate = dateTimeList[index].date;
    notifyListeners();
  }

  void onTimeSelected(int index, bool value) {
    packerDetailsDateTimeModelObj.frame2ItemList.forEach((element) {
      element.isSelected = false;
    });
    packerDetailsDateTimeModelObj.frame2ItemList[index].isSelected = value;
    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
    dateController.dispose();
  }
}
