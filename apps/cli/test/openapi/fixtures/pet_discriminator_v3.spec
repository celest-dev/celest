OpenApiDocument {
  version=3.0.2,
  info=OpenApiInfo {
    title=Petstore,
    apiVersion=1.0.0,
    ref=#/info,
    node={title: Petstore, version: 1.0.0},
  },
  servers=[],
  paths={/pets: OpenApiComponentOrRef {
    ref=#/paths//pets,
    component=OpenApiPathItem {
      operations={patch: OpenApiOperation {
        type=patch,
        tags=[],
        parameters=[],
        requestBody=OpenApiComponentOrRef {
          ref=#/paths//pets/patch/requestBody,
          component=OpenApiRequestBody {
            content={application/json: OpenApiMediaType {
              schema=OpenApiComponentOrRef {
                ref=#/paths//pets/patch/requestBody/content/application/json/schema,
                component=OpenApiSchema {
                  oneOf=[OpenApiComponentOrRef {
                    ref=#/paths//pets/patch/requestBody/content/application/json/schema/oneOf/0,
                    reference=OpenApiSchemaReference {
                      ref=#/components/schemas/Cat,
                      name=Cat,
                      node={$ref: #/components/schemas/Cat},
                    },
                    node={$ref: #/components/schemas/Cat},
                  }, OpenApiComponentOrRef {
                    ref=#/paths//pets/patch/requestBody/content/application/json/schema/oneOf/1,
                    reference=OpenApiSchemaReference {
                      ref=#/components/schemas/Dog,
                      name=Dog,
                      node={$ref: #/components/schemas/Dog},
                    },
                    node={$ref: #/components/schemas/Dog},
                  }],
                  discriminator=OpenApiDiscriminator {
                    propertyName=pet_type,
                    ref=#/paths//pets/patch/requestBody/content/application/json/schema/discriminator,
                    node={propertyName: pet_type},
                  },
                  ref=#/paths//pets/patch/requestBody/content/application/json/schema,
                  node={oneOf: [{$ref: #/components/schemas/Cat}, {$ref: #/components/schemas/Dog}], discriminator: {propertyName: pet_type}},
                },
              },
              encoding={},
              ref=#/paths//pets/patch/requestBody/content/application/json,
              node={schema: {oneOf: [{$ref: #/components/schemas/Cat}, {$ref: #/components/schemas/Dog}], discriminator: {propertyName: pet_type}}},
            }},
            ref=#/paths//pets/patch/requestBody,
            node={content: {application/json: {schema: {oneOf: [{$ref: #/components/schemas/Cat}, {$ref: #/components/schemas/Dog}], discriminator: {propertyName: pet_type}}}}},
          },
        },
        responses={200: OpenApiComponentOrRef {
          ref=#/paths//pets/patch/responses/200,
          component=OpenApiResponse {
            description=Updated,
            ref=#/paths//pets/patch/responses/200,
            node={description: Updated},
          },
        }},
      }},
      parameters=[],
      ref=#/paths//pets,
      node={patch: {requestBody: {content: {application/json: {schema: {oneOf: [{$ref: #/components/schemas/Cat}, {$ref: #/components/schemas/Dog}], discriminator: {propertyName: pet_type}}}}}, responses: {200: {description: Updated}}}},
    },
  }},
  components=OpenApiComponents {
    schemas={Pet: OpenApiSchema {
      name=Pet,
      type=object,
      properties={pet_type: OpenApiComponentOrRef {
        ref=#/components/schemas/Pet/properties/pet_type,
        component=OpenApiSchema {
          name=pet_type,
          type=string,
          ref=#/components/schemas/Pet/properties/pet_type,
          node={type: string},
        },
      }},
      required={pet_type},
      discriminator=OpenApiDiscriminator {
        propertyName=pet_type,
        ref=#/components/schemas/Pet/discriminator,
        node={propertyName: pet_type},
      },
      ref=#/components/schemas/Pet,
      node={type: object, required: [pet_type], properties: {pet_type: {type: string}}, discriminator: {propertyName: pet_type}},
    }, Dog: OpenApiSchema {
      name=Dog,
      allOf=[OpenApiComponentOrRef {
        ref=#/components/schemas/Dog/allOf/0,
        reference=OpenApiSchemaReference {
          ref=#/components/schemas/Pet,
          name=Pet,
          node={$ref: #/components/schemas/Pet},
        },
        node={$ref: #/components/schemas/Pet},
      }, OpenApiComponentOrRef {
        ref=#/components/schemas/Dog/allOf/1,
        component=OpenApiSchema {
          name=1,
          type=object,
          properties={bark: OpenApiComponentOrRef {
            ref=#/components/schemas/Dog/allOf/1/properties/bark,
            component=OpenApiSchema {
              name=bark,
              type=boolean,
              ref=#/components/schemas/Dog/allOf/1/properties/bark,
              node={type: boolean},
            },
          }, breed: OpenApiComponentOrRef {
            ref=#/components/schemas/Dog/allOf/1/properties/breed,
            component=OpenApiSchema {
              name=breed,
              type=string,
              enumValues={Dingo, Husky, Retriever, Shepherd},
              ref=#/components/schemas/Dog/allOf/1/properties/breed,
              node={type: string, enum: [Dingo, Husky, Retriever, Shepherd]},
            },
          }},
          ref=#/components/schemas/Dog/allOf/1,
          node={type: object, properties: {bark: {type: boolean}, breed: {type: string, enum: [Dingo, Husky, Retriever, Shepherd]}}},
        },
      }],
      ref=#/components/schemas/Dog,
      node={allOf: [{$ref: #/components/schemas/Pet}, {type: object, properties: {bark: {type: boolean}, breed: {type: string, enum: [Dingo, Husky, Retriever, Shepherd]}}}]},
    }, Cat: OpenApiSchema {
      name=Cat,
      allOf=[OpenApiComponentOrRef {
        ref=#/components/schemas/Cat/allOf/0,
        reference=OpenApiSchemaReference {
          ref=#/components/schemas/Pet,
          name=Pet,
          node={$ref: #/components/schemas/Pet},
        },
        node={$ref: #/components/schemas/Pet},
      }, OpenApiComponentOrRef {
        ref=#/components/schemas/Cat/allOf/1,
        component=OpenApiSchema {
          name=1,
          type=object,
          properties={hunts: OpenApiComponentOrRef {
            ref=#/components/schemas/Cat/allOf/1/properties/hunts,
            component=OpenApiSchema {
              name=hunts,
              type=boolean,
              ref=#/components/schemas/Cat/allOf/1/properties/hunts,
              node={type: boolean},
            },
          }, age: OpenApiComponentOrRef {
            ref=#/components/schemas/Cat/allOf/1/properties/age,
            component=OpenApiSchema {
              name=age,
              type=integer,
              ref=#/components/schemas/Cat/allOf/1/properties/age,
              node={type: integer},
            },
          }},
          ref=#/components/schemas/Cat/allOf/1,
          node={type: object, properties: {hunts: {type: boolean}, age: {type: integer}}},
        },
      }],
      ref=#/components/schemas/Cat,
      node={allOf: [{$ref: #/components/schemas/Pet}, {type: object, properties: {hunts: {type: boolean}, age: {type: integer}}}]},
    }},
    responses={},
    parameters={},
    requestBodies={},
    headers={},
    securitySchemes={},
    paths={},
    ref=#/components,
    node={schemas: {Pet: {type: object, required: [pet_type], properties: {pet_type: {type: string}}, discriminator: {propertyName: pet_type}}, Dog: {allOf: [{$ref: #/components/schemas/Pet}, {type: object, properties: {bark: {type: boolean}, breed: {type: string, enum: [Dingo, Husky, Retriever, Shepherd]}}}]}, Cat: {allOf: [{$ref: #/components/schemas/Pet}, {type: object, properties: {hunts: {type: boolean}, age: {type: integer}}}]}}},
  },
  securityRequirements=[],
  tags=[],
  ref=#,
  node={openapi: 3.0.2, info: {title: Petstore, version: 1.0.0}, paths: {/pets: {patch: {requestBody: {content: {application/json: {schema: {oneOf: [{$ref: #/components/schemas/Cat}, {$ref: #/components/schemas/Dog}], discriminator: {propertyName: pet_type}}}}}, responses: {200: {description: Updated}}}}}, components: {schemas: {Pet: {type: object, required: [pet_type], properties: {pet_type: {type: string}}, discriminator: {propertyName: pet_type}}, Dog: {allOf: [{$ref: #/components/schemas/Pet}, {type: object, properties: {bark: {type: boolean}, breed: {type: string, enum: [Dingo, Husky, Retriever, Shepherd]}}}]}, Cat: {allOf: [{$ref: #/components/schemas/Pet}, {type: object, properties: {hunts: {type: boolean}, age: {type: integer}}}]}}}},
}