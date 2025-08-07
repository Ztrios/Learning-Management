class PaymentEntity {
  final String? paymentUrl;
  final String? status;
  final String? invoiceId;
  final String? gateway;
  final String? paymentId;

  PaymentEntity({
    this.paymentUrl,
    this.status,
    this.invoiceId,
    this.gateway,
    this.paymentId,
  });
}