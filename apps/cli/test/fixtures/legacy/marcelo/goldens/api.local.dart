// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:io' as _i1;
import 'dart:isolate' as _i2;

import 'package:celest/src/runtime/serve.dart' as _i3;

import 'functions/exceptions/callsThrowsUserException.dart' as _i4;
import 'functions/exceptions/throwsAppError.dart' as _i5;
import 'functions/exceptions/throwsAppException.dart' as _i6;
import 'functions/exceptions/throwsNotYetImplementedError.dart' as _i7;
import 'functions/exceptions/throwsUserException.dart' as _i8;
import 'functions/exceptions/throwsUserException_ShowInConsole.dart' as _i9;
import 'functions/exceptions/throwsValidateError.dart' as _i10;
import 'functions/models/availableStock.dart' as _i11;
import 'functions/models/availableStocks.dart' as _i12;
import 'functions/models/cashBalance.dart' as _i13;
import 'functions/models/portfolio.dart' as _i14;
import 'functions/models/stock.dart' as _i15;
import 'functions/models/ui.dart' as _i16;

Future<void> main() async {
  await Future.wait(eagerError: true, [
    for (var i = 0; i < _i1.Platform.numberOfProcessors; i++)
      _i2.Isolate.run(start),
  ]);
}

Future<void> start() async {
  await _i3.serve(targets: {
    '/exceptions/calls-throws-user-exception':
        _i4.CallsThrowsUserExceptionTarget(),
    '/exceptions/throws-app-error': _i5.ThrowsAppErrorTarget(),
    '/exceptions/throws-app-exception': _i6.ThrowsAppExceptionTarget(),
    '/exceptions/throws-not-yet-implemented-error':
        _i7.ThrowsNotYetImplementedErrorTarget(),
    '/exceptions/throws-user-exception': _i8.ThrowsUserExceptionTarget(),
    '/exceptions/throws-user-exception-show-in-console':
        _i9.ThrowsUserExceptionShowInConsoleTarget(),
    '/exceptions/throws-validate-error': _i10.ThrowsValidateErrorTarget(),
    '/models/available-stock': _i11.AvailableStockTarget(),
    '/models/available-stocks': _i12.AvailableStocksTarget(),
    '/models/cash-balance': _i13.CashBalanceTarget(),
    '/models/portfolio': _i14.PortfolioTarget(),
    '/models/stock': _i15.StockTarget(),
    '/models/ui': _i16.UiTarget(),
  });
}
