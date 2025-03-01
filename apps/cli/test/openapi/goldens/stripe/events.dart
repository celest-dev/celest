// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

part of 'models.dart';

sealed class StripeEvent {}

/// Occurs whenever a user authorizes an application. Sent to the related application only.
final class AccountApplicationAuthorizedEvent implements StripeEvent {
  /// Occurs whenever a user authorizes an application. Sent to the related application only.
  const AccountApplicationAuthorizedEvent({required this.object});

  factory AccountApplicationAuthorizedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return AccountApplicationAuthorizedEvent(
      object: Application.fromJson(map['object']),
    );
  }

  final Application object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever a user deauthorizes an application. Sent to the related application only.
final class AccountApplicationDeauthorizedEvent implements StripeEvent {
  /// Occurs whenever a user deauthorizes an application. Sent to the related application only.
  const AccountApplicationDeauthorizedEvent({required this.object});

  factory AccountApplicationDeauthorizedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return AccountApplicationDeauthorizedEvent(
      object: Application.fromJson(map['object']),
    );
  }

  final Application object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

sealed class AccountExternalAccountCreatedEvent_object {
  const AccountExternalAccountCreatedEvent_object();

  factory AccountExternalAccountCreatedEvent_object.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    final type = (map['object'] as String);
    final factory = $mapping[type];
    if (factory == null) {
      throw ArgumentError(
        'Unknown type of AccountExternalAccountCreatedEvent_object: "$type"',
      );
    }
    return factory(map);
  }

  static const Map<
    String,
    AccountExternalAccountCreatedEvent_object Function(Object?)
  >
  $mapping = {
    'bank_account': BankAccount.fromJson,
    'card': Card.fromJson,
    'source': Source.fromJson,
  };

  String get object;
  Map<String, Object?> toJson();
}

/// Occurs whenever an external account is created.
final class AccountExternalAccountCreatedEvent implements StripeEvent {
  /// Occurs whenever an external account is created.
  const AccountExternalAccountCreatedEvent({required this.object});

  factory AccountExternalAccountCreatedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return AccountExternalAccountCreatedEvent(
      object: AccountExternalAccountCreatedEvent_object.fromJson(map['object']),
    );
  }

  final AccountExternalAccountCreatedEvent_object object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

sealed class AccountExternalAccountDeletedEvent_object {
  const AccountExternalAccountDeletedEvent_object();

  factory AccountExternalAccountDeletedEvent_object.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    final type = (map['object'] as String);
    final factory = $mapping[type];
    if (factory == null) {
      throw ArgumentError(
        'Unknown type of AccountExternalAccountDeletedEvent_object: "$type"',
      );
    }
    return factory(map);
  }

  static const Map<
    String,
    AccountExternalAccountDeletedEvent_object Function(Object?)
  >
  $mapping = {
    'bank_account': BankAccount.fromJson,
    'card': Card.fromJson,
    'source': Source.fromJson,
  };

  String get object;
  Map<String, Object?> toJson();
}

/// Occurs whenever an external account is deleted.
final class AccountExternalAccountDeletedEvent implements StripeEvent {
  /// Occurs whenever an external account is deleted.
  const AccountExternalAccountDeletedEvent({required this.object});

  factory AccountExternalAccountDeletedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return AccountExternalAccountDeletedEvent(
      object: AccountExternalAccountDeletedEvent_object.fromJson(map['object']),
    );
  }

  final AccountExternalAccountDeletedEvent_object object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

sealed class AccountExternalAccountUpdatedEvent_object {
  const AccountExternalAccountUpdatedEvent_object();

  factory AccountExternalAccountUpdatedEvent_object.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    final type = (map['object'] as String);
    final factory = $mapping[type];
    if (factory == null) {
      throw ArgumentError(
        'Unknown type of AccountExternalAccountUpdatedEvent_object: "$type"',
      );
    }
    return factory(map);
  }

  static const Map<
    String,
    AccountExternalAccountUpdatedEvent_object Function(Object?)
  >
  $mapping = {
    'bank_account': BankAccount.fromJson,
    'card': Card.fromJson,
    'source': Source.fromJson,
  };

  String get object;
  Map<String, Object?> toJson();
}

/// Occurs whenever an external account is updated.
final class AccountExternalAccountUpdatedEvent implements StripeEvent {
  /// Occurs whenever an external account is updated.
  const AccountExternalAccountUpdatedEvent({required this.object});

  factory AccountExternalAccountUpdatedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return AccountExternalAccountUpdatedEvent(
      object: AccountExternalAccountUpdatedEvent_object.fromJson(map['object']),
    );
  }

  final AccountExternalAccountUpdatedEvent_object object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever an account status or property has changed.
final class AccountUpdatedEvent implements StripeEvent {
  /// Occurs whenever an account status or property has changed.
  const AccountUpdatedEvent({required this.object});

  factory AccountUpdatedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return AccountUpdatedEvent(object: Account.fromJson(map['object']));
  }

  final Account object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever an application fee is created on a charge.
final class ApplicationFeeCreatedEvent implements StripeEvent {
  /// Occurs whenever an application fee is created on a charge.
  const ApplicationFeeCreatedEvent({required this.object});

  factory ApplicationFeeCreatedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return ApplicationFeeCreatedEvent(
      object: ApplicationFee.fromJson(map['object']),
    );
  }

  final ApplicationFee object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever an application fee refund is updated.
final class ApplicationFeeRefundUpdatedEvent implements StripeEvent {
  /// Occurs whenever an application fee refund is updated.
  const ApplicationFeeRefundUpdatedEvent({required this.object});

  factory ApplicationFeeRefundUpdatedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return ApplicationFeeRefundUpdatedEvent(
      object: FeeRefund.fromJson(map['object']),
    );
  }

  final FeeRefund object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever an application fee is refunded, whether from refunding a charge or from \[refunding the application fee directly\](#fee_refunds). This includes partial refunds.
final class ApplicationFeeRefundedEvent implements StripeEvent {
  /// Occurs whenever an application fee is refunded, whether from refunding a charge or from \[refunding the application fee directly\](#fee_refunds). This includes partial refunds.
  const ApplicationFeeRefundedEvent({required this.object});

  factory ApplicationFeeRefundedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return ApplicationFeeRefundedEvent(
      object: ApplicationFee.fromJson(map['object']),
    );
  }

  final ApplicationFee object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever your Stripe balance has been updated (e.g., when a charge is available to be paid out). By default, Stripe automatically transfers funds in your balance to your bank account on a daily basis. This event is not fired for negative transactions.
final class BalanceAvailableEvent implements StripeEvent {
  /// Occurs whenever your Stripe balance has been updated (e.g., when a charge is available to be paid out). By default, Stripe automatically transfers funds in your balance to your bank account on a daily basis. This event is not fired for negative transactions.
  const BalanceAvailableEvent({required this.object});

  factory BalanceAvailableEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return BalanceAvailableEvent(object: Balance.fromJson(map['object']));
  }

  final Balance object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever a portal configuration is created.
final class BillingPortalConfigurationCreatedEvent implements StripeEvent {
  /// Occurs whenever a portal configuration is created.
  const BillingPortalConfigurationCreatedEvent({required this.object});

  factory BillingPortalConfigurationCreatedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return BillingPortalConfigurationCreatedEvent(
      object: BillingPortalConfiguration.fromJson(map['object']),
    );
  }

  final BillingPortalConfiguration object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever a portal configuration is updated.
final class BillingPortalConfigurationUpdatedEvent implements StripeEvent {
  /// Occurs whenever a portal configuration is updated.
  const BillingPortalConfigurationUpdatedEvent({required this.object});

  factory BillingPortalConfigurationUpdatedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return BillingPortalConfigurationUpdatedEvent(
      object: BillingPortalConfiguration.fromJson(map['object']),
    );
  }

  final BillingPortalConfiguration object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever a portal session is created.
final class BillingPortalSessionCreatedEvent implements StripeEvent {
  /// Occurs whenever a portal session is created.
  const BillingPortalSessionCreatedEvent({required this.object});

  factory BillingPortalSessionCreatedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return BillingPortalSessionCreatedEvent(
      object: BillingPortalSession.fromJson(map['object']),
    );
  }

  final BillingPortalSession object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever a capability has new requirements or a new status.
final class CapabilityUpdatedEvent implements StripeEvent {
  /// Occurs whenever a capability has new requirements or a new status.
  const CapabilityUpdatedEvent({required this.object});

  factory CapabilityUpdatedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return CapabilityUpdatedEvent(object: Capability.fromJson(map['object']));
  }

  final Capability object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever there is a positive remaining cash balance after Stripe automatically reconciles new funds into the cash balance. If you enabled manual reconciliation, this webhook will fire whenever there are new funds into the cash balance.
final class CashBalanceFundsAvailableEvent implements StripeEvent {
  /// Occurs whenever there is a positive remaining cash balance after Stripe automatically reconciles new funds into the cash balance. If you enabled manual reconciliation, this webhook will fire whenever there are new funds into the cash balance.
  const CashBalanceFundsAvailableEvent({required this.object});

  factory CashBalanceFundsAvailableEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return CashBalanceFundsAvailableEvent(
      object: CashBalance.fromJson(map['object']),
    );
  }

  final CashBalance object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever a previously uncaptured charge is captured.
final class ChargeCapturedEvent implements StripeEvent {
  /// Occurs whenever a previously uncaptured charge is captured.
  const ChargeCapturedEvent({required this.object});

  factory ChargeCapturedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return ChargeCapturedEvent(object: Charge.fromJson(map['object']));
  }

  final Charge object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs when a dispute is closed and the dispute status changes to \`lost\`, \`warning_closed\`, or \`won\`.
final class ChargeDisputeClosedEvent implements StripeEvent {
  /// Occurs when a dispute is closed and the dispute status changes to \`lost\`, \`warning_closed\`, or \`won\`.
  const ChargeDisputeClosedEvent({required this.object});

  factory ChargeDisputeClosedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return ChargeDisputeClosedEvent(object: Dispute.fromJson(map['object']));
  }

  final Dispute object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever a customer disputes a charge with their bank.
final class ChargeDisputeCreatedEvent implements StripeEvent {
  /// Occurs whenever a customer disputes a charge with their bank.
  const ChargeDisputeCreatedEvent({required this.object});

  factory ChargeDisputeCreatedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return ChargeDisputeCreatedEvent(object: Dispute.fromJson(map['object']));
  }

  final Dispute object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs when funds are reinstated to your account after a dispute is closed. This includes \[partially refunded payments\](/docs/disputes#disputes-on-partially-refunded-payments).
final class ChargeDisputeFundsReinstatedEvent implements StripeEvent {
  /// Occurs when funds are reinstated to your account after a dispute is closed. This includes \[partially refunded payments\](/docs/disputes#disputes-on-partially-refunded-payments).
  const ChargeDisputeFundsReinstatedEvent({required this.object});

  factory ChargeDisputeFundsReinstatedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return ChargeDisputeFundsReinstatedEvent(
      object: Dispute.fromJson(map['object']),
    );
  }

  final Dispute object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs when funds are removed from your account due to a dispute.
final class ChargeDisputeFundsWithdrawnEvent implements StripeEvent {
  /// Occurs when funds are removed from your account due to a dispute.
  const ChargeDisputeFundsWithdrawnEvent({required this.object});

  factory ChargeDisputeFundsWithdrawnEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return ChargeDisputeFundsWithdrawnEvent(
      object: Dispute.fromJson(map['object']),
    );
  }

  final Dispute object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs when the dispute is updated (usually with evidence).
final class ChargeDisputeUpdatedEvent implements StripeEvent {
  /// Occurs when the dispute is updated (usually with evidence).
  const ChargeDisputeUpdatedEvent({required this.object});

  factory ChargeDisputeUpdatedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return ChargeDisputeUpdatedEvent(object: Dispute.fromJson(map['object']));
  }

  final Dispute object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever an uncaptured charge expires.
final class ChargeExpiredEvent implements StripeEvent {
  /// Occurs whenever an uncaptured charge expires.
  const ChargeExpiredEvent({required this.object});

  factory ChargeExpiredEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return ChargeExpiredEvent(object: Charge.fromJson(map['object']));
  }

  final Charge object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever a failed charge attempt occurs.
final class ChargeFailedEvent implements StripeEvent {
  /// Occurs whenever a failed charge attempt occurs.
  const ChargeFailedEvent({required this.object});

  factory ChargeFailedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return ChargeFailedEvent(object: Charge.fromJson(map['object']));
  }

  final Charge object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever a pending charge is created.
final class ChargePendingEvent implements StripeEvent {
  /// Occurs whenever a pending charge is created.
  const ChargePendingEvent({required this.object});

  factory ChargePendingEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return ChargePendingEvent(object: Charge.fromJson(map['object']));
  }

  final Charge object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever a refund is updated, on selected payment methods.
final class ChargeRefundUpdatedEvent implements StripeEvent {
  /// Occurs whenever a refund is updated, on selected payment methods.
  const ChargeRefundUpdatedEvent({required this.object});

  factory ChargeRefundUpdatedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return ChargeRefundUpdatedEvent(object: Refund.fromJson(map['object']));
  }

  final Refund object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever a charge is refunded, including partial refunds.
final class ChargeRefundedEvent implements StripeEvent {
  /// Occurs whenever a charge is refunded, including partial refunds.
  const ChargeRefundedEvent({required this.object});

  factory ChargeRefundedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return ChargeRefundedEvent(object: Charge.fromJson(map['object']));
  }

  final Charge object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever a charge is successful.
final class ChargeSucceededEvent implements StripeEvent {
  /// Occurs whenever a charge is successful.
  const ChargeSucceededEvent({required this.object});

  factory ChargeSucceededEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return ChargeSucceededEvent(object: Charge.fromJson(map['object']));
  }

  final Charge object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever a charge description or metadata is updated, or upon an asynchronous capture.
final class ChargeUpdatedEvent implements StripeEvent {
  /// Occurs whenever a charge description or metadata is updated, or upon an asynchronous capture.
  const ChargeUpdatedEvent({required this.object});

  factory ChargeUpdatedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return ChargeUpdatedEvent(object: Charge.fromJson(map['object']));
  }

  final Charge object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs when a payment intent using a delayed payment method fails.
final class CheckoutSessionAsyncPaymentFailedEvent implements StripeEvent {
  /// Occurs when a payment intent using a delayed payment method fails.
  const CheckoutSessionAsyncPaymentFailedEvent({required this.object});

  factory CheckoutSessionAsyncPaymentFailedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return CheckoutSessionAsyncPaymentFailedEvent(
      object: CheckoutSession.fromJson(map['object']),
    );
  }

  final CheckoutSession object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs when a payment intent using a delayed payment method finally succeeds.
final class CheckoutSessionAsyncPaymentSucceededEvent implements StripeEvent {
  /// Occurs when a payment intent using a delayed payment method finally succeeds.
  const CheckoutSessionAsyncPaymentSucceededEvent({required this.object});

  factory CheckoutSessionAsyncPaymentSucceededEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return CheckoutSessionAsyncPaymentSucceededEvent(
      object: CheckoutSession.fromJson(map['object']),
    );
  }

  final CheckoutSession object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs when a Checkout Session has been successfully completed.
final class CheckoutSessionCompletedEvent implements StripeEvent {
  /// Occurs when a Checkout Session has been successfully completed.
  const CheckoutSessionCompletedEvent({required this.object});

  factory CheckoutSessionCompletedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return CheckoutSessionCompletedEvent(
      object: CheckoutSession.fromJson(map['object']),
    );
  }

  final CheckoutSession object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs when a Checkout Session is expired.
final class CheckoutSessionExpiredEvent implements StripeEvent {
  /// Occurs when a Checkout Session is expired.
  const CheckoutSessionExpiredEvent({required this.object});

  factory CheckoutSessionExpiredEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return CheckoutSessionExpiredEvent(
      object: CheckoutSession.fromJson(map['object']),
    );
  }

  final CheckoutSession object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs when a Climate order is canceled.
final class ClimateOrderCanceledEvent implements StripeEvent {
  /// Occurs when a Climate order is canceled.
  const ClimateOrderCanceledEvent({required this.object});

  factory ClimateOrderCanceledEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return ClimateOrderCanceledEvent(
      object: ClimateOrder.fromJson(map['object']),
    );
  }

  final ClimateOrder object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs when a Climate order is created.
final class ClimateOrderCreatedEvent implements StripeEvent {
  /// Occurs when a Climate order is created.
  const ClimateOrderCreatedEvent({required this.object});

  factory ClimateOrderCreatedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return ClimateOrderCreatedEvent(
      object: ClimateOrder.fromJson(map['object']),
    );
  }

  final ClimateOrder object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs when a Climate order is delayed.
final class ClimateOrderDelayedEvent implements StripeEvent {
  /// Occurs when a Climate order is delayed.
  const ClimateOrderDelayedEvent({required this.object});

  factory ClimateOrderDelayedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return ClimateOrderDelayedEvent(
      object: ClimateOrder.fromJson(map['object']),
    );
  }

  final ClimateOrder object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs when a Climate order is delivered.
final class ClimateOrderDeliveredEvent implements StripeEvent {
  /// Occurs when a Climate order is delivered.
  const ClimateOrderDeliveredEvent({required this.object});

  factory ClimateOrderDeliveredEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return ClimateOrderDeliveredEvent(
      object: ClimateOrder.fromJson(map['object']),
    );
  }

  final ClimateOrder object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs when a Climate order's product is substituted for another.
final class ClimateOrderProductSubstitutedEvent implements StripeEvent {
  /// Occurs when a Climate order's product is substituted for another.
  const ClimateOrderProductSubstitutedEvent({required this.object});

  factory ClimateOrderProductSubstitutedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return ClimateOrderProductSubstitutedEvent(
      object: ClimateOrder.fromJson(map['object']),
    );
  }

  final ClimateOrder object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs when a Climate product is created.
final class ClimateProductCreatedEvent implements StripeEvent {
  /// Occurs when a Climate product is created.
  const ClimateProductCreatedEvent({required this.object});

  factory ClimateProductCreatedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return ClimateProductCreatedEvent(
      object: ClimateProduct.fromJson(map['object']),
    );
  }

  final ClimateProduct object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs when a Climate product is updated.
final class ClimateProductPricingUpdatedEvent implements StripeEvent {
  /// Occurs when a Climate product is updated.
  const ClimateProductPricingUpdatedEvent({required this.object});

  factory ClimateProductPricingUpdatedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return ClimateProductPricingUpdatedEvent(
      object: ClimateProduct.fromJson(map['object']),
    );
  }

  final ClimateProduct object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever a coupon is created.
final class CouponCreatedEvent implements StripeEvent {
  /// Occurs whenever a coupon is created.
  const CouponCreatedEvent({required this.object});

  factory CouponCreatedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return CouponCreatedEvent(object: Coupon.fromJson(map['object']));
  }

  final Coupon object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever a coupon is deleted.
final class CouponDeletedEvent implements StripeEvent {
  /// Occurs whenever a coupon is deleted.
  const CouponDeletedEvent({required this.object});

  factory CouponDeletedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return CouponDeletedEvent(object: Coupon.fromJson(map['object']));
  }

  final Coupon object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever a coupon is updated.
final class CouponUpdatedEvent implements StripeEvent {
  /// Occurs whenever a coupon is updated.
  const CouponUpdatedEvent({required this.object});

  factory CouponUpdatedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return CouponUpdatedEvent(object: Coupon.fromJson(map['object']));
  }

  final Coupon object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever a credit note is created.
final class CreditNoteCreatedEvent implements StripeEvent {
  /// Occurs whenever a credit note is created.
  const CreditNoteCreatedEvent({required this.object});

  factory CreditNoteCreatedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return CreditNoteCreatedEvent(object: CreditNote.fromJson(map['object']));
  }

  final CreditNote object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever a credit note is updated.
final class CreditNoteUpdatedEvent implements StripeEvent {
  /// Occurs whenever a credit note is updated.
  const CreditNoteUpdatedEvent({required this.object});

  factory CreditNoteUpdatedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return CreditNoteUpdatedEvent(object: CreditNote.fromJson(map['object']));
  }

  final CreditNote object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever a credit note is voided.
final class CreditNoteVoidedEvent implements StripeEvent {
  /// Occurs whenever a credit note is voided.
  const CreditNoteVoidedEvent({required this.object});

  factory CreditNoteVoidedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return CreditNoteVoidedEvent(object: CreditNote.fromJson(map['object']));
  }

  final CreditNote object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever a new customer is created.
final class CustomerCreatedEvent implements StripeEvent {
  /// Occurs whenever a new customer is created.
  const CustomerCreatedEvent({required this.object});

  factory CustomerCreatedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return CustomerCreatedEvent(object: Customer.fromJson(map['object']));
  }

  final Customer object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever a customer is deleted.
final class CustomerDeletedEvent implements StripeEvent {
  /// Occurs whenever a customer is deleted.
  const CustomerDeletedEvent({required this.object});

  factory CustomerDeletedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return CustomerDeletedEvent(object: Customer.fromJson(map['object']));
  }

  final Customer object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever a coupon is attached to a customer.
final class CustomerDiscountCreatedEvent implements StripeEvent {
  /// Occurs whenever a coupon is attached to a customer.
  const CustomerDiscountCreatedEvent({required this.object});

  factory CustomerDiscountCreatedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return CustomerDiscountCreatedEvent(
      object: Discount.fromJson(map['object']),
    );
  }

  final Discount object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever a coupon is removed from a customer.
final class CustomerDiscountDeletedEvent implements StripeEvent {
  /// Occurs whenever a coupon is removed from a customer.
  const CustomerDiscountDeletedEvent({required this.object});

  factory CustomerDiscountDeletedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return CustomerDiscountDeletedEvent(
      object: Discount.fromJson(map['object']),
    );
  }

  final Discount object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever a customer is switched from one coupon to another.
final class CustomerDiscountUpdatedEvent implements StripeEvent {
  /// Occurs whenever a customer is switched from one coupon to another.
  const CustomerDiscountUpdatedEvent({required this.object});

  factory CustomerDiscountUpdatedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return CustomerDiscountUpdatedEvent(
      object: Discount.fromJson(map['object']),
    );
  }

  final Discount object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

sealed class CustomerSourceCreatedEvent_object {
  const CustomerSourceCreatedEvent_object();

  factory CustomerSourceCreatedEvent_object.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    final type = (map['object'] as String);
    final factory = $mapping[type];
    if (factory == null) {
      throw ArgumentError(
        'Unknown type of CustomerSourceCreatedEvent_object: "$type"',
      );
    }
    return factory(map);
  }

  static const Map<String, CustomerSourceCreatedEvent_object Function(Object?)>
  $mapping = {
    'bank_account': BankAccount.fromJson,
    'card': Card.fromJson,
    'source': Source.fromJson,
  };

  String get object;
  Map<String, Object?> toJson();
}

/// Occurs whenever a new source is created for a customer.
final class CustomerSourceCreatedEvent implements StripeEvent {
  /// Occurs whenever a new source is created for a customer.
  const CustomerSourceCreatedEvent({required this.object});

  factory CustomerSourceCreatedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return CustomerSourceCreatedEvent(
      object: CustomerSourceCreatedEvent_object.fromJson(map['object']),
    );
  }

  final CustomerSourceCreatedEvent_object object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

sealed class CustomerSourceDeletedEvent_object {
  const CustomerSourceDeletedEvent_object();

  factory CustomerSourceDeletedEvent_object.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    final type = (map['object'] as String);
    final factory = $mapping[type];
    if (factory == null) {
      throw ArgumentError(
        'Unknown type of CustomerSourceDeletedEvent_object: "$type"',
      );
    }
    return factory(map);
  }

  static const Map<String, CustomerSourceDeletedEvent_object Function(Object?)>
  $mapping = {
    'bank_account': BankAccount.fromJson,
    'card': Card.fromJson,
    'source': Source.fromJson,
  };

  String get object;
  Map<String, Object?> toJson();
}

/// Occurs whenever a source is removed from a customer.
final class CustomerSourceDeletedEvent implements StripeEvent {
  /// Occurs whenever a source is removed from a customer.
  const CustomerSourceDeletedEvent({required this.object});

  factory CustomerSourceDeletedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return CustomerSourceDeletedEvent(
      object: CustomerSourceDeletedEvent_object.fromJson(map['object']),
    );
  }

  final CustomerSourceDeletedEvent_object object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

sealed class CustomerSourceExpiringEvent_object {
  const CustomerSourceExpiringEvent_object();

  factory CustomerSourceExpiringEvent_object.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    final type = (map['object'] as String);
    final factory = $mapping[type];
    if (factory == null) {
      throw ArgumentError(
        'Unknown type of CustomerSourceExpiringEvent_object: "$type"',
      );
    }
    return factory(map);
  }

  static const Map<String, CustomerSourceExpiringEvent_object Function(Object?)>
  $mapping = {'card': Card.fromJson, 'source': Source.fromJson};

  String get object;
  Map<String, Object?> toJson();
}

/// Occurs whenever a card or source will expire at the end of the month.
final class CustomerSourceExpiringEvent implements StripeEvent {
  /// Occurs whenever a card or source will expire at the end of the month.
  const CustomerSourceExpiringEvent({required this.object});

  factory CustomerSourceExpiringEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return CustomerSourceExpiringEvent(
      object: CustomerSourceExpiringEvent_object.fromJson(map['object']),
    );
  }

  final CustomerSourceExpiringEvent_object object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

sealed class CustomerSourceUpdatedEvent_object {
  const CustomerSourceUpdatedEvent_object();

  factory CustomerSourceUpdatedEvent_object.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    final type = (map['object'] as String);
    final factory = $mapping[type];
    if (factory == null) {
      throw ArgumentError(
        'Unknown type of CustomerSourceUpdatedEvent_object: "$type"',
      );
    }
    return factory(map);
  }

  static const Map<String, CustomerSourceUpdatedEvent_object Function(Object?)>
  $mapping = {
    'bank_account': BankAccount.fromJson,
    'card': Card.fromJson,
    'source': Source.fromJson,
  };

  String get object;
  Map<String, Object?> toJson();
}

/// Occurs whenever a source's details are changed.
final class CustomerSourceUpdatedEvent implements StripeEvent {
  /// Occurs whenever a source's details are changed.
  const CustomerSourceUpdatedEvent({required this.object});

  factory CustomerSourceUpdatedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return CustomerSourceUpdatedEvent(
      object: CustomerSourceUpdatedEvent_object.fromJson(map['object']),
    );
  }

  final CustomerSourceUpdatedEvent_object object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever a customer is signed up for a new plan.
final class CustomerSubscriptionCreatedEvent implements StripeEvent {
  /// Occurs whenever a customer is signed up for a new plan.
  const CustomerSubscriptionCreatedEvent({required this.object});

  factory CustomerSubscriptionCreatedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return CustomerSubscriptionCreatedEvent(
      object: Subscription.fromJson(map['object']),
    );
  }

  final Subscription object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever a customer's subscription ends.
final class CustomerSubscriptionDeletedEvent implements StripeEvent {
  /// Occurs whenever a customer's subscription ends.
  const CustomerSubscriptionDeletedEvent({required this.object});

  factory CustomerSubscriptionDeletedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return CustomerSubscriptionDeletedEvent(
      object: Subscription.fromJson(map['object']),
    );
  }

  final Subscription object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever a customer's subscription is paused. Only applies when subscriptions enter \`status=paused\`, not when \[payment collection\](/docs/billing/subscriptions/pause) is paused.
final class CustomerSubscriptionPausedEvent implements StripeEvent {
  /// Occurs whenever a customer's subscription is paused. Only applies when subscriptions enter \`status=paused\`, not when \[payment collection\](/docs/billing/subscriptions/pause) is paused.
  const CustomerSubscriptionPausedEvent({required this.object});

  factory CustomerSubscriptionPausedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return CustomerSubscriptionPausedEvent(
      object: Subscription.fromJson(map['object']),
    );
  }

  final Subscription object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever a customer's subscription's pending update is applied, and the subscription is updated.
final class CustomerSubscriptionPendingUpdateAppliedEvent
    implements StripeEvent {
  /// Occurs whenever a customer's subscription's pending update is applied, and the subscription is updated.
  const CustomerSubscriptionPendingUpdateAppliedEvent({required this.object});

  factory CustomerSubscriptionPendingUpdateAppliedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return CustomerSubscriptionPendingUpdateAppliedEvent(
      object: Subscription.fromJson(map['object']),
    );
  }

  final Subscription object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever a customer's subscription's pending update expires before the related invoice is paid.
final class CustomerSubscriptionPendingUpdateExpiredEvent
    implements StripeEvent {
  /// Occurs whenever a customer's subscription's pending update expires before the related invoice is paid.
  const CustomerSubscriptionPendingUpdateExpiredEvent({required this.object});

  factory CustomerSubscriptionPendingUpdateExpiredEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return CustomerSubscriptionPendingUpdateExpiredEvent(
      object: Subscription.fromJson(map['object']),
    );
  }

  final Subscription object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever a customer's subscription is no longer paused. Only applies when a \`status=paused\` subscription is \[resumed\](/docs/api/subscriptions/resume), not when \[payment collection\](/docs/billing/subscriptions/pause) is resumed.
final class CustomerSubscriptionResumedEvent implements StripeEvent {
  /// Occurs whenever a customer's subscription is no longer paused. Only applies when a \`status=paused\` subscription is \[resumed\](/docs/api/subscriptions/resume), not when \[payment collection\](/docs/billing/subscriptions/pause) is resumed.
  const CustomerSubscriptionResumedEvent({required this.object});

  factory CustomerSubscriptionResumedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return CustomerSubscriptionResumedEvent(
      object: Subscription.fromJson(map['object']),
    );
  }

  final Subscription object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs three days before a subscription's trial period is scheduled to end, or when a trial is ended immediately (using \`trial_end=now\`).
final class CustomerSubscriptionTrialWillEndEvent implements StripeEvent {
  /// Occurs three days before a subscription's trial period is scheduled to end, or when a trial is ended immediately (using \`trial_end=now\`).
  const CustomerSubscriptionTrialWillEndEvent({required this.object});

  factory CustomerSubscriptionTrialWillEndEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return CustomerSubscriptionTrialWillEndEvent(
      object: Subscription.fromJson(map['object']),
    );
  }

  final Subscription object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever a subscription changes (e.g., switching from one plan to another, or changing the status from trial to active).
final class CustomerSubscriptionUpdatedEvent implements StripeEvent {
  /// Occurs whenever a subscription changes (e.g., switching from one plan to another, or changing the status from trial to active).
  const CustomerSubscriptionUpdatedEvent({required this.object});

  factory CustomerSubscriptionUpdatedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return CustomerSubscriptionUpdatedEvent(
      object: Subscription.fromJson(map['object']),
    );
  }

  final Subscription object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever a tax ID is created for a customer.
final class CustomerTaxIdCreatedEvent implements StripeEvent {
  /// Occurs whenever a tax ID is created for a customer.
  const CustomerTaxIdCreatedEvent({required this.object});

  factory CustomerTaxIdCreatedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return CustomerTaxIdCreatedEvent(object: TaxId.fromJson(map['object']));
  }

  final TaxId object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever a tax ID is deleted from a customer.
final class CustomerTaxIdDeletedEvent implements StripeEvent {
  /// Occurs whenever a tax ID is deleted from a customer.
  const CustomerTaxIdDeletedEvent({required this.object});

  factory CustomerTaxIdDeletedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return CustomerTaxIdDeletedEvent(object: TaxId.fromJson(map['object']));
  }

  final TaxId object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever a customer's tax ID is updated.
final class CustomerTaxIdUpdatedEvent implements StripeEvent {
  /// Occurs whenever a customer's tax ID is updated.
  const CustomerTaxIdUpdatedEvent({required this.object});

  factory CustomerTaxIdUpdatedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return CustomerTaxIdUpdatedEvent(object: TaxId.fromJson(map['object']));
  }

  final TaxId object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever any property of a customer changes.
final class CustomerUpdatedEvent implements StripeEvent {
  /// Occurs whenever any property of a customer changes.
  const CustomerUpdatedEvent({required this.object});

  factory CustomerUpdatedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return CustomerUpdatedEvent(object: Customer.fromJson(map['object']));
  }

  final Customer object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever a new customer cash balance transactions is created.
final class CustomerCashBalanceTransactionCreatedEvent implements StripeEvent {
  /// Occurs whenever a new customer cash balance transactions is created.
  const CustomerCashBalanceTransactionCreatedEvent({required this.object});

  factory CustomerCashBalanceTransactionCreatedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return CustomerCashBalanceTransactionCreatedEvent(
      object: CustomerCashBalanceTransaction.fromJson(map['object']),
    );
  }

  final CustomerCashBalanceTransaction object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever a new Stripe-generated file is available for your account.
final class FileCreatedEvent implements StripeEvent {
  /// Occurs whenever a new Stripe-generated file is available for your account.
  const FileCreatedEvent({required this.object});

  factory FileCreatedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return FileCreatedEvent(object: File.fromJson(map['object']));
  }

  final File object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs when a new Financial Connections account is created.
final class FinancialConnectionsAccountCreatedEvent implements StripeEvent {
  /// Occurs when a new Financial Connections account is created.
  const FinancialConnectionsAccountCreatedEvent({required this.object});

  factory FinancialConnectionsAccountCreatedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return FinancialConnectionsAccountCreatedEvent(
      object: FinancialConnectionsAccount.fromJson(map['object']),
    );
  }

  final FinancialConnectionsAccount object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs when a Financial Connections account's status is updated from \`active\` to \`inactive\`.
final class FinancialConnectionsAccountDeactivatedEvent implements StripeEvent {
  /// Occurs when a Financial Connections account's status is updated from \`active\` to \`inactive\`.
  const FinancialConnectionsAccountDeactivatedEvent({required this.object});

  factory FinancialConnectionsAccountDeactivatedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return FinancialConnectionsAccountDeactivatedEvent(
      object: FinancialConnectionsAccount.fromJson(map['object']),
    );
  }

  final FinancialConnectionsAccount object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs when a Financial Connections account is disconnected.
final class FinancialConnectionsAccountDisconnectedEvent
    implements StripeEvent {
  /// Occurs when a Financial Connections account is disconnected.
  const FinancialConnectionsAccountDisconnectedEvent({required this.object});

  factory FinancialConnectionsAccountDisconnectedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return FinancialConnectionsAccountDisconnectedEvent(
      object: FinancialConnectionsAccount.fromJson(map['object']),
    );
  }

  final FinancialConnectionsAccount object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs when a Financial Connections account's status is updated from \`inactive\` to \`active\`.
final class FinancialConnectionsAccountReactivatedEvent implements StripeEvent {
  /// Occurs when a Financial Connections account's status is updated from \`inactive\` to \`active\`.
  const FinancialConnectionsAccountReactivatedEvent({required this.object});

  factory FinancialConnectionsAccountReactivatedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return FinancialConnectionsAccountReactivatedEvent(
      object: FinancialConnectionsAccount.fromJson(map['object']),
    );
  }

  final FinancialConnectionsAccount object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs when an Account’s \`balance_refresh\` status transitions from \`pending\` to either \`succeeded\` or \`failed\`.
final class FinancialConnectionsAccountRefreshedBalanceEvent
    implements StripeEvent {
  /// Occurs when an Account’s \`balance_refresh\` status transitions from \`pending\` to either \`succeeded\` or \`failed\`.
  const FinancialConnectionsAccountRefreshedBalanceEvent({
    required this.object,
  });

  factory FinancialConnectionsAccountRefreshedBalanceEvent.fromJson(
    Object? json,
  ) {
    final map = (json as Map<String, Object?>);
    return FinancialConnectionsAccountRefreshedBalanceEvent(
      object: FinancialConnectionsAccount.fromJson(map['object']),
    );
  }

  final FinancialConnectionsAccount object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs when an Account’s \`ownership_refresh\` status transitions from \`pending\` to either \`succeeded\` or \`failed\`.
final class FinancialConnectionsAccountRefreshedOwnershipEvent
    implements StripeEvent {
  /// Occurs when an Account’s \`ownership_refresh\` status transitions from \`pending\` to either \`succeeded\` or \`failed\`.
  const FinancialConnectionsAccountRefreshedOwnershipEvent({
    required this.object,
  });

  factory FinancialConnectionsAccountRefreshedOwnershipEvent.fromJson(
    Object? json,
  ) {
    final map = (json as Map<String, Object?>);
    return FinancialConnectionsAccountRefreshedOwnershipEvent(
      object: FinancialConnectionsAccount.fromJson(map['object']),
    );
  }

  final FinancialConnectionsAccount object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs when an Account’s \`transaction_refresh\` status transitions from \`pending\` to either \`succeeded\` or \`failed\`.
final class FinancialConnectionsAccountRefreshedTransactionsEvent
    implements StripeEvent {
  /// Occurs when an Account’s \`transaction_refresh\` status transitions from \`pending\` to either \`succeeded\` or \`failed\`.
  const FinancialConnectionsAccountRefreshedTransactionsEvent({
    required this.object,
  });

  factory FinancialConnectionsAccountRefreshedTransactionsEvent.fromJson(
    Object? json,
  ) {
    final map = (json as Map<String, Object?>);
    return FinancialConnectionsAccountRefreshedTransactionsEvent(
      object: FinancialConnectionsAccount.fromJson(map['object']),
    );
  }

  final FinancialConnectionsAccount object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever a VerificationSession is canceled
final class IdentityVerificationSessionCanceledEvent implements StripeEvent {
  /// Occurs whenever a VerificationSession is canceled
  const IdentityVerificationSessionCanceledEvent({required this.object});

  factory IdentityVerificationSessionCanceledEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return IdentityVerificationSessionCanceledEvent(
      object: IdentityVerificationSession.fromJson(map['object']),
    );
  }

  final IdentityVerificationSession object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever a VerificationSession is created
final class IdentityVerificationSessionCreatedEvent implements StripeEvent {
  /// Occurs whenever a VerificationSession is created
  const IdentityVerificationSessionCreatedEvent({required this.object});

  factory IdentityVerificationSessionCreatedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return IdentityVerificationSessionCreatedEvent(
      object: IdentityVerificationSession.fromJson(map['object']),
    );
  }

  final IdentityVerificationSession object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever a VerificationSession transitions to processing
final class IdentityVerificationSessionProcessingEvent implements StripeEvent {
  /// Occurs whenever a VerificationSession transitions to processing
  const IdentityVerificationSessionProcessingEvent({required this.object});

  factory IdentityVerificationSessionProcessingEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return IdentityVerificationSessionProcessingEvent(
      object: IdentityVerificationSession.fromJson(map['object']),
    );
  }

  final IdentityVerificationSession object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever a VerificationSession is redacted.
final class IdentityVerificationSessionRedactedEvent implements StripeEvent {
  /// Occurs whenever a VerificationSession is redacted.
  const IdentityVerificationSessionRedactedEvent({required this.object});

  factory IdentityVerificationSessionRedactedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return IdentityVerificationSessionRedactedEvent(
      object: IdentityVerificationSession.fromJson(map['object']),
    );
  }

  final IdentityVerificationSession object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever a VerificationSession transitions to require user input
final class IdentityVerificationSessionRequiresInputEvent
    implements StripeEvent {
  /// Occurs whenever a VerificationSession transitions to require user input
  const IdentityVerificationSessionRequiresInputEvent({required this.object});

  factory IdentityVerificationSessionRequiresInputEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return IdentityVerificationSessionRequiresInputEvent(
      object: IdentityVerificationSession.fromJson(map['object']),
    );
  }

  final IdentityVerificationSession object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever a VerificationSession transitions to verified
final class IdentityVerificationSessionVerifiedEvent implements StripeEvent {
  /// Occurs whenever a VerificationSession transitions to verified
  const IdentityVerificationSessionVerifiedEvent({required this.object});

  factory IdentityVerificationSessionVerifiedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return IdentityVerificationSessionVerifiedEvent(
      object: IdentityVerificationSession.fromJson(map['object']),
    );
  }

  final IdentityVerificationSession object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever a new invoice is created. To learn how webhooks can be used with this event, and how they can affect it, see \[Using Webhooks with Subscriptions\](/docs/subscriptions/webhooks).
final class InvoiceCreatedEvent implements StripeEvent {
  /// Occurs whenever a new invoice is created. To learn how webhooks can be used with this event, and how they can affect it, see \[Using Webhooks with Subscriptions\](/docs/subscriptions/webhooks).
  const InvoiceCreatedEvent({required this.object});

  factory InvoiceCreatedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return InvoiceCreatedEvent(object: Invoice.fromJson(map['object']));
  }

  final Invoice object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever a draft invoice is deleted.
final class InvoiceDeletedEvent implements StripeEvent {
  /// Occurs whenever a draft invoice is deleted.
  const InvoiceDeletedEvent({required this.object});

  factory InvoiceDeletedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return InvoiceDeletedEvent(object: Invoice.fromJson(map['object']));
  }

  final Invoice object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever a draft invoice cannot be finalized. See the invoice’s \[last finalization error\](/docs/api/invoices/object#invoice\_object-last\_finalization_error) for details.
final class InvoiceFinalizationFailedEvent implements StripeEvent {
  /// Occurs whenever a draft invoice cannot be finalized. See the invoice’s \[last finalization error\](/docs/api/invoices/object#invoice\_object-last\_finalization_error) for details.
  const InvoiceFinalizationFailedEvent({required this.object});

  factory InvoiceFinalizationFailedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return InvoiceFinalizationFailedEvent(
      object: Invoice.fromJson(map['object']),
    );
  }

  final Invoice object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever a draft invoice is finalized and updated to be an open invoice.
final class InvoiceFinalizedEvent implements StripeEvent {
  /// Occurs whenever a draft invoice is finalized and updated to be an open invoice.
  const InvoiceFinalizedEvent({required this.object});

  factory InvoiceFinalizedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return InvoiceFinalizedEvent(object: Invoice.fromJson(map['object']));
  }

  final Invoice object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever an invoice is marked uncollectible.
final class InvoiceMarkedUncollectibleEvent implements StripeEvent {
  /// Occurs whenever an invoice is marked uncollectible.
  const InvoiceMarkedUncollectibleEvent({required this.object});

  factory InvoiceMarkedUncollectibleEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return InvoiceMarkedUncollectibleEvent(
      object: Invoice.fromJson(map['object']),
    );
  }

  final Invoice object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever an invoice payment attempt succeeds or an invoice is marked as paid out-of-band.
final class InvoicePaidEvent implements StripeEvent {
  /// Occurs whenever an invoice payment attempt succeeds or an invoice is marked as paid out-of-band.
  const InvoicePaidEvent({required this.object});

  factory InvoicePaidEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return InvoicePaidEvent(object: Invoice.fromJson(map['object']));
  }

  final Invoice object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever an invoice payment attempt requires further user action to complete.
final class InvoicePaymentActionRequiredEvent implements StripeEvent {
  /// Occurs whenever an invoice payment attempt requires further user action to complete.
  const InvoicePaymentActionRequiredEvent({required this.object});

  factory InvoicePaymentActionRequiredEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return InvoicePaymentActionRequiredEvent(
      object: Invoice.fromJson(map['object']),
    );
  }

  final Invoice object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever an invoice payment attempt fails, due either to a declined payment or to the lack of a stored payment method.
final class InvoicePaymentFailedEvent implements StripeEvent {
  /// Occurs whenever an invoice payment attempt fails, due either to a declined payment or to the lack of a stored payment method.
  const InvoicePaymentFailedEvent({required this.object});

  factory InvoicePaymentFailedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return InvoicePaymentFailedEvent(object: Invoice.fromJson(map['object']));
  }

  final Invoice object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever an invoice payment attempt succeeds.
final class InvoicePaymentSucceededEvent implements StripeEvent {
  /// Occurs whenever an invoice payment attempt succeeds.
  const InvoicePaymentSucceededEvent({required this.object});

  factory InvoicePaymentSucceededEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return InvoicePaymentSucceededEvent(
      object: Invoice.fromJson(map['object']),
    );
  }

  final Invoice object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever an invoice email is sent out.
final class InvoiceSentEvent implements StripeEvent {
  /// Occurs whenever an invoice email is sent out.
  const InvoiceSentEvent({required this.object});

  factory InvoiceSentEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return InvoiceSentEvent(object: Invoice.fromJson(map['object']));
  }

  final Invoice object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs X number of days before a subscription is scheduled to create an invoice that is automatically charged—where X is determined by your \[subscriptions settings\](https://dashboard.stripe.com/account/billing/automatic). Note: The received \`Invoice\` object will not have an invoice ID.
final class InvoiceUpcomingEvent implements StripeEvent {
  /// Occurs X number of days before a subscription is scheduled to create an invoice that is automatically charged—where X is determined by your \[subscriptions settings\](https://dashboard.stripe.com/account/billing/automatic). Note: The received \`Invoice\` object will not have an invoice ID.
  const InvoiceUpcomingEvent({required this.object});

  factory InvoiceUpcomingEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return InvoiceUpcomingEvent(object: Invoice.fromJson(map['object']));
  }

  final Invoice object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever an invoice changes (e.g., the invoice amount).
final class InvoiceUpdatedEvent implements StripeEvent {
  /// Occurs whenever an invoice changes (e.g., the invoice amount).
  const InvoiceUpdatedEvent({required this.object});

  factory InvoiceUpdatedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return InvoiceUpdatedEvent(object: Invoice.fromJson(map['object']));
  }

  final Invoice object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever an invoice is voided.
final class InvoiceVoidedEvent implements StripeEvent {
  /// Occurs whenever an invoice is voided.
  const InvoiceVoidedEvent({required this.object});

  factory InvoiceVoidedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return InvoiceVoidedEvent(object: Invoice.fromJson(map['object']));
  }

  final Invoice object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever an invoice item is created.
final class InvoiceitemCreatedEvent implements StripeEvent {
  /// Occurs whenever an invoice item is created.
  const InvoiceitemCreatedEvent({required this.object});

  factory InvoiceitemCreatedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return InvoiceitemCreatedEvent(object: Invoiceitem.fromJson(map['object']));
  }

  final Invoiceitem object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever an invoice item is deleted.
final class InvoiceitemDeletedEvent implements StripeEvent {
  /// Occurs whenever an invoice item is deleted.
  const InvoiceitemDeletedEvent({required this.object});

  factory InvoiceitemDeletedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return InvoiceitemDeletedEvent(object: Invoiceitem.fromJson(map['object']));
  }

  final Invoiceitem object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever an authorization is created.
final class IssuingAuthorizationCreatedEvent implements StripeEvent {
  /// Occurs whenever an authorization is created.
  const IssuingAuthorizationCreatedEvent({required this.object});

  factory IssuingAuthorizationCreatedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return IssuingAuthorizationCreatedEvent(
      object: IssuingAuthorization.fromJson(map['object']),
    );
  }

  final IssuingAuthorization object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Represents a synchronous request for authorization, see \[Using your integration to handle authorization requests\](/docs/issuing/purchases/authorizations#authorization-handling).
final class IssuingAuthorizationRequestEvent implements StripeEvent {
  /// Represents a synchronous request for authorization, see \[Using your integration to handle authorization requests\](/docs/issuing/purchases/authorizations#authorization-handling).
  const IssuingAuthorizationRequestEvent({required this.object});

  factory IssuingAuthorizationRequestEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return IssuingAuthorizationRequestEvent(
      object: IssuingAuthorization.fromJson(map['object']),
    );
  }

  final IssuingAuthorization object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever an authorization is updated.
final class IssuingAuthorizationUpdatedEvent implements StripeEvent {
  /// Occurs whenever an authorization is updated.
  const IssuingAuthorizationUpdatedEvent({required this.object});

  factory IssuingAuthorizationUpdatedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return IssuingAuthorizationUpdatedEvent(
      object: IssuingAuthorization.fromJson(map['object']),
    );
  }

  final IssuingAuthorization object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever a card is created.
final class IssuingCardCreatedEvent implements StripeEvent {
  /// Occurs whenever a card is created.
  const IssuingCardCreatedEvent({required this.object});

  factory IssuingCardCreatedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return IssuingCardCreatedEvent(object: IssuingCard.fromJson(map['object']));
  }

  final IssuingCard object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever a card is updated.
final class IssuingCardUpdatedEvent implements StripeEvent {
  /// Occurs whenever a card is updated.
  const IssuingCardUpdatedEvent({required this.object});

  factory IssuingCardUpdatedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return IssuingCardUpdatedEvent(object: IssuingCard.fromJson(map['object']));
  }

  final IssuingCard object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever a cardholder is created.
final class IssuingCardholderCreatedEvent implements StripeEvent {
  /// Occurs whenever a cardholder is created.
  const IssuingCardholderCreatedEvent({required this.object});

  factory IssuingCardholderCreatedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return IssuingCardholderCreatedEvent(
      object: IssuingCardholder.fromJson(map['object']),
    );
  }

  final IssuingCardholder object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever a cardholder is updated.
final class IssuingCardholderUpdatedEvent implements StripeEvent {
  /// Occurs whenever a cardholder is updated.
  const IssuingCardholderUpdatedEvent({required this.object});

  factory IssuingCardholderUpdatedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return IssuingCardholderUpdatedEvent(
      object: IssuingCardholder.fromJson(map['object']),
    );
  }

  final IssuingCardholder object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever a dispute is won, lost or expired.
final class IssuingDisputeClosedEvent implements StripeEvent {
  /// Occurs whenever a dispute is won, lost or expired.
  const IssuingDisputeClosedEvent({required this.object});

  factory IssuingDisputeClosedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return IssuingDisputeClosedEvent(
      object: IssuingDispute.fromJson(map['object']),
    );
  }

  final IssuingDispute object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever a dispute is created.
final class IssuingDisputeCreatedEvent implements StripeEvent {
  /// Occurs whenever a dispute is created.
  const IssuingDisputeCreatedEvent({required this.object});

  factory IssuingDisputeCreatedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return IssuingDisputeCreatedEvent(
      object: IssuingDispute.fromJson(map['object']),
    );
  }

  final IssuingDispute object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever funds are reinstated to your account for an Issuing dispute.
final class IssuingDisputeFundsReinstatedEvent implements StripeEvent {
  /// Occurs whenever funds are reinstated to your account for an Issuing dispute.
  const IssuingDisputeFundsReinstatedEvent({required this.object});

  factory IssuingDisputeFundsReinstatedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return IssuingDisputeFundsReinstatedEvent(
      object: IssuingDispute.fromJson(map['object']),
    );
  }

  final IssuingDispute object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever a dispute is submitted.
final class IssuingDisputeSubmittedEvent implements StripeEvent {
  /// Occurs whenever a dispute is submitted.
  const IssuingDisputeSubmittedEvent({required this.object});

  factory IssuingDisputeSubmittedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return IssuingDisputeSubmittedEvent(
      object: IssuingDispute.fromJson(map['object']),
    );
  }

  final IssuingDispute object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever a dispute is updated.
final class IssuingDisputeUpdatedEvent implements StripeEvent {
  /// Occurs whenever a dispute is updated.
  const IssuingDisputeUpdatedEvent({required this.object});

  factory IssuingDisputeUpdatedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return IssuingDisputeUpdatedEvent(
      object: IssuingDispute.fromJson(map['object']),
    );
  }

  final IssuingDispute object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever an issuing digital wallet token is created.
final class IssuingTokenCreatedEvent implements StripeEvent {
  /// Occurs whenever an issuing digital wallet token is created.
  const IssuingTokenCreatedEvent({required this.object});

  factory IssuingTokenCreatedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return IssuingTokenCreatedEvent(
      object: IssuingToken.fromJson(map['object']),
    );
  }

  final IssuingToken object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever an issuing digital wallet token is updated.
final class IssuingTokenUpdatedEvent implements StripeEvent {
  /// Occurs whenever an issuing digital wallet token is updated.
  const IssuingTokenUpdatedEvent({required this.object});

  factory IssuingTokenUpdatedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return IssuingTokenUpdatedEvent(
      object: IssuingToken.fromJson(map['object']),
    );
  }

  final IssuingToken object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever an issuing transaction is created.
final class IssuingTransactionCreatedEvent implements StripeEvent {
  /// Occurs whenever an issuing transaction is created.
  const IssuingTransactionCreatedEvent({required this.object});

  factory IssuingTransactionCreatedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return IssuingTransactionCreatedEvent(
      object: IssuingTransaction.fromJson(map['object']),
    );
  }

  final IssuingTransaction object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever an issuing transaction is updated.
final class IssuingTransactionUpdatedEvent implements StripeEvent {
  /// Occurs whenever an issuing transaction is updated.
  const IssuingTransactionUpdatedEvent({required this.object});

  factory IssuingTransactionUpdatedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return IssuingTransactionUpdatedEvent(
      object: IssuingTransaction.fromJson(map['object']),
    );
  }

  final IssuingTransaction object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever a Mandate is updated.
final class MandateUpdatedEvent implements StripeEvent {
  /// Occurs whenever a Mandate is updated.
  const MandateUpdatedEvent({required this.object});

  factory MandateUpdatedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return MandateUpdatedEvent(object: Mandate.fromJson(map['object']));
  }

  final Mandate object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs when a PaymentIntent has funds to be captured. Check the \`amount\_capturable\` property on the PaymentIntent to determine the amount that can be captured. You may capture the PaymentIntent with an \`amount\_to\_capture\` value up to the specified amount. \[Learn more about capturing PaymentIntents.\](https://stripe.com/docs/api/payment\_intents/capture)
final class PaymentIntentAmountCapturableUpdatedEvent implements StripeEvent {
  /// Occurs when a PaymentIntent has funds to be captured. Check the \`amount\_capturable\` property on the PaymentIntent to determine the amount that can be captured. You may capture the PaymentIntent with an \`amount\_to\_capture\` value up to the specified amount. \[Learn more about capturing PaymentIntents.\](https://stripe.com/docs/api/payment\_intents/capture)
  const PaymentIntentAmountCapturableUpdatedEvent({required this.object});

  factory PaymentIntentAmountCapturableUpdatedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return PaymentIntentAmountCapturableUpdatedEvent(
      object: PaymentIntent.fromJson(map['object']),
    );
  }

  final PaymentIntent object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs when a PaymentIntent is canceled.
final class PaymentIntentCanceledEvent implements StripeEvent {
  /// Occurs when a PaymentIntent is canceled.
  const PaymentIntentCanceledEvent({required this.object});

  factory PaymentIntentCanceledEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return PaymentIntentCanceledEvent(
      object: PaymentIntent.fromJson(map['object']),
    );
  }

  final PaymentIntent object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs when a new PaymentIntent is created.
final class PaymentIntentCreatedEvent implements StripeEvent {
  /// Occurs when a new PaymentIntent is created.
  const PaymentIntentCreatedEvent({required this.object});

  factory PaymentIntentCreatedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return PaymentIntentCreatedEvent(
      object: PaymentIntent.fromJson(map['object']),
    );
  }

  final PaymentIntent object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs when funds are applied to a customer\_balance PaymentIntent and the 'amount\_remaining' changes.
final class PaymentIntentPartiallyFundedEvent implements StripeEvent {
  /// Occurs when funds are applied to a customer\_balance PaymentIntent and the 'amount\_remaining' changes.
  const PaymentIntentPartiallyFundedEvent({required this.object});

  factory PaymentIntentPartiallyFundedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return PaymentIntentPartiallyFundedEvent(
      object: PaymentIntent.fromJson(map['object']),
    );
  }

  final PaymentIntent object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs when a PaymentIntent has failed the attempt to create a payment method or a payment.
final class PaymentIntentPaymentFailedEvent implements StripeEvent {
  /// Occurs when a PaymentIntent has failed the attempt to create a payment method or a payment.
  const PaymentIntentPaymentFailedEvent({required this.object});

  factory PaymentIntentPaymentFailedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return PaymentIntentPaymentFailedEvent(
      object: PaymentIntent.fromJson(map['object']),
    );
  }

  final PaymentIntent object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs when a PaymentIntent has started processing.
final class PaymentIntentProcessingEvent implements StripeEvent {
  /// Occurs when a PaymentIntent has started processing.
  const PaymentIntentProcessingEvent({required this.object});

  factory PaymentIntentProcessingEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return PaymentIntentProcessingEvent(
      object: PaymentIntent.fromJson(map['object']),
    );
  }

  final PaymentIntent object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs when a PaymentIntent transitions to requires_action state
final class PaymentIntentRequiresActionEvent implements StripeEvent {
  /// Occurs when a PaymentIntent transitions to requires_action state
  const PaymentIntentRequiresActionEvent({required this.object});

  factory PaymentIntentRequiresActionEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return PaymentIntentRequiresActionEvent(
      object: PaymentIntent.fromJson(map['object']),
    );
  }

  final PaymentIntent object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs when a PaymentIntent has successfully completed payment.
final class PaymentIntentSucceededEvent implements StripeEvent {
  /// Occurs when a PaymentIntent has successfully completed payment.
  const PaymentIntentSucceededEvent({required this.object});

  factory PaymentIntentSucceededEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return PaymentIntentSucceededEvent(
      object: PaymentIntent.fromJson(map['object']),
    );
  }

  final PaymentIntent object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs when a payment link is created.
final class PaymentLinkCreatedEvent implements StripeEvent {
  /// Occurs when a payment link is created.
  const PaymentLinkCreatedEvent({required this.object});

  factory PaymentLinkCreatedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return PaymentLinkCreatedEvent(object: PaymentLink.fromJson(map['object']));
  }

  final PaymentLink object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs when a payment link is updated.
final class PaymentLinkUpdatedEvent implements StripeEvent {
  /// Occurs when a payment link is updated.
  const PaymentLinkUpdatedEvent({required this.object});

  factory PaymentLinkUpdatedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return PaymentLinkUpdatedEvent(object: PaymentLink.fromJson(map['object']));
  }

  final PaymentLink object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever a new payment method is attached to a customer.
final class PaymentMethodAttachedEvent implements StripeEvent {
  /// Occurs whenever a new payment method is attached to a customer.
  const PaymentMethodAttachedEvent({required this.object});

  factory PaymentMethodAttachedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return PaymentMethodAttachedEvent(
      object: PaymentMethod.fromJson(map['object']),
    );
  }

  final PaymentMethod object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever a payment method's details are automatically updated by the network.
final class PaymentMethodAutomaticallyUpdatedEvent implements StripeEvent {
  /// Occurs whenever a payment method's details are automatically updated by the network.
  const PaymentMethodAutomaticallyUpdatedEvent({required this.object});

  factory PaymentMethodAutomaticallyUpdatedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return PaymentMethodAutomaticallyUpdatedEvent(
      object: PaymentMethod.fromJson(map['object']),
    );
  }

  final PaymentMethod object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever a payment method is detached from a customer.
final class PaymentMethodDetachedEvent implements StripeEvent {
  /// Occurs whenever a payment method is detached from a customer.
  const PaymentMethodDetachedEvent({required this.object});

  factory PaymentMethodDetachedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return PaymentMethodDetachedEvent(
      object: PaymentMethod.fromJson(map['object']),
    );
  }

  final PaymentMethod object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever a payment method is updated via the \[PaymentMethod update API\](https://stripe.com/docs/api/payment_methods/update).
final class PaymentMethodUpdatedEvent implements StripeEvent {
  /// Occurs whenever a payment method is updated via the \[PaymentMethod update API\](https://stripe.com/docs/api/payment_methods/update).
  const PaymentMethodUpdatedEvent({required this.object});

  factory PaymentMethodUpdatedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return PaymentMethodUpdatedEvent(
      object: PaymentMethod.fromJson(map['object']),
    );
  }

  final PaymentMethod object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever a payout is canceled.
final class PayoutCanceledEvent implements StripeEvent {
  /// Occurs whenever a payout is canceled.
  const PayoutCanceledEvent({required this.object});

  factory PayoutCanceledEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return PayoutCanceledEvent(object: Payout.fromJson(map['object']));
  }

  final Payout object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever a payout is created.
final class PayoutCreatedEvent implements StripeEvent {
  /// Occurs whenever a payout is created.
  const PayoutCreatedEvent({required this.object});

  factory PayoutCreatedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return PayoutCreatedEvent(object: Payout.fromJson(map['object']));
  }

  final Payout object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever a payout attempt fails.
final class PayoutFailedEvent implements StripeEvent {
  /// Occurs whenever a payout attempt fails.
  const PayoutFailedEvent({required this.object});

  factory PayoutFailedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return PayoutFailedEvent(object: Payout.fromJson(map['object']));
  }

  final Payout object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever a payout is *expected* to be available in the destination account. If the payout fails, a \`payout.failed\` notification is also sent, at a later time.
final class PayoutPaidEvent implements StripeEvent {
  /// Occurs whenever a payout is *expected* to be available in the destination account. If the payout fails, a \`payout.failed\` notification is also sent, at a later time.
  const PayoutPaidEvent({required this.object});

  factory PayoutPaidEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return PayoutPaidEvent(object: Payout.fromJson(map['object']));
  }

  final Payout object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever balance transactions paid out in an automatic payout can be queried.
final class PayoutReconciliationCompletedEvent implements StripeEvent {
  /// Occurs whenever balance transactions paid out in an automatic payout can be queried.
  const PayoutReconciliationCompletedEvent({required this.object});

  factory PayoutReconciliationCompletedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return PayoutReconciliationCompletedEvent(
      object: Payout.fromJson(map['object']),
    );
  }

  final Payout object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever a payout is updated.
final class PayoutUpdatedEvent implements StripeEvent {
  /// Occurs whenever a payout is updated.
  const PayoutUpdatedEvent({required this.object});

  factory PayoutUpdatedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return PayoutUpdatedEvent(object: Payout.fromJson(map['object']));
  }

  final Payout object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever a person associated with an account is created.
final class PersonCreatedEvent implements StripeEvent {
  /// Occurs whenever a person associated with an account is created.
  const PersonCreatedEvent({required this.object});

  factory PersonCreatedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return PersonCreatedEvent(object: Person.fromJson(map['object']));
  }

  final Person object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever a person associated with an account is deleted.
final class PersonDeletedEvent implements StripeEvent {
  /// Occurs whenever a person associated with an account is deleted.
  const PersonDeletedEvent({required this.object});

  factory PersonDeletedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return PersonDeletedEvent(object: Person.fromJson(map['object']));
  }

  final Person object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever a person associated with an account is updated.
final class PersonUpdatedEvent implements StripeEvent {
  /// Occurs whenever a person associated with an account is updated.
  const PersonUpdatedEvent({required this.object});

  factory PersonUpdatedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return PersonUpdatedEvent(object: Person.fromJson(map['object']));
  }

  final Person object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever a plan is created.
final class PlanCreatedEvent implements StripeEvent {
  /// Occurs whenever a plan is created.
  const PlanCreatedEvent({required this.object});

  factory PlanCreatedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return PlanCreatedEvent(object: Plan.fromJson(map['object']));
  }

  final Plan object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever a plan is deleted.
final class PlanDeletedEvent implements StripeEvent {
  /// Occurs whenever a plan is deleted.
  const PlanDeletedEvent({required this.object});

  factory PlanDeletedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return PlanDeletedEvent(object: Plan.fromJson(map['object']));
  }

  final Plan object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever a plan is updated.
final class PlanUpdatedEvent implements StripeEvent {
  /// Occurs whenever a plan is updated.
  const PlanUpdatedEvent({required this.object});

  factory PlanUpdatedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return PlanUpdatedEvent(object: Plan.fromJson(map['object']));
  }

  final Plan object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever a price is created.
final class PriceCreatedEvent implements StripeEvent {
  /// Occurs whenever a price is created.
  const PriceCreatedEvent({required this.object});

  factory PriceCreatedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return PriceCreatedEvent(object: Price.fromJson(map['object']));
  }

  final Price object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever a price is deleted.
final class PriceDeletedEvent implements StripeEvent {
  /// Occurs whenever a price is deleted.
  const PriceDeletedEvent({required this.object});

  factory PriceDeletedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return PriceDeletedEvent(object: Price.fromJson(map['object']));
  }

  final Price object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever a price is updated.
final class PriceUpdatedEvent implements StripeEvent {
  /// Occurs whenever a price is updated.
  const PriceUpdatedEvent({required this.object});

  factory PriceUpdatedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return PriceUpdatedEvent(object: Price.fromJson(map['object']));
  }

  final Price object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever a product is created.
final class ProductCreatedEvent implements StripeEvent {
  /// Occurs whenever a product is created.
  const ProductCreatedEvent({required this.object});

  factory ProductCreatedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return ProductCreatedEvent(object: Product.fromJson(map['object']));
  }

  final Product object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever a product is deleted.
final class ProductDeletedEvent implements StripeEvent {
  /// Occurs whenever a product is deleted.
  const ProductDeletedEvent({required this.object});

  factory ProductDeletedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return ProductDeletedEvent(object: Product.fromJson(map['object']));
  }

  final Product object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever a product is updated.
final class ProductUpdatedEvent implements StripeEvent {
  /// Occurs whenever a product is updated.
  const ProductUpdatedEvent({required this.object});

  factory ProductUpdatedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return ProductUpdatedEvent(object: Product.fromJson(map['object']));
  }

  final Product object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever a promotion code is created.
final class PromotionCodeCreatedEvent implements StripeEvent {
  /// Occurs whenever a promotion code is created.
  const PromotionCodeCreatedEvent({required this.object});

  factory PromotionCodeCreatedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return PromotionCodeCreatedEvent(
      object: PromotionCode.fromJson(map['object']),
    );
  }

  final PromotionCode object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever a promotion code is updated.
final class PromotionCodeUpdatedEvent implements StripeEvent {
  /// Occurs whenever a promotion code is updated.
  const PromotionCodeUpdatedEvent({required this.object});

  factory PromotionCodeUpdatedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return PromotionCodeUpdatedEvent(
      object: PromotionCode.fromJson(map['object']),
    );
  }

  final PromotionCode object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever a quote is accepted.
final class QuoteAcceptedEvent implements StripeEvent {
  /// Occurs whenever a quote is accepted.
  const QuoteAcceptedEvent({required this.object});

  factory QuoteAcceptedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return QuoteAcceptedEvent(object: Quote.fromJson(map['object']));
  }

  final Quote object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever a quote is canceled.
final class QuoteCanceledEvent implements StripeEvent {
  /// Occurs whenever a quote is canceled.
  const QuoteCanceledEvent({required this.object});

  factory QuoteCanceledEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return QuoteCanceledEvent(object: Quote.fromJson(map['object']));
  }

  final Quote object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever a quote is created.
final class QuoteCreatedEvent implements StripeEvent {
  /// Occurs whenever a quote is created.
  const QuoteCreatedEvent({required this.object});

  factory QuoteCreatedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return QuoteCreatedEvent(object: Quote.fromJson(map['object']));
  }

  final Quote object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever a quote is finalized.
final class QuoteFinalizedEvent implements StripeEvent {
  /// Occurs whenever a quote is finalized.
  const QuoteFinalizedEvent({required this.object});

  factory QuoteFinalizedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return QuoteFinalizedEvent(object: Quote.fromJson(map['object']));
  }

  final Quote object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever an early fraud warning is created.
final class RadarEarlyFraudWarningCreatedEvent implements StripeEvent {
  /// Occurs whenever an early fraud warning is created.
  const RadarEarlyFraudWarningCreatedEvent({required this.object});

  factory RadarEarlyFraudWarningCreatedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return RadarEarlyFraudWarningCreatedEvent(
      object: RadarEarlyFraudWarning.fromJson(map['object']),
    );
  }

  final RadarEarlyFraudWarning object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever an early fraud warning is updated.
final class RadarEarlyFraudWarningUpdatedEvent implements StripeEvent {
  /// Occurs whenever an early fraud warning is updated.
  const RadarEarlyFraudWarningUpdatedEvent({required this.object});

  factory RadarEarlyFraudWarningUpdatedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return RadarEarlyFraudWarningUpdatedEvent(
      object: RadarEarlyFraudWarning.fromJson(map['object']),
    );
  }

  final RadarEarlyFraudWarning object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever a refund from a customer's cash balance is created.
final class RefundCreatedEvent implements StripeEvent {
  /// Occurs whenever a refund from a customer's cash balance is created.
  const RefundCreatedEvent({required this.object});

  factory RefundCreatedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return RefundCreatedEvent(object: Refund.fromJson(map['object']));
  }

  final Refund object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever a refund from a customer's cash balance is updated.
final class RefundUpdatedEvent implements StripeEvent {
  /// Occurs whenever a refund from a customer's cash balance is updated.
  const RefundUpdatedEvent({required this.object});

  factory RefundUpdatedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return RefundUpdatedEvent(object: Refund.fromJson(map['object']));
  }

  final Refund object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever a requested \`ReportRun\` failed to complete.
final class ReportingReportRunFailedEvent implements StripeEvent {
  /// Occurs whenever a requested \`ReportRun\` failed to complete.
  const ReportingReportRunFailedEvent({required this.object});

  factory ReportingReportRunFailedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return ReportingReportRunFailedEvent(
      object: ReportingReportRun.fromJson(map['object']),
    );
  }

  final ReportingReportRun object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever a requested \`ReportRun\` completed successfully.
final class ReportingReportRunSucceededEvent implements StripeEvent {
  /// Occurs whenever a requested \`ReportRun\` completed successfully.
  const ReportingReportRunSucceededEvent({required this.object});

  factory ReportingReportRunSucceededEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return ReportingReportRunSucceededEvent(
      object: ReportingReportRun.fromJson(map['object']),
    );
  }

  final ReportingReportRun object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever a \`ReportType\` is updated (typically to indicate that a new day's data has come available).
final class ReportingReportTypeUpdatedEvent implements StripeEvent {
  /// Occurs whenever a \`ReportType\` is updated (typically to indicate that a new day's data has come available).
  const ReportingReportTypeUpdatedEvent({required this.object});

  factory ReportingReportTypeUpdatedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return ReportingReportTypeUpdatedEvent(
      object: ReportingReportType.fromJson(map['object']),
    );
  }

  final ReportingReportType object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever a review is closed. The review's \`reason\` field indicates why: \`approved\`, \`disputed\`, \`refunded\`, or \`refunded\_as\_fraud\`.
final class ReviewClosedEvent implements StripeEvent {
  /// Occurs whenever a review is closed. The review's \`reason\` field indicates why: \`approved\`, \`disputed\`, \`refunded\`, or \`refunded\_as\_fraud\`.
  const ReviewClosedEvent({required this.object});

  factory ReviewClosedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return ReviewClosedEvent(object: Review.fromJson(map['object']));
  }

  final Review object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever a review is opened.
final class ReviewOpenedEvent implements StripeEvent {
  /// Occurs whenever a review is opened.
  const ReviewOpenedEvent({required this.object});

  factory ReviewOpenedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return ReviewOpenedEvent(object: Review.fromJson(map['object']));
  }

  final Review object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs when a SetupIntent is canceled.
final class SetupIntentCanceledEvent implements StripeEvent {
  /// Occurs when a SetupIntent is canceled.
  const SetupIntentCanceledEvent({required this.object});

  factory SetupIntentCanceledEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return SetupIntentCanceledEvent(
      object: SetupIntent.fromJson(map['object']),
    );
  }

  final SetupIntent object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs when a new SetupIntent is created.
final class SetupIntentCreatedEvent implements StripeEvent {
  /// Occurs when a new SetupIntent is created.
  const SetupIntentCreatedEvent({required this.object});

  factory SetupIntentCreatedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return SetupIntentCreatedEvent(object: SetupIntent.fromJson(map['object']));
  }

  final SetupIntent object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs when a SetupIntent is in requires_action state.
final class SetupIntentRequiresActionEvent implements StripeEvent {
  /// Occurs when a SetupIntent is in requires_action state.
  const SetupIntentRequiresActionEvent({required this.object});

  factory SetupIntentRequiresActionEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return SetupIntentRequiresActionEvent(
      object: SetupIntent.fromJson(map['object']),
    );
  }

  final SetupIntent object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs when a SetupIntent has failed the attempt to setup a payment method.
final class SetupIntentSetupFailedEvent implements StripeEvent {
  /// Occurs when a SetupIntent has failed the attempt to setup a payment method.
  const SetupIntentSetupFailedEvent({required this.object});

  factory SetupIntentSetupFailedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return SetupIntentSetupFailedEvent(
      object: SetupIntent.fromJson(map['object']),
    );
  }

  final SetupIntent object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs when an SetupIntent has successfully setup a payment method.
final class SetupIntentSucceededEvent implements StripeEvent {
  /// Occurs when an SetupIntent has successfully setup a payment method.
  const SetupIntentSucceededEvent({required this.object});

  factory SetupIntentSucceededEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return SetupIntentSucceededEvent(
      object: SetupIntent.fromJson(map['object']),
    );
  }

  final SetupIntent object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever a Sigma scheduled query run finishes.
final class SigmaScheduledQueryRunCreatedEvent implements StripeEvent {
  /// Occurs whenever a Sigma scheduled query run finishes.
  const SigmaScheduledQueryRunCreatedEvent({required this.object});

  factory SigmaScheduledQueryRunCreatedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return SigmaScheduledQueryRunCreatedEvent(
      object: ScheduledQueryRun.fromJson(map['object']),
    );
  }

  final ScheduledQueryRun object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever a source is canceled.
final class SourceCanceledEvent implements StripeEvent {
  /// Occurs whenever a source is canceled.
  const SourceCanceledEvent({required this.object});

  factory SourceCanceledEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return SourceCanceledEvent(object: Source.fromJson(map['object']));
  }

  final Source object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever a source transitions to chargeable.
final class SourceChargeableEvent implements StripeEvent {
  /// Occurs whenever a source transitions to chargeable.
  const SourceChargeableEvent({required this.object});

  factory SourceChargeableEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return SourceChargeableEvent(object: Source.fromJson(map['object']));
  }

  final Source object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever a source fails.
final class SourceFailedEvent implements StripeEvent {
  /// Occurs whenever a source fails.
  const SourceFailedEvent({required this.object});

  factory SourceFailedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return SourceFailedEvent(object: Source.fromJson(map['object']));
  }

  final Source object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever a source mandate notification method is set to manual.
final class SourceMandateNotificationEvent implements StripeEvent {
  /// Occurs whenever a source mandate notification method is set to manual.
  const SourceMandateNotificationEvent({required this.object});

  factory SourceMandateNotificationEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return SourceMandateNotificationEvent(
      object: SourceMandateNotification.fromJson(map['object']),
    );
  }

  final SourceMandateNotification object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever the refund attributes are required on a receiver source to process a refund or a mispayment.
final class SourceRefundAttributesRequiredEvent implements StripeEvent {
  /// Occurs whenever the refund attributes are required on a receiver source to process a refund or a mispayment.
  const SourceRefundAttributesRequiredEvent({required this.object});

  factory SourceRefundAttributesRequiredEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return SourceRefundAttributesRequiredEvent(
      object: Source.fromJson(map['object']),
    );
  }

  final Source object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever a source transaction is created.
final class SourceTransactionCreatedEvent implements StripeEvent {
  /// Occurs whenever a source transaction is created.
  const SourceTransactionCreatedEvent({required this.object});

  factory SourceTransactionCreatedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return SourceTransactionCreatedEvent(
      object: SourceTransaction.fromJson(map['object']),
    );
  }

  final SourceTransaction object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever a source transaction is updated.
final class SourceTransactionUpdatedEvent implements StripeEvent {
  /// Occurs whenever a source transaction is updated.
  const SourceTransactionUpdatedEvent({required this.object});

  factory SourceTransactionUpdatedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return SourceTransactionUpdatedEvent(
      object: SourceTransaction.fromJson(map['object']),
    );
  }

  final SourceTransaction object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever a subscription schedule is canceled due to the underlying subscription being canceled because of delinquency.
final class SubscriptionScheduleAbortedEvent implements StripeEvent {
  /// Occurs whenever a subscription schedule is canceled due to the underlying subscription being canceled because of delinquency.
  const SubscriptionScheduleAbortedEvent({required this.object});

  factory SubscriptionScheduleAbortedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return SubscriptionScheduleAbortedEvent(
      object: SubscriptionSchedule.fromJson(map['object']),
    );
  }

  final SubscriptionSchedule object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever a subscription schedule is canceled.
final class SubscriptionScheduleCanceledEvent implements StripeEvent {
  /// Occurs whenever a subscription schedule is canceled.
  const SubscriptionScheduleCanceledEvent({required this.object});

  factory SubscriptionScheduleCanceledEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return SubscriptionScheduleCanceledEvent(
      object: SubscriptionSchedule.fromJson(map['object']),
    );
  }

  final SubscriptionSchedule object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever a new subscription schedule is completed.
final class SubscriptionScheduleCompletedEvent implements StripeEvent {
  /// Occurs whenever a new subscription schedule is completed.
  const SubscriptionScheduleCompletedEvent({required this.object});

  factory SubscriptionScheduleCompletedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return SubscriptionScheduleCompletedEvent(
      object: SubscriptionSchedule.fromJson(map['object']),
    );
  }

  final SubscriptionSchedule object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever a new subscription schedule is created.
final class SubscriptionScheduleCreatedEvent implements StripeEvent {
  /// Occurs whenever a new subscription schedule is created.
  const SubscriptionScheduleCreatedEvent({required this.object});

  factory SubscriptionScheduleCreatedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return SubscriptionScheduleCreatedEvent(
      object: SubscriptionSchedule.fromJson(map['object']),
    );
  }

  final SubscriptionSchedule object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs 7 days before a subscription schedule will expire.
final class SubscriptionScheduleExpiringEvent implements StripeEvent {
  /// Occurs 7 days before a subscription schedule will expire.
  const SubscriptionScheduleExpiringEvent({required this.object});

  factory SubscriptionScheduleExpiringEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return SubscriptionScheduleExpiringEvent(
      object: SubscriptionSchedule.fromJson(map['object']),
    );
  }

  final SubscriptionSchedule object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever a new subscription schedule is released.
final class SubscriptionScheduleReleasedEvent implements StripeEvent {
  /// Occurs whenever a new subscription schedule is released.
  const SubscriptionScheduleReleasedEvent({required this.object});

  factory SubscriptionScheduleReleasedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return SubscriptionScheduleReleasedEvent(
      object: SubscriptionSchedule.fromJson(map['object']),
    );
  }

  final SubscriptionSchedule object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever a subscription schedule is updated.
final class SubscriptionScheduleUpdatedEvent implements StripeEvent {
  /// Occurs whenever a subscription schedule is updated.
  const SubscriptionScheduleUpdatedEvent({required this.object});

  factory SubscriptionScheduleUpdatedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return SubscriptionScheduleUpdatedEvent(
      object: SubscriptionSchedule.fromJson(map['object']),
    );
  }

  final SubscriptionSchedule object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever tax settings is updated.
final class TaxSettingsUpdatedEvent implements StripeEvent {
  /// Occurs whenever tax settings is updated.
  const TaxSettingsUpdatedEvent({required this.object});

  factory TaxSettingsUpdatedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return TaxSettingsUpdatedEvent(object: TaxSettings.fromJson(map['object']));
  }

  final TaxSettings object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever a new tax rate is created.
final class TaxRateCreatedEvent implements StripeEvent {
  /// Occurs whenever a new tax rate is created.
  const TaxRateCreatedEvent({required this.object});

  factory TaxRateCreatedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return TaxRateCreatedEvent(object: TaxRate.fromJson(map['object']));
  }

  final TaxRate object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever a tax rate is updated.
final class TaxRateUpdatedEvent implements StripeEvent {
  /// Occurs whenever a tax rate is updated.
  const TaxRateUpdatedEvent({required this.object});

  factory TaxRateUpdatedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return TaxRateUpdatedEvent(object: TaxRate.fromJson(map['object']));
  }

  final TaxRate object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever an action sent to a Terminal reader failed.
final class TerminalReaderActionFailedEvent implements StripeEvent {
  /// Occurs whenever an action sent to a Terminal reader failed.
  const TerminalReaderActionFailedEvent({required this.object});

  factory TerminalReaderActionFailedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return TerminalReaderActionFailedEvent(
      object: TerminalReader.fromJson(map['object']),
    );
  }

  final TerminalReader object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever an action sent to a Terminal reader was successful.
final class TerminalReaderActionSucceededEvent implements StripeEvent {
  /// Occurs whenever an action sent to a Terminal reader was successful.
  const TerminalReaderActionSucceededEvent({required this.object});

  factory TerminalReaderActionSucceededEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return TerminalReaderActionSucceededEvent(
      object: TerminalReader.fromJson(map['object']),
    );
  }

  final TerminalReader object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever a test clock starts advancing.
final class TestHelpersTestClockAdvancingEvent implements StripeEvent {
  /// Occurs whenever a test clock starts advancing.
  const TestHelpersTestClockAdvancingEvent({required this.object});

  factory TestHelpersTestClockAdvancingEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return TestHelpersTestClockAdvancingEvent(
      object: TestHelpersTestClock.fromJson(map['object']),
    );
  }

  final TestHelpersTestClock object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever a test clock is created.
final class TestHelpersTestClockCreatedEvent implements StripeEvent {
  /// Occurs whenever a test clock is created.
  const TestHelpersTestClockCreatedEvent({required this.object});

  factory TestHelpersTestClockCreatedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return TestHelpersTestClockCreatedEvent(
      object: TestHelpersTestClock.fromJson(map['object']),
    );
  }

  final TestHelpersTestClock object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever a test clock is deleted.
final class TestHelpersTestClockDeletedEvent implements StripeEvent {
  /// Occurs whenever a test clock is deleted.
  const TestHelpersTestClockDeletedEvent({required this.object});

  factory TestHelpersTestClockDeletedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return TestHelpersTestClockDeletedEvent(
      object: TestHelpersTestClock.fromJson(map['object']),
    );
  }

  final TestHelpersTestClock object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever a test clock fails to advance its frozen time.
final class TestHelpersTestClockInternalFailureEvent implements StripeEvent {
  /// Occurs whenever a test clock fails to advance its frozen time.
  const TestHelpersTestClockInternalFailureEvent({required this.object});

  factory TestHelpersTestClockInternalFailureEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return TestHelpersTestClockInternalFailureEvent(
      object: TestHelpersTestClock.fromJson(map['object']),
    );
  }

  final TestHelpersTestClock object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever a test clock transitions to a ready status.
final class TestHelpersTestClockReadyEvent implements StripeEvent {
  /// Occurs whenever a test clock transitions to a ready status.
  const TestHelpersTestClockReadyEvent({required this.object});

  factory TestHelpersTestClockReadyEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return TestHelpersTestClockReadyEvent(
      object: TestHelpersTestClock.fromJson(map['object']),
    );
  }

  final TestHelpersTestClock object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever a top-up is canceled.
final class TopupCanceledEvent implements StripeEvent {
  /// Occurs whenever a top-up is canceled.
  const TopupCanceledEvent({required this.object});

  factory TopupCanceledEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return TopupCanceledEvent(object: Topup.fromJson(map['object']));
  }

  final Topup object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever a top-up is created.
final class TopupCreatedEvent implements StripeEvent {
  /// Occurs whenever a top-up is created.
  const TopupCreatedEvent({required this.object});

  factory TopupCreatedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return TopupCreatedEvent(object: Topup.fromJson(map['object']));
  }

  final Topup object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever a top-up fails.
final class TopupFailedEvent implements StripeEvent {
  /// Occurs whenever a top-up fails.
  const TopupFailedEvent({required this.object});

  factory TopupFailedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return TopupFailedEvent(object: Topup.fromJson(map['object']));
  }

  final Topup object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever a top-up is reversed.
final class TopupReversedEvent implements StripeEvent {
  /// Occurs whenever a top-up is reversed.
  const TopupReversedEvent({required this.object});

  factory TopupReversedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return TopupReversedEvent(object: Topup.fromJson(map['object']));
  }

  final Topup object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever a top-up succeeds.
final class TopupSucceededEvent implements StripeEvent {
  /// Occurs whenever a top-up succeeds.
  const TopupSucceededEvent({required this.object});

  factory TopupSucceededEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return TopupSucceededEvent(object: Topup.fromJson(map['object']));
  }

  final Topup object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever a transfer is created.
final class TransferCreatedEvent implements StripeEvent {
  /// Occurs whenever a transfer is created.
  const TransferCreatedEvent({required this.object});

  factory TransferCreatedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return TransferCreatedEvent(object: Transfer.fromJson(map['object']));
  }

  final Transfer object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever a transfer is reversed, including partial reversals.
final class TransferReversedEvent implements StripeEvent {
  /// Occurs whenever a transfer is reversed, including partial reversals.
  const TransferReversedEvent({required this.object});

  factory TransferReversedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return TransferReversedEvent(object: Transfer.fromJson(map['object']));
  }

  final Transfer object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever a transfer's description or metadata is updated.
final class TransferUpdatedEvent implements StripeEvent {
  /// Occurs whenever a transfer's description or metadata is updated.
  const TransferUpdatedEvent({required this.object});

  factory TransferUpdatedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return TransferUpdatedEvent(object: Transfer.fromJson(map['object']));
  }

  final Transfer object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever an CreditReversal is submitted and created.
final class TreasuryCreditReversalCreatedEvent implements StripeEvent {
  /// Occurs whenever an CreditReversal is submitted and created.
  const TreasuryCreditReversalCreatedEvent({required this.object});

  factory TreasuryCreditReversalCreatedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return TreasuryCreditReversalCreatedEvent(
      object: TreasuryCreditReversal.fromJson(map['object']),
    );
  }

  final TreasuryCreditReversal object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever an CreditReversal post is posted.
final class TreasuryCreditReversalPostedEvent implements StripeEvent {
  /// Occurs whenever an CreditReversal post is posted.
  const TreasuryCreditReversalPostedEvent({required this.object});

  factory TreasuryCreditReversalPostedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return TreasuryCreditReversalPostedEvent(
      object: TreasuryCreditReversal.fromJson(map['object']),
    );
  }

  final TreasuryCreditReversal object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever a DebitReversal is completed.
final class TreasuryDebitReversalCompletedEvent implements StripeEvent {
  /// Occurs whenever a DebitReversal is completed.
  const TreasuryDebitReversalCompletedEvent({required this.object});

  factory TreasuryDebitReversalCompletedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return TreasuryDebitReversalCompletedEvent(
      object: TreasuryDebitReversal.fromJson(map['object']),
    );
  }

  final TreasuryDebitReversal object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever a DebitReversal is created.
final class TreasuryDebitReversalCreatedEvent implements StripeEvent {
  /// Occurs whenever a DebitReversal is created.
  const TreasuryDebitReversalCreatedEvent({required this.object});

  factory TreasuryDebitReversalCreatedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return TreasuryDebitReversalCreatedEvent(
      object: TreasuryDebitReversal.fromJson(map['object']),
    );
  }

  final TreasuryDebitReversal object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever an initial credit is granted on a DebitReversal.
final class TreasuryDebitReversalInitialCreditGrantedEvent
    implements StripeEvent {
  /// Occurs whenever an initial credit is granted on a DebitReversal.
  const TreasuryDebitReversalInitialCreditGrantedEvent({required this.object});

  factory TreasuryDebitReversalInitialCreditGrantedEvent.fromJson(
    Object? json,
  ) {
    final map = (json as Map<String, Object?>);
    return TreasuryDebitReversalInitialCreditGrantedEvent(
      object: TreasuryDebitReversal.fromJson(map['object']),
    );
  }

  final TreasuryDebitReversal object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever the status of the FinancialAccount becomes closed.
final class TreasuryFinancialAccountClosedEvent implements StripeEvent {
  /// Occurs whenever the status of the FinancialAccount becomes closed.
  const TreasuryFinancialAccountClosedEvent({required this.object});

  factory TreasuryFinancialAccountClosedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return TreasuryFinancialAccountClosedEvent(
      object: TreasuryFinancialAccount.fromJson(map['object']),
    );
  }

  final TreasuryFinancialAccount object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever a new FinancialAccount is created.
final class TreasuryFinancialAccountCreatedEvent implements StripeEvent {
  /// Occurs whenever a new FinancialAccount is created.
  const TreasuryFinancialAccountCreatedEvent({required this.object});

  factory TreasuryFinancialAccountCreatedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return TreasuryFinancialAccountCreatedEvent(
      object: TreasuryFinancialAccount.fromJson(map['object']),
    );
  }

  final TreasuryFinancialAccount object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever the statuses of any features within an existing FinancialAccount are updated.
final class TreasuryFinancialAccountFeaturesStatusUpdatedEvent
    implements StripeEvent {
  /// Occurs whenever the statuses of any features within an existing FinancialAccount are updated.
  const TreasuryFinancialAccountFeaturesStatusUpdatedEvent({
    required this.object,
  });

  factory TreasuryFinancialAccountFeaturesStatusUpdatedEvent.fromJson(
    Object? json,
  ) {
    final map = (json as Map<String, Object?>);
    return TreasuryFinancialAccountFeaturesStatusUpdatedEvent(
      object: TreasuryFinancialAccount.fromJson(map['object']),
    );
  }

  final TreasuryFinancialAccount object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever an InboundTransfer is canceled.
final class TreasuryInboundTransferCanceledEvent implements StripeEvent {
  /// Occurs whenever an InboundTransfer is canceled.
  const TreasuryInboundTransferCanceledEvent({required this.object});

  factory TreasuryInboundTransferCanceledEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return TreasuryInboundTransferCanceledEvent(
      object: TreasuryInboundTransfer.fromJson(map['object']),
    );
  }

  final TreasuryInboundTransfer object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever an InboundTransfer is created.
final class TreasuryInboundTransferCreatedEvent implements StripeEvent {
  /// Occurs whenever an InboundTransfer is created.
  const TreasuryInboundTransferCreatedEvent({required this.object});

  factory TreasuryInboundTransferCreatedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return TreasuryInboundTransferCreatedEvent(
      object: TreasuryInboundTransfer.fromJson(map['object']),
    );
  }

  final TreasuryInboundTransfer object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever an InboundTransfer has failed.
final class TreasuryInboundTransferFailedEvent implements StripeEvent {
  /// Occurs whenever an InboundTransfer has failed.
  const TreasuryInboundTransferFailedEvent({required this.object});

  factory TreasuryInboundTransferFailedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return TreasuryInboundTransferFailedEvent(
      object: TreasuryInboundTransfer.fromJson(map['object']),
    );
  }

  final TreasuryInboundTransfer object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever an InboundTransfer has succeeded.
final class TreasuryInboundTransferSucceededEvent implements StripeEvent {
  /// Occurs whenever an InboundTransfer has succeeded.
  const TreasuryInboundTransferSucceededEvent({required this.object});

  factory TreasuryInboundTransferSucceededEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return TreasuryInboundTransferSucceededEvent(
      object: TreasuryInboundTransfer.fromJson(map['object']),
    );
  }

  final TreasuryInboundTransfer object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever an OutboundPayment is canceled.
final class TreasuryOutboundPaymentCanceledEvent implements StripeEvent {
  /// Occurs whenever an OutboundPayment is canceled.
  const TreasuryOutboundPaymentCanceledEvent({required this.object});

  factory TreasuryOutboundPaymentCanceledEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return TreasuryOutboundPaymentCanceledEvent(
      object: TreasuryOutboundPayment.fromJson(map['object']),
    );
  }

  final TreasuryOutboundPayment object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever a new OutboundPayment is successfully created.
final class TreasuryOutboundPaymentCreatedEvent implements StripeEvent {
  /// Occurs whenever a new OutboundPayment is successfully created.
  const TreasuryOutboundPaymentCreatedEvent({required this.object});

  factory TreasuryOutboundPaymentCreatedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return TreasuryOutboundPaymentCreatedEvent(
      object: TreasuryOutboundPayment.fromJson(map['object']),
    );
  }

  final TreasuryOutboundPayment object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever the arrival date on an OutboundPayment updates.
final class TreasuryOutboundPaymentExpectedArrivalDateUpdatedEvent
    implements StripeEvent {
  /// Occurs whenever the arrival date on an OutboundPayment updates.
  const TreasuryOutboundPaymentExpectedArrivalDateUpdatedEvent({
    required this.object,
  });

  factory TreasuryOutboundPaymentExpectedArrivalDateUpdatedEvent.fromJson(
    Object? json,
  ) {
    final map = (json as Map<String, Object?>);
    return TreasuryOutboundPaymentExpectedArrivalDateUpdatedEvent(
      object: TreasuryOutboundPayment.fromJson(map['object']),
    );
  }

  final TreasuryOutboundPayment object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever an OutboundPayment fails.
final class TreasuryOutboundPaymentFailedEvent implements StripeEvent {
  /// Occurs whenever an OutboundPayment fails.
  const TreasuryOutboundPaymentFailedEvent({required this.object});

  factory TreasuryOutboundPaymentFailedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return TreasuryOutboundPaymentFailedEvent(
      object: TreasuryOutboundPayment.fromJson(map['object']),
    );
  }

  final TreasuryOutboundPayment object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever an OutboundPayment posts.
final class TreasuryOutboundPaymentPostedEvent implements StripeEvent {
  /// Occurs whenever an OutboundPayment posts.
  const TreasuryOutboundPaymentPostedEvent({required this.object});

  factory TreasuryOutboundPaymentPostedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return TreasuryOutboundPaymentPostedEvent(
      object: TreasuryOutboundPayment.fromJson(map['object']),
    );
  }

  final TreasuryOutboundPayment object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever an OutboundPayment was returned.
final class TreasuryOutboundPaymentReturnedEvent implements StripeEvent {
  /// Occurs whenever an OutboundPayment was returned.
  const TreasuryOutboundPaymentReturnedEvent({required this.object});

  factory TreasuryOutboundPaymentReturnedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return TreasuryOutboundPaymentReturnedEvent(
      object: TreasuryOutboundPayment.fromJson(map['object']),
    );
  }

  final TreasuryOutboundPayment object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever an OutboundTransfer is canceled.
final class TreasuryOutboundTransferCanceledEvent implements StripeEvent {
  /// Occurs whenever an OutboundTransfer is canceled.
  const TreasuryOutboundTransferCanceledEvent({required this.object});

  factory TreasuryOutboundTransferCanceledEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return TreasuryOutboundTransferCanceledEvent(
      object: TreasuryOutboundTransfer.fromJson(map['object']),
    );
  }

  final TreasuryOutboundTransfer object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever an OutboundTransfer is created.
final class TreasuryOutboundTransferCreatedEvent implements StripeEvent {
  /// Occurs whenever an OutboundTransfer is created.
  const TreasuryOutboundTransferCreatedEvent({required this.object});

  factory TreasuryOutboundTransferCreatedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return TreasuryOutboundTransferCreatedEvent(
      object: TreasuryOutboundTransfer.fromJson(map['object']),
    );
  }

  final TreasuryOutboundTransfer object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever the arrival date on an OutboundTransfer updates.
final class TreasuryOutboundTransferExpectedArrivalDateUpdatedEvent
    implements StripeEvent {
  /// Occurs whenever the arrival date on an OutboundTransfer updates.
  const TreasuryOutboundTransferExpectedArrivalDateUpdatedEvent({
    required this.object,
  });

  factory TreasuryOutboundTransferExpectedArrivalDateUpdatedEvent.fromJson(
    Object? json,
  ) {
    final map = (json as Map<String, Object?>);
    return TreasuryOutboundTransferExpectedArrivalDateUpdatedEvent(
      object: TreasuryOutboundTransfer.fromJson(map['object']),
    );
  }

  final TreasuryOutboundTransfer object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever an OutboundTransfer has failed.
final class TreasuryOutboundTransferFailedEvent implements StripeEvent {
  /// Occurs whenever an OutboundTransfer has failed.
  const TreasuryOutboundTransferFailedEvent({required this.object});

  factory TreasuryOutboundTransferFailedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return TreasuryOutboundTransferFailedEvent(
      object: TreasuryOutboundTransfer.fromJson(map['object']),
    );
  }

  final TreasuryOutboundTransfer object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever an OutboundTransfer is posted.
final class TreasuryOutboundTransferPostedEvent implements StripeEvent {
  /// Occurs whenever an OutboundTransfer is posted.
  const TreasuryOutboundTransferPostedEvent({required this.object});

  factory TreasuryOutboundTransferPostedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return TreasuryOutboundTransferPostedEvent(
      object: TreasuryOutboundTransfer.fromJson(map['object']),
    );
  }

  final TreasuryOutboundTransfer object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever an OutboundTransfer is returned.
final class TreasuryOutboundTransferReturnedEvent implements StripeEvent {
  /// Occurs whenever an OutboundTransfer is returned.
  const TreasuryOutboundTransferReturnedEvent({required this.object});

  factory TreasuryOutboundTransferReturnedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return TreasuryOutboundTransferReturnedEvent(
      object: TreasuryOutboundTransfer.fromJson(map['object']),
    );
  }

  final TreasuryOutboundTransfer object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever a received_credit is created as a result of funds being pushed by another account.
final class TreasuryReceivedCreditCreatedEvent implements StripeEvent {
  /// Occurs whenever a received_credit is created as a result of funds being pushed by another account.
  const TreasuryReceivedCreditCreatedEvent({required this.object});

  factory TreasuryReceivedCreditCreatedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return TreasuryReceivedCreditCreatedEvent(
      object: TreasuryReceivedCredit.fromJson(map['object']),
    );
  }

  final TreasuryReceivedCredit object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever a received_credit transitions to failed state. Only applicable for check deposits.
final class TreasuryReceivedCreditFailedEvent implements StripeEvent {
  /// Occurs whenever a received_credit transitions to failed state. Only applicable for check deposits.
  const TreasuryReceivedCreditFailedEvent({required this.object});

  factory TreasuryReceivedCreditFailedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return TreasuryReceivedCreditFailedEvent(
      object: TreasuryReceivedCredit.fromJson(map['object']),
    );
  }

  final TreasuryReceivedCredit object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever a received_credit transitions to succeeded state. Only applicable for check deposits.
final class TreasuryReceivedCreditSucceededEvent implements StripeEvent {
  /// Occurs whenever a received_credit transitions to succeeded state. Only applicable for check deposits.
  const TreasuryReceivedCreditSucceededEvent({required this.object});

  factory TreasuryReceivedCreditSucceededEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return TreasuryReceivedCreditSucceededEvent(
      object: TreasuryReceivedCredit.fromJson(map['object']),
    );
  }

  final TreasuryReceivedCredit object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}

/// Occurs whenever a received_debit is created as a result of funds being pulled by another account.
final class TreasuryReceivedDebitCreatedEvent implements StripeEvent {
  /// Occurs whenever a received_debit is created as a result of funds being pulled by another account.
  const TreasuryReceivedDebitCreatedEvent({required this.object});

  factory TreasuryReceivedDebitCreatedEvent.fromJson(Object? json) {
    final map = (json as Map<String, Object?>);
    return TreasuryReceivedDebitCreatedEvent(
      object: TreasuryReceivedDebit.fromJson(map['object']),
    );
  }

  final TreasuryReceivedDebit object;

  Map<String, Object?> toJson() => {'object': object.toJson()};
}
