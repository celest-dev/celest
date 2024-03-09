use std::{ffi::c_char, ptr::null, str::FromStr};

use super::helpers;

/// The result of parsing policies from a Cedar policy string into JSON
/// via [cedar_parse_policies].
#[derive(Debug)]
#[repr(C)]
pub struct CCedarPolicySetResult {
    /// The number of policies in the policy set.
    policies_len: usize,

    /// The policies in the policy set, in JSON format.
    ///
    /// This is only valid if `policies_len` is greater than 0 and `errors_len` is 0.
    policies: *const *const c_char,

    /// The IDs for the `policies` in the policy set.
    policy_ids: *const *const c_char,

    /// The number of errors encountered while parsing the policy set.
    errors_len: usize,

    /// The errors (as strings) encountered while parsing the policy set.
    errors: *const *const c_char,
}

/// Parses a policy set from a Cedar policy string into JSON.
#[no_mangle]
pub extern "C" fn cedar_parse_policy_set(policies: *const c_char) -> CCedarPolicySetResult {
    helpers::log_on_error(
        || {
            anyhow::ensure!(!policies.is_null(), "policies is null");
            let policies = helpers::string_from_c("policies", policies)?;
            let (policy_set, errors) = match cedar_policy::PolicySet::from_str(policies) {
                Ok(policy_set) => (policy_set, vec![]),
                Err(e) => (cedar_policy::PolicySet::new(), e.0),
            };

            let policy_ids = policy_set
                .policies()
                .map(|p| Ok(helpers::string_to_c(p.id().to_string())?))
                .collect::<anyhow::Result<Vec<_>>>()?
                .to_owned();
            let policy_ids_len = policy_ids.len();
            let policy_ids_ptr = policy_ids.as_ptr();
            std::mem::forget(policy_ids);

            let policies = policy_set
                .policies()
                .map(|p| Ok(helpers::string_to_c(serde_json::to_string(&p.to_json()?)?)?))
                .collect::<anyhow::Result<Vec<_>>>()?
                .to_owned();
            let policies_len = policies.len();
            let policies_ptr = policies.as_ptr();
            std::mem::forget(policies);

            assert!(
                policy_ids_len == policies_len,
                "policy_ids_len != policies_len"
            );

            let errors = errors
                .iter()
                .map(|e| helpers::string_to_c(e.to_string()))
                .collect::<Result<Vec<_>, _>>()?
                .to_owned();
            let errors_len = errors.len();
            let errors_ptr = errors.as_ptr();
            std::mem::forget(errors);

            Ok(CCedarPolicySetResult {
                policies_len,
                policies: policies_ptr,
                policy_ids: policy_ids_ptr,
                errors_len,
                errors: errors_ptr,
            })
        },
        "parsing policies",
        |e| {
            let error_str = helpers::string_to_c(e.to_string()).unwrap();
            CCedarPolicySetResult {
                policies_len: 0,
                policies: null(),
                policy_ids: null(),
                errors_len: 1,
                errors: &error_str,
            }
        },
    )
}
