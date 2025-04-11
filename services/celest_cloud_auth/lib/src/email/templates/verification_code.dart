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
    this.logoUrl = celestLogo,
  });

  final VerificationCodeEmailType type;
  final String email;
  final String code;
  final String organizationName;
  final String? name;
  final String? logoUrl;

  Map<String, String?> toTemplateParams() => {
        'email': email,
        'code': code,
        'organizationName': organizationName,
        'name': name,
        'logoUrl': logoUrl,
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

const String _templateHtml = r'''
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
.font-sans{font-family:ui-sans-serif,system-ui,-apple-system,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,"Noto Sans",sans-serif,"Apple Color Emoji","Segoe UI Emoji","Segoe UI Symbol","Noto Color Emoji";}</style></head><body class="bg-white my-auto mx-auto font-sans"><div data-skip="true" style="display:none;line-height:1px;max-height:0;max-width:0;opacity:0;overflow:hidden">Your {{ type }} code for {{ organizationName }} is {{ code }}</div><table align="center" width="100%" class="border-separate border border-solid border-[#eaeaea] rounded my-[40px] mx-auto p-[20px] w-[465px]" role="presentation" cellspacing="0" cellpadding="0" border="0" style="max-width:37.5em"><tbody><tr style="width:100%"><td><table align="center" width="100%" class="mt-[32px]" border="0" cellpadding="0" cellspacing="0" role="presentation"><tbody><tr><td>{{ #logoUrl }}<img class="my-0 mx-auto" alt="{{ organizationName }}" src="{{ logoUrl }}" height="80" style="border:none;display:block;outline:none;text-decoration:none">{{ /logoUrl }}</td></tr></tbody></table><h1 class="text-black text-[18px] font-normal text-center p-0 my-[30px] mx-0" style>Your {{ type }} code for <strong>{{ organizationName }}</strong></h1><p class="text-black text-[16px] leading-[24px]" style="font-size:14px;line-height:24px;margin:16px 0">Hello{{ #name }} {{ name }}{{ /name }},</p><p class="text-black text-[16px] leading-[24px]" style="font-size:14px;line-height:24px;margin:16px 0">Your {{ type }} code for <strong>{{ organizationName }}</strong> is:</p><table align="center" width="100%" class="text-center mt-[32px] mb-[32px]" border="0" cellpadding="0" cellspacing="0" role="presentation"><tbody><tr><td><p style="font-size:36px;line-height:24px;margin:16px 0;font-weight:700;padding:4px 8px;letter-spacing:1px;border-radius:4px;color:#3c4149">{{ code }}</p></td></tr></tbody></table><p class="text-black text-[16px] leading-[24px]" style="font-size:14px;line-height:24px;margin:16px 0">This code will expire in 15 minutes. If you received this email after this time, please request a new code.</p><hr class="border border-solid border-[#eaeaea] my-[26px] mx-0 w-full" style="border:none;border-top:1px solid #eaeaea;width:100%"><p class="text-[#666666] !text-[12px] leading-[24px]" style="font-size:14px;line-height:24px;margin:16px 0">This code was requested by <span class="text-black">{{ email }}</span> to {{ purpose }} <span class="text-black">{{ organizationName }}</span>. If you were not expecting a code, you can ignore this email. If you are concerned about your account's safety, please reply to this email to get in touch with us.</p></td></tr></tbody></table></body></html>
''';

const String celestLogo =
    'data:image/png;base64,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';
