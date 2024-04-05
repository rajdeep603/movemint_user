// ignore_for_file: constant_identifier_names

enum LogMode { debug, live }

enum ImageType { svg, png, network, memory, file, unknown }

enum ApiTypes { get, post, put, delete }

enum DateTypes {
  WORKINGDAY,
  HOLIDAY,
  OFFDAY;

  String get getString => switch (this) {
        DateTypes.WORKINGDAY => 'Working Day',
        DateTypes.HOLIDAY => 'Holiday',
        DateTypes.OFFDAY => 'Off Day',
      };
}

enum TimeTypes {
  ACTIVE;

  String get getString => switch (this) { TimeTypes.ACTIVE => 'Available' };
}

enum Months {
  jan,
  feb,
  mar,
  apr,
  may,
  jun,
  jul,
  aug,
  sep,
  oct,
  nov,
  dec;

  String get getString => switch (this) {
        Months.jan => 'January',
        Months.feb => 'February',
        Months.mar => 'March',
        Months.apr => 'April',
        Months.may => 'May',
        Months.jun => 'June',
        Months.jul => 'July',
        Months.aug => 'August',
        Months.sep => 'September',
        Months.oct => 'October',
        Months.nov => 'November',
        Months.dec => 'December',
      };

  int get getSerialNo => switch (this) {
        Months.jan => 1,
        Months.feb => 2,
        Months.mar => 3,
        Months.apr => 4,
        Months.may => 5,
        Months.jun => 6,
        Months.jul => 7,
        Months.aug => 8,
        Months.sep => 9,
        Months.oct => 10,
        Months.nov => 11,
        Months.dec => 12,
      };
}

enum WeekDay {
  monday,
  tuesday,
  wednesday,
  thursday,
  friday,
  saturday,
  sunday;

  int get getSerialNo => switch (this) {
        WeekDay.monday => 1,
        WeekDay.tuesday => 2,
        WeekDay.wednesday => 3,
        WeekDay.thursday => 4,
        WeekDay.friday => 5,
        WeekDay.saturday => 6,
        WeekDay.sunday => 7
      };
}

enum CustomException {
  serverError,
  noInternet,
  timeOutError,
  tokenExpired,
  unknownError;

  String get message => switch (this) {
        CustomException.serverError => 'Server Error',
        CustomException.noInternet => 'No Internet',
        CustomException.timeOutError => 'Request Time Out',
        CustomException.tokenExpired => 'Token Expired.Please Login',
        CustomException.unknownError => 'Something Went Wrong',
      };
}

enum GoogleLocationTypes {
  country,
  state,
  district,
  city,
  pinCode;

  String get keyName => switch (this) {
        country => 'country',
        state => 'administrative_area_level_1',
        district => 'administrative_area_level_3',
        city => 'locality',
        pinCode => 'postal_code',
      };
}

enum AppFor { self, family }

enum RazorPayStatus { created, authorized, captured, refunded, failed }

enum FCMNotificationTypes { startVideoCall }

enum FCMButtonTypes {
  decline,
  accept;

  String get getString =>
      switch (this) { decline => 'Decline', accept => 'Accept' };
}

enum ConsultationTypes {
  Online,
  Offline;
}
