class WeekTimeModel {
  String? id, shopid, day, openingTime, closingTime, isOpen, dateCreated;

  WeekTimeModel({
    this.id,
    this.shopid,
    this.day,
    this.openingTime,
    this.closingTime,
    this.isOpen,
    this.dateCreated,
  });

  factory WeekTimeModel.fromJson(Map<String, dynamic> json) {
    return WeekTimeModel(
      id: json['Id'],
      shopid: json['shopid'],
      day: json["day"],
      openingTime: json["opening_time"],
      closingTime: json["closing_time"],
      isOpen: json["is_open"],
      dateCreated: json["date_created"],
    );
  }
}
