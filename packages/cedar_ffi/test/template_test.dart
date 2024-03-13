import 'package:cedar/cedar.dart';
import 'package:cedar_ffi/cedar_ffi.dart';
import 'package:test/test.dart';

void main() {
  group('templates', () {
    test('principal', () {
      const principalTemplate = '''
permit(
  principal == ?principal,
  action,
  resource
);
''';

      final policySet = CedarPolicySetFfi.fromCedar(principalTemplate);

      expect(policySet.templates, hasLength(1));

      final template = policySet.templates.values.first;
      expect(template.isTemplate, true);
      expect(template.principal.slot, CedarSlotId.principal);

      final linkedPolicy = template.link(
        {CedarSlotId.principal: CedarEntityId('Test', 'test')},
      );
      expect(linkedPolicy.isTemplate, false);
      expect(linkedPolicy.principal.op, CedarPolicyOp.equals);
      expect(linkedPolicy.principal.entity, CedarEntityId('Test', 'test'));
    });

    test('resource', () {
      const resourceTemplate = '''
permit(
  principal,
  action,
  resource == ?resource
);
''';

      final policySet = CedarPolicySetFfi.fromCedar(resourceTemplate);

      expect(policySet.templates, hasLength(1));

      final template = policySet.templates.values.first;
      expect(template.isTemplate, true);
      expect(template.resource.slot, CedarSlotId.resource);

      final linkedPolicy = template.link(
        {CedarSlotId.resource: CedarEntityId('Test', 'test')},
      );
      expect(linkedPolicy.isTemplate, false);
      expect(linkedPolicy.resource.op, CedarPolicyOp.equals);
      expect(linkedPolicy.resource.entity, CedarEntityId('Test', 'test'));
    });
  });
}
