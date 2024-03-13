#include <stdarg.h>
#include <stdbool.h>
#include <stdint.h>
#include <stdlib.h>

typedef struct CedarStore CedarStore;

/**
 * The result of parsing policies from a Cedar policy string into JSON
 * via [cedar_parse_policies].
 */
typedef struct CCedarPolicySetResult {
  /**
   * The number of policies in the policy set.
   */
  uintptr_t policies_len;
  /**
   * The policies in the policy set, in JSON format.
   *
   * This is only valid if `policies_len` is greater than 0 and `errors_len` is 0.
   */
  const char *const *policies;
  /**
   * The IDs for the `policies` in the policy set.
   */
  const char *const *policy_ids;
  /**
   * The number of templates in the policy set.
   */
  uintptr_t templates_len;
  /**
   * The templates in the policy set, in JSON format.
   *
   * This is only valid if `templates_len` is greater than 0 and `errors_len` is 0.
   */
  const char *const *templates;
  /**
   * The IDs for the `templates` in the policy set.
   */
  const char *const *template_ids;
  /**
   * The number of errors encountered while parsing the policy set.
   */
  uintptr_t errors_len;
  /**
   * The errors (as strings) encountered while parsing the policy set.
   */
  const char *const *errors;
} CCedarPolicySetResult;

/**
 * The result of initializing the Cedar policy engine via [cedar_init].
 */
typedef struct CInitResult {
  /**
   * Whether the operation succeeded.
   */
  struct CedarStore *store;
  /**
   * The error message, if any.
   *
   * Can be `null` to indicate no error.
   */
  const char *error;
} CInitResult;

typedef struct CCedarConfig {
  /**
   * The Cedar schema, in JSON format.
   *
   * This is a required field.
   */
  const char *schema_json;
  /**
   * The Cedar entities, in JSON format.
   *
   * Can be `null` to indicate no entities. Entities can be added later with [cedar_add_entities]
   * or [cedar_set_entities].
   */
  const char *entities_json;
  /**
   * The Cedar policies, in JSON format.
   *
   * Can be `null` to indicate no policies. Policies can be added later with [cedar_add_policies]
   * or [cedar_set_policies].
   */
  const char *policies_json;
  /**
   * Whether to validate the Cedar policies.
   */
  bool validate;
  /**
   * The log level to use for the Cedar policy engine.
   *
   * Must be one of: `OFF`, `ERROR`, `WARN`, `INFO`, `DEBUG`, `TRACE`.
   */
  const char *log_level;
} CCedarConfig;

typedef struct CAuthorizationDecision {
  /**
   * Whether the request is authorized.
   */
  bool is_authorized;
  /**
   * The error message, if any.
   *
   * If set, the authorization decision could not be made and no other
   * fields should be used.
   */
  const char *completion_error;
  /**
   * The array of reasons.
   *
   * Will be `null` if there are no reasons.
   */
  const char *const *reasons;
  /**
   * The length of the array of reasons.
   *
   * Will be `0` if there are no reasons.
   */
  uintptr_t reasons_len;
  /**
   * The array of errors.
   *
   * Will be `null` if there are no errors.
   */
  const char *const *errors;
  /**
   * The length of the array of errors.
   *
   * Will be `0` if there are no errors.
   */
  uintptr_t errors_len;
} CAuthorizationDecision;

typedef struct CCedarQuery {
  /**
   * The principal to check authorization for, in entity UID format.
   *
   * Can be `null` to indicate an anonymous principal.
   */
  const char *principal_str;
  /**
   * The resource to check authorization for, in entity UID format.
   *
   * Can be `null` to indicate an anonymous resource.
   */
  const char *resource_str;
  /**
   * The action to check authorization for, in entity UID format.
   *
   * Can be `null` to indicate an anonymous action.
   */
  const char *action_str;
  /**
   * The check's context, if any, in JSON format.
   *
   * Can be `null` to indicate no context.
   */
  const char *context_json;
  /**
   * The Cedar entities, in JSON format.
   *
   * Can be `null` to use the existing entities.
   */
  const char *entities_json;
  /**
   * The Cedar policies, in JSON format.
   *
   * Can be `null` to use the existing policies.
   */
  const char *policies_json;
} CCedarQuery;

/**
 * Parses a policy set from a Cedar policy string into JSON.
 */
struct CCedarPolicySetResult cedar_parse_policy_set(const char *policies);

/**
 * Links a policy template to a set of entities.
 *
 * Returns the linked policy template in JSON format.
 */
const char *cedar_link_policy_template(const char *policy_template_json, const char *entities_json);

/**
 * Initializes the Cedar policy engine with the given configuration.
 *
 * This must be called exactly once before any other Cedar functions are called.
 */
struct CInitResult cedar_init(const struct CCedarConfig *config);

/**
 * De-initializes the Cedar policy engine.
 *
 * This must be called exactly once when the Cedar policy engine is no longer needed.
 */
void cedar_deinit(struct CedarStore *store);

/**
 * Performs a Cedar authorization check.
 *
 * This must be called after [cedar_init] has been called.
 */
struct CAuthorizationDecision cedar_is_authorized(struct CedarStore *store,
                                                  const struct CCedarQuery *query);
