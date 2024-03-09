use cedar_policy::{
    Authorizer, Context, Entities, EntityUid, PolicySet, Request, Response, Schema, ValidationMode,
    Validator,
};

// Declare that the c_api.rs file exists and is a public sub-namespace.
// C doesn't care about the namespaces, but Rust does.
mod c_api;

#[derive(Debug)]
pub struct CedarStore {
    schema: Schema,
    entities: Entities,
    policies: PolicySet,
    authorizer: Authorizer,
    should_validate: bool,
}

impl CedarStore {
    /// Creates a new [CedarStore] instance.
    pub fn new(
        schema: Schema,
        entities: Entities,
        policies: PolicySet,
        should_validate: bool,
    ) -> anyhow::Result<Self> {
        if should_validate {
            let validator = Validator::new(schema.clone());
            let validation_res = validator.validate(&policies, ValidationMode::default());
            anyhow::ensure!(
                validation_res.validation_passed(),
                "Validation failed: {}",
                validation_res
                    .validation_errors()
                    .map(|e| e.to_string())
                    .collect::<Vec<_>>()
                    .join("\n"),
            );
        }
        Ok(Self {
            schema,
            entities,
            policies,
            authorizer: Authorizer::new(),
            should_validate,
        })
    }

    /// Performs a Cedar authorization check.
    pub fn is_authorized(
        &self,
        principal: Option<EntityUid>,
        resource: Option<EntityUid>,
        action: Option<EntityUid>,
        context: Option<Context>,
        policies: Option<&PolicySet>,
        entities: Option<&Entities>,
    ) -> anyhow::Result<Response> {
        log::trace!(
            r"is_authorized(
                principal={:?}, 
                resource={:?}, 
                action={:?}, 
                context={:?}, 
                should_validate={}, 
                schema={:?}
            )",
            principal,
            resource,
            action,
            context,
            self.should_validate,
            self.schema,
        );
        let request = Request::new(
            principal,
            action,
            resource,
            context.unwrap_or(Context::empty()),
            Some(&self.schema),
        )?;
        let response = self.authorizer.is_authorized(
            &request,
            policies.unwrap_or(&self.policies),
            entities.unwrap_or(&self.entities),
        );
        log::trace!(
            "is_authorized(request={:?}, response={:?})",
            request,
            response
        );
        Ok(response)
    }
}
