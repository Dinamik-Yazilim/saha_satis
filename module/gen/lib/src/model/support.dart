import 'package:vexana/vexana.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'support.g.dart';

@JsonSerializable()
class Support extends INetworkModel<Support> with EquatableMixin {
  final String? url;
  final String? text;

  Support({this.url, this.text});

  @override
  Support fromJson(Map<String, dynamic> json) => Support.fromJson(json);

  factory Support.fromJson(Map<String, dynamic> json) => _$SupportFromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$SupportToJson(this);

  @override
  List<Object?> get props => [url, text];

  Support copyWith({String? url, String? text}) {
    return Support(url: url ?? this.url, text: text ?? this.text);
  }
}
