import 'package:celest_cloud_auth/src/email/email_model.dart';
import 'package:mustache_template/mustache.dart';

enum VerificationCodeEmailType {
  login,
  register,
  generic;

  String get type => switch (this) {
        login => 'login',
        register => 'registration',
        generic => 'verification',
      };

  String get purpose => switch (this) {
        login => 'log in to',
        register => 'create an account with',
        generic => 'verify this email address with',
      };
}

final class VerificationCodeEmailParams {
  const VerificationCodeEmailParams({
    this.type = VerificationCodeEmailType.generic,
    required this.email,
    required this.code,
    required this.organizationName,
    this.name,
    this.logoUrl,
  });

  final VerificationCodeEmailType type;
  final String email;
  final String code;
  final String organizationName;
  final String? name;
  final String? logoUrl;

  Map<String, String> toTemplateParams() => {
        'email': email,
        'code': code,
        'organizationName': organizationName,
        if (name case final name?) 'name': name,
        if (logoUrl case final logoUrl?) 'logoUrl': logoUrl,
        'type': type.type,
        'purpose': type.purpose,
      };
}

final class VerificationCodeEmail
    implements EmailTemplate<VerificationCodeEmailParams> {
  const VerificationCodeEmail();

  static final Template _template = Template(
    _templateHtml,
    htmlEscapeValues: true,
  );

  @override
  String render(VerificationCodeEmailParams params) {
    return _template.renderString(params.toTemplateParams());
  }
}

const _templateHtml = r'''
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"><html lang="en" dir="ltr"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8"><meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=yes"><meta name="x-apple-disable-message-reformatting"><meta name="format-detection" content="telephone=no, date=no, address=no, email=no, url=no"><style tailwind>/* layer: preflights */
/* layer: default */
.mx-0{margin-left:0;margin-right:0;}
.mx-auto{margin-left:auto;margin-right:auto;}
.my-\[26px\]{margin-top:26px;margin-bottom:26px;}
.my-\[30px\]{margin-top:30px;margin-bottom:30px;}
.my-\[40px\]{margin-top:40px;margin-bottom:40px;}
.my-0{margin-top:0;margin-bottom:0;}
.my-auto{margin-top:auto;margin-bottom:auto;}
.mb-\[32px\]{margin-bottom:32px;}
.mt-\[32px\]{margin-top:32px;}
.w-\[465px\]{width:465px;}
.w-full{width:100%;}
.border-separate{border-collapse:separate;}
.border{border-width:1px;}
.border-\[\#eaeaea\]{border-color:rgb(234,234,234);}
.rounded{border-radius:4px;}
.border-solid{border-style:solid;}
.bg-white{background-color:rgb(255,255,255);}
.p-\[20px\]{padding:20px;}
.p-0{padding:0;}
.text-center{text-align:center;}
.\!text-\[12px\]{font-size:12px !important;}
.text-\[16px\]{font-size:16px;}
.text-\[18px\]{font-size:18px;}
.text-\[\#666666\]{color:rgb(102,102,102);}
.text-black{color:rgb(0,0,0);}
.font-normal{font-weight:400;}
.leading-\[24px\]{line-height:24px;}
.font-sans{font-family:ui-sans-serif,system-ui,-apple-system,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,"Noto Sans",sans-serif,"Apple Color Emoji","Segoe UI Emoji","Segoe UI Symbol","Noto Color Emoji";}</style></head><body class="bg-white my-auto mx-auto font-sans"><div data-skip="true" style="display:none;line-height:1px;max-height:0;max-width:0;opacity:0;overflow:hidden">Your {{ type }} code for {{ organizationName }} is {{ code }}</div><table align="center" width="100%" class="border-separate border border-solid border-[#eaeaea] rounded my-[40px] mx-auto p-[20px] w-[465px]" role="presentation" cellspacing="0" cellpadding="0" border="0" style="max-width:37.5em"><tbody><tr style="width:100%"><td><table align="center" width="100%" class="mt-[32px]" border="0" cellpadding="0" cellspacing="0" role="presentation"><tbody><tr><td><img class="my-0 mx-auto" alt="{{ organizationName }}" src="{{ logoUrl }}" height="80" style="border:none;display:block;outline:none;text-decoration:none"></td></tr></tbody></table><h1 class="text-black text-[18px] font-normal text-center p-0 my-[30px] mx-0" style>Your {{ type }} code for <strong>{{ organizationName }}</strong></h1><p class="text-black text-[16px] leading-[24px]" style="font-size:14px;line-height:24px;margin:16px 0">Hello{{ #name }} {{ name }}{{ /name }},</p><p class="text-black text-[16px] leading-[24px]" style="font-size:14px;line-height:24px;margin:16px 0">Your {{ type }} code for <strong>{{ organizationName }}</strong> is:</p><table align="center" width="100%" class="text-center mt-[32px] mb-[32px]" border="0" cellpadding="0" cellspacing="0" role="presentation"><tbody><tr><td><p style="font-size:36px;line-height:24px;margin:16px 0;font-weight:700;padding:4px 8px;letter-spacing:1px;border-radius:4px;color:#3c4149">{{ code }}</p></td></tr></tbody></table><p class="text-black text-[16px] leading-[24px]" style="font-size:14px;line-height:24px;margin:16px 0">This code will expire in 15 minutes. If you received this email after this time, please request a new code.</p><hr class="border border-solid border-[#eaeaea] my-[26px] mx-0 w-full" style="border:none;border-top:1px solid #eaeaea;width:100%"><p class="text-[#666666] !text-[12px] leading-[24px]" style="font-size:14px;line-height:24px;margin:16px 0">This code was requested by <span class="text-black">{{ email }}</span> to {{ purpose }} <span class="text-black">{{ organizationName }}</span>. If you were not expecting a code, you can ignore this email. If you are concerned about your account's safety, please reply to this email to get in touch with us.</p></td></tr></tbody></table></body></html>
''';
