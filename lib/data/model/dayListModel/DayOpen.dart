import 'package:kelolapps/data/model/selected_model.dart';

enum DayOpen { MONDAY, TUESDAY, WEDNESDAY, THURSDAY, FRIDAY, SATURDAY, SUNDAY }

extension DayOpenExtension on DayOpen {
  String? get name {
    switch (this) {
      case DayOpen.MONDAY:
        return 'Senin';
      case DayOpen.TUESDAY:
        return 'Selasa';
      case DayOpen.WEDNESDAY:
        return 'Rabu';
      case DayOpen.THURSDAY:
        return 'Kamis';
      case DayOpen.FRIDAY:
        return 'Jumat';
      case DayOpen.SATURDAY:
        return 'Sabtu';
      case DayOpen.SUNDAY:
        return 'Minggu';
      default:
        return null;
    }
  }

  int? get ID {
    switch (this) {
      case DayOpen.MONDAY:
        return 1;
      case DayOpen.TUESDAY:
        return 2;
      case DayOpen.WEDNESDAY:
        return 3;
      case DayOpen.THURSDAY:
        return 4;
      case DayOpen.FRIDAY:
        return 5;
      case DayOpen.SATURDAY:
        return 6;
      case DayOpen.SUNDAY:
        return 7;
      default:
        return null;
    }
  }
}


List<KSelectOptionsModel> getDayLists() {
  List<KSelectOptionsModel> list = [];

  list.add(KSelectOptionsModel(title: DayOpen.MONDAY.name!, selected: false));
  list.add(KSelectOptionsModel(title: DayOpen.TUESDAY.name!, selected: false));
  list.add(KSelectOptionsModel(title: DayOpen.WEDNESDAY.name!, selected: false));
  list.add(KSelectOptionsModel(title: DayOpen.THURSDAY.name!, selected: false));
  list.add(KSelectOptionsModel(title: DayOpen.FRIDAY.name!, selected: false));
  list.add(KSelectOptionsModel(title: DayOpen.SATURDAY.name!, selected: false));
  list.add(KSelectOptionsModel(title: DayOpen.SUNDAY.name!, selected: false));

  return list;
}


