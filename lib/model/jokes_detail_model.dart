class JokesDetailModel {
  String? iconUrl;
  String? value;

  JokesDetailModel({
    this.iconUrl,
    this.value,
  });

  JokesDetailModel.fromJson(Map<String, dynamic> json) {
    iconUrl = json['icon_url'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'iconUrl': iconUrl,
        'value': value,
      };
}
