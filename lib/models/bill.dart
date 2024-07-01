import 'dart:convert';

List<Bill> listBillFromJson(String json) {
  List data = jsonDecode(json);
  return List<Bill>.from(data.map((e) => Bill.fromMap(e)).toList());
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Bill {
  int id;
  bool paid;
  String no;
  DateTime createdAt;
  DateTime dueDate;
  double monthlyFee;
  List<AdditionalFee> additionalFee;
  double amountDue;
  Bill({
    required this.id,
    required this.paid,
    required this.no,
    required this.createdAt,
    required this.dueDate,
    required this.monthlyFee,
    required this.additionalFee,
    required this.amountDue,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'paid': paid,
      'no': no,
      'created_at': createdAt,
      'due_date': dueDate,
      'monthly_fee': monthlyFee,
      'addtional_fee': additionalFee.map((x) => x.toMap()).toList(),
      'amount_due': amountDue,
    };
  }

  factory Bill.fromMap(Map<String, dynamic> map) {
    List additionalFee = map['addtional_fee'];
    num monthlyFee = map['monthly_fee'];
    num amountDue = map['amount_due'];

    return Bill(
      id: map['id'] as int,
      paid: map['paid'] as bool,
      no: map['no'] as String,
      createdAt: DateTime.parse(map['created_at'] as String),
      dueDate: DateTime.parse(map['due_date'] as String),
      monthlyFee: monthlyFee.toDouble(),
      additionalFee:
          additionalFee.map((e) => AdditionalFee.fromMap(e)).toList(),
      amountDue: amountDue.toDouble(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Bill.fromJson(String source) => Bill.fromMap(json.decode(source));
}

class AdditionalFee {
  int id;
  String name;
  double fee;
  AdditionalFee({
    required this.id,
    required this.name,
    required this.fee,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'fee': fee,
    };
  }

  factory AdditionalFee.fromMap(Map<String, dynamic> map) {
    num fee = map['fee'];

    return AdditionalFee(
      id: map['id'] as int,
      name: map['name'] as String,
      fee: fee.toDouble(),
    );
  }

  String toJson() => json.encode(toMap());

  factory AdditionalFee.fromJson(String source) =>
      AdditionalFee.fromMap(json.decode(source));
}
