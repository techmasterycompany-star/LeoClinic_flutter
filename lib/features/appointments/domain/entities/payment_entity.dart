class PaymentEntity {
  final String? id;
  final String? appointmentId;
  final String? patientId;
  final num? amount;
  final String? status;
  final String? method;
  final String? transactionId;
  final String? createdAt;
  final String? updatedAt;

  PaymentEntity({
    this.id,
    this.appointmentId,
    this.patientId,
    this.amount,
    this.status,
    this.method,
    this.transactionId,
    this.createdAt,
    this.updatedAt,
  });
}
