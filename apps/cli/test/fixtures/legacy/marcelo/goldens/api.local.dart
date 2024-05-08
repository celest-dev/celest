// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:celest/src/runtime/serve.dart' as _i1;

import 'functions/exceptions/callsThrowsUserException.dart' as _i2;
import 'functions/exceptions/throwsAppError.dart' as _i3;
import 'functions/exceptions/throwsAppException.dart' as _i4;
import 'functions/exceptions/throwsNotYetImplementedError.dart' as _i5;
import 'functions/exceptions/throwsUserException.dart' as _i6;
import 'functions/exceptions/throwsUserException_ShowInConsole.dart' as _i7;
import 'functions/exceptions/throwsValidateError.dart' as _i8;
import 'functions/models/availableStock.dart' as _i9;
import 'functions/models/availableStocks.dart' as _i10;
import 'functions/models/cashBalance.dart' as _i11;
import 'functions/models/portfolio.dart' as _i12;
import 'functions/models/stock.dart' as _i13;
import 'functions/models/ui.dart' as _i14;

void main() {
  _i1.serve(targets: {
    '/exceptions/calls-throws-user-exception':
        _i2.CallsThrowsUserExceptionTarget(),
    '/exceptions/throws-app-error': _i3.ThrowsAppErrorTarget(),
    '/exceptions/throws-app-exception': _i4.ThrowsAppExceptionTarget(),
    '/exceptions/throws-not-yet-implemented-error':
        _i5.ThrowsNotYetImplementedErrorTarget(),
    '/exceptions/throws-user-exception': _i6.ThrowsUserExceptionTarget(),
    '/exceptions/throws-user-exception-show-in-console':
        _i7.ThrowsUserExceptionShowInConsoleTarget(),
    '/exceptions/throws-validate-error': _i8.ThrowsValidateErrorTarget(),
    '/models/available-stock': _i9.AvailableStockTarget(),
    '/models/available-stocks': _i10.AvailableStocksTarget(),
    '/models/cash-balance': _i11.CashBalanceTarget(),
    '/models/portfolio': _i12.PortfolioTarget(),
    '/models/stock': _i13.StockTarget(),
    '/models/ui': _i14.UiTarget(),
  });
}
