OpenApiDocument {
  version=3.0.1,
  info=OpenApiInfo {
    title=Machines API,
    description=This site hosts documentation generated from the Fly.io Machines API OpenAPI specification. Visit our complete [Machines API docs](https://fly.io/docs/machines/api/) for how to get started, more information about each endpoint, parameter descriptions, and examples.,
    apiVersion=1.0,
    contact=OpenApiContact {
      ref=#/info/contact,
      node={},
    },
    license=OpenApiLicense {
      name=Apache 2.0,
      url=http://www.apache.org/licenses/LICENSE-2.0.html,
      ref=#/info/license,
      node={name: Apache 2.0, url: http://www.apache.org/licenses/LICENSE-2.0.html},
    },
    ref=#/info,
    node={title: Machines API, description: This site hosts documentation generated from the Fly.io Machines API OpenAPI specification. Visit our complete [Machines API docs](https://fly.io/docs/machines/api/) for how to get started, more information about each endpoint, parameter descriptions, and examples., contact: {}, license: {name: Apache 2.0, url: http://www.apache.org/licenses/LICENSE-2.0.html}, version: 1.0},
  },
  servers=[OpenApiServer {
    url=https://api.machines.dev/v1,
    variables={},
    ref=#/servers/0,
    node={url: https://api.machines.dev/v1},
  }],
  paths={/apps: OpenApiComponentOrRef {
    ref=#/paths//apps,
    component=OpenApiPathItem {
      operations={get: OpenApiOperation {
        type=get,
        tags=[Apps],
        summary=List Apps,
        description=List all apps with the ability to filter by organization slug.
,
        operationId=Apps_list,
        parameters=[OpenApiComponentOrRef {
          ref=#/paths//apps/get/parameters/0,
          component=OpenApiParameter {
            name=org_slug,
            location=query,
            description=The org slug, or 'personal', to filter apps,
            required=true,
            schema=OpenApiComponentOrRef {
              ref=#/paths//apps/get/parameters/0/schema,
              component=OpenApiSchema {
                type=string,
                ref=#/paths//apps/get/parameters/0/schema,
                node={type: string},
              },
            },
            ref=#/paths//apps/get/parameters/0,
            node={name: org_slug, in: query, description: The org slug, or 'personal', to filter apps, required: true, schema: {type: string}},
          },
        }],
        responses={200: OpenApiComponentOrRef {
          ref=#/paths//apps/get/responses/200,
          component=OpenApiResponse {
            description=OK,
            content={application/json: OpenApiMediaType {
              schema=OpenApiComponentOrRef {
                ref=#/paths//apps/get/responses/200/content/application/json/schema,
                reference=OpenApiSchemaReference {
                  ref=#/components/schemas/ListAppsResponse,
                  name=ListAppsResponse,
                  node={$ref: #/components/schemas/ListAppsResponse},
                },
                node={$ref: #/components/schemas/ListAppsResponse},
              },
              encoding={},
              ref=#/paths//apps/get/responses/200/content/application/json,
              node={schema: {$ref: #/components/schemas/ListAppsResponse}},
            }},
            ref=#/paths//apps/get/responses/200,
            node={description: OK, content: {application/json: {schema: {$ref: #/components/schemas/ListAppsResponse}}}},
          },
        }},
      }, post: OpenApiOperation {
        type=post,
        tags=[Apps],
        summary=Create App,
        description=Create an app with the specified details in the request body.
,
        operationId=Apps_create,
        parameters=[],
        requestBody=OpenApiComponentOrRef {
          ref=#/paths//apps/post/requestBody,
          component=OpenApiRequestBody {
            content={application/json: OpenApiMediaType {
              schema=OpenApiComponentOrRef {
                ref=#/paths//apps/post/requestBody/content/application/json/schema,
                reference=OpenApiSchemaReference {
                  ref=#/components/schemas/CreateAppRequest,
                  name=CreateAppRequest,
                  node={$ref: #/components/schemas/CreateAppRequest},
                },
                node={$ref: #/components/schemas/CreateAppRequest},
              },
              encoding={},
              ref=#/paths//apps/post/requestBody/content/application/json,
              node={schema: {$ref: #/components/schemas/CreateAppRequest}},
            }},
            description=App body,
            required=true,
            ref=#/paths//apps/post/requestBody,
            node={description: App body, content: {application/json: {schema: {$ref: #/components/schemas/CreateAppRequest}}}, required: true},
          },
        },
        responses={201: OpenApiComponentOrRef {
          ref=#/paths//apps/post/responses/201,
          component=OpenApiResponse {
            description=Created,
            content={},
            ref=#/paths//apps/post/responses/201,
            node={description: Created, content: {}},
          },
        }, 400: OpenApiComponentOrRef {
          ref=#/paths//apps/post/responses/400,
          component=OpenApiResponse {
            description=Bad Request,
            content={application/json: OpenApiMediaType {
              schema=OpenApiComponentOrRef {
                ref=#/paths//apps/post/responses/400/content/application/json/schema,
                reference=OpenApiSchemaReference {
                  ref=#/components/schemas/ErrorResponse,
                  name=ErrorResponse,
                  node={$ref: #/components/schemas/ErrorResponse},
                },
                node={$ref: #/components/schemas/ErrorResponse},
              },
              encoding={},
              ref=#/paths//apps/post/responses/400/content/application/json,
              node={schema: {$ref: #/components/schemas/ErrorResponse}},
            }},
            ref=#/paths//apps/post/responses/400,
            node={description: Bad Request, content: {application/json: {schema: {$ref: #/components/schemas/ErrorResponse}}}},
          },
        }},
        extensions={x-codegen-request-body-name: request},
      }},
      parameters=[],
      ref=#/paths//apps,
      node={get: {tags: [Apps], summary: List Apps, description: List all apps with the ability to filter by organization slug.
, operationId: Apps_list, parameters: [{name: org_slug, in: query, description: The org slug, or 'personal', to filter apps, required: true, schema: {type: string}}], responses: {200: {description: OK, content: {application/json: {schema: {$ref: #/components/schemas/ListAppsResponse}}}}}}, post: {tags: [Apps], summary: Create App, description: Create an app with the specified details in the request body.
, operationId: Apps_create, requestBody: {description: App body, content: {application/json: {schema: {$ref: #/components/schemas/CreateAppRequest}}}, required: true}, responses: {201: {description: Created, content: {}}, 400: {description: Bad Request, content: {application/json: {schema: {$ref: #/components/schemas/ErrorResponse}}}}}, x-codegen-request-body-name: request}},
    },
  }, /apps/{app_name}: OpenApiComponentOrRef {
    ref=#/paths//apps/{app_name},
    component=OpenApiPathItem {
      operations={get: OpenApiOperation {
        type=get,
        tags=[Apps],
        summary=Get App,
        description=Retrieve details about a specific app by its name.
,
        operationId=Apps_show,
        parameters=[OpenApiComponentOrRef {
          ref=#/paths//apps/{app_name}/get/parameters/0,
          component=OpenApiParameter {
            name=app_name,
            location=path,
            description=Fly App Name,
            required=true,
            schema=OpenApiComponentOrRef {
              ref=#/paths//apps/{app_name}/get/parameters/0/schema,
              component=OpenApiSchema {
                type=string,
                ref=#/paths//apps/{app_name}/get/parameters/0/schema,
                node={type: string},
              },
            },
            ref=#/paths//apps/{app_name}/get/parameters/0,
            node={name: app_name, in: path, description: Fly App Name, required: true, schema: {type: string}},
          },
        }],
        responses={200: OpenApiComponentOrRef {
          ref=#/paths//apps/{app_name}/get/responses/200,
          component=OpenApiResponse {
            description=OK,
            content={application/json: OpenApiMediaType {
              schema=OpenApiComponentOrRef {
                ref=#/paths//apps/{app_name}/get/responses/200/content/application/json/schema,
                reference=OpenApiSchemaReference {
                  ref=#/components/schemas/App,
                  name=App,
                  node={$ref: #/components/schemas/App},
                },
                node={$ref: #/components/schemas/App},
              },
              encoding={},
              ref=#/paths//apps/{app_name}/get/responses/200/content/application/json,
              node={schema: {$ref: #/components/schemas/App}},
            }},
            ref=#/paths//apps/{app_name}/get/responses/200,
            node={description: OK, content: {application/json: {schema: {$ref: #/components/schemas/App}}}},
          },
        }},
      }, delete: OpenApiOperation {
        type=delete,
        tags=[Apps],
        summary=Destroy App,
        description=Delete an app by its name.
,
        operationId=Apps_delete,
        parameters=[OpenApiComponentOrRef {
          ref=#/paths//apps/{app_name}/delete/parameters/0,
          component=OpenApiParameter {
            name=app_name,
            location=path,
            description=Fly App Name,
            required=true,
            schema=OpenApiComponentOrRef {
              ref=#/paths//apps/{app_name}/delete/parameters/0/schema,
              component=OpenApiSchema {
                type=string,
                ref=#/paths//apps/{app_name}/delete/parameters/0/schema,
                node={type: string},
              },
            },
            ref=#/paths//apps/{app_name}/delete/parameters/0,
            node={name: app_name, in: path, description: Fly App Name, required: true, schema: {type: string}},
          },
        }],
        responses={202: OpenApiComponentOrRef {
          ref=#/paths//apps/{app_name}/delete/responses/202,
          component=OpenApiResponse {
            description=Accepted,
            content={},
            ref=#/paths//apps/{app_name}/delete/responses/202,
            node={description: Accepted, content: {}},
          },
        }},
      }},
      parameters=[],
      ref=#/paths//apps/{app_name},
      node={get: {tags: [Apps], summary: Get App, description: Retrieve details about a specific app by its name.
, operationId: Apps_show, parameters: [{name: app_name, in: path, description: Fly App Name, required: true, schema: {type: string}}], responses: {200: {description: OK, content: {application/json: {schema: {$ref: #/components/schemas/App}}}}}}, delete: {tags: [Apps], summary: Destroy App, description: Delete an app by its name.
, operationId: Apps_delete, parameters: [{name: app_name, in: path, description: Fly App Name, required: true, schema: {type: string}}], responses: {202: {description: Accepted, content: {}}}}},
    },
  }, /apps/{app_name}/machines: OpenApiComponentOrRef {
    ref=#/paths//apps/{app_name}/machines,
    component=OpenApiPathItem {
      operations={get: OpenApiOperation {
        type=get,
        tags=[Machines],
        summary=List Machines,
        description=List all Machines associated with a specific app, with optional filters for including deleted Machines and filtering by region.
,
        operationId=Machines_list,
        parameters=[OpenApiComponentOrRef {
          ref=#/paths//apps/{app_name}/machines/get/parameters/0,
          component=OpenApiParameter {
            name=app_name,
            location=path,
            description=Fly App Name,
            required=true,
            schema=OpenApiComponentOrRef {
              ref=#/paths//apps/{app_name}/machines/get/parameters/0/schema,
              component=OpenApiSchema {
                type=string,
                ref=#/paths//apps/{app_name}/machines/get/parameters/0/schema,
                node={type: string},
              },
            },
            ref=#/paths//apps/{app_name}/machines/get/parameters/0,
            node={name: app_name, in: path, description: Fly App Name, required: true, schema: {type: string}},
          },
        }, OpenApiComponentOrRef {
          ref=#/paths//apps/{app_name}/machines/get/parameters/1,
          component=OpenApiParameter {
            name=include_deleted,
            location=query,
            description=Include deleted machines,
            schema=OpenApiComponentOrRef {
              ref=#/paths//apps/{app_name}/machines/get/parameters/1/schema,
              component=OpenApiSchema {
                type=boolean,
                ref=#/paths//apps/{app_name}/machines/get/parameters/1/schema,
                node={type: boolean},
              },
            },
            ref=#/paths//apps/{app_name}/machines/get/parameters/1,
            node={name: include_deleted, in: query, description: Include deleted machines, schema: {type: boolean}},
          },
        }, OpenApiComponentOrRef {
          ref=#/paths//apps/{app_name}/machines/get/parameters/2,
          component=OpenApiParameter {
            name=region,
            location=query,
            description=Region filter,
            schema=OpenApiComponentOrRef {
              ref=#/paths//apps/{app_name}/machines/get/parameters/2/schema,
              component=OpenApiSchema {
                type=string,
                ref=#/paths//apps/{app_name}/machines/get/parameters/2/schema,
                node={type: string},
              },
            },
            ref=#/paths//apps/{app_name}/machines/get/parameters/2,
            node={name: region, in: query, description: Region filter, schema: {type: string}},
          },
        }, OpenApiComponentOrRef {
          ref=#/paths//apps/{app_name}/machines/get/parameters/3,
          component=OpenApiParameter {
            name=state,
            location=query,
            description=comma separated list of states to filter (created, started, stopped, suspended),
            schema=OpenApiComponentOrRef {
              ref=#/paths//apps/{app_name}/machines/get/parameters/3/schema,
              component=OpenApiSchema {
                type=string,
                ref=#/paths//apps/{app_name}/machines/get/parameters/3/schema,
                node={type: string},
              },
            },
            ref=#/paths//apps/{app_name}/machines/get/parameters/3,
            node={name: state, in: query, description: comma separated list of states to filter (created, started, stopped, suspended), schema: {type: string}},
          },
        }, OpenApiComponentOrRef {
          ref=#/paths//apps/{app_name}/machines/get/parameters/4,
          component=OpenApiParameter {
            name=summary,
            location=query,
            description=Only return summary info about machines (omit config, checks, events, host_status, nonce, etc.),
            schema=OpenApiComponentOrRef {
              ref=#/paths//apps/{app_name}/machines/get/parameters/4/schema,
              component=OpenApiSchema {
                type=boolean,
                ref=#/paths//apps/{app_name}/machines/get/parameters/4/schema,
                node={type: boolean},
              },
            },
            ref=#/paths//apps/{app_name}/machines/get/parameters/4,
            node={name: summary, in: query, description: Only return summary info about machines (omit config, checks, events, host_status, nonce, etc.), schema: {type: boolean}},
          },
        }],
        responses={200: OpenApiComponentOrRef {
          ref=#/paths//apps/{app_name}/machines/get/responses/200,
          component=OpenApiResponse {
            description=OK,
            content={application/json: OpenApiMediaType {
              schema=OpenApiComponentOrRef {
                ref=#/paths//apps/{app_name}/machines/get/responses/200/content/application/json/schema,
                component=OpenApiSchema {
                  type=array,
                  items=OpenApiComponentOrRef {
                    ref=#/paths//apps/{app_name}/machines/get/responses/200/content/application/json/schema/items,
                    reference=OpenApiSchemaReference {
                      ref=#/components/schemas/Machine,
                      name=Machine,
                      node={$ref: #/components/schemas/Machine},
                    },
                    node={$ref: #/components/schemas/Machine},
                  },
                  ref=#/paths//apps/{app_name}/machines/get/responses/200/content/application/json/schema,
                  node={type: array, items: {$ref: #/components/schemas/Machine}},
                },
              },
              encoding={},
              ref=#/paths//apps/{app_name}/machines/get/responses/200/content/application/json,
              node={schema: {type: array, items: {$ref: #/components/schemas/Machine}}},
            }},
            ref=#/paths//apps/{app_name}/machines/get/responses/200,
            node={description: OK, content: {application/json: {schema: {type: array, items: {$ref: #/components/schemas/Machine}}}}},
          },
        }},
      }, post: OpenApiOperation {
        type=post,
        tags=[Machines],
        summary=Create Machine,
        description=Create a Machine within a specific app using the details provided in the request body.

**Important**: This request can fail, and you’re responsible for handling that failure. If you ask for a large Machine, or a Machine in a region we happen to be at capacity for, you might need to retry the request, or to fall back to another region. If you’re working directly with the Machines API, you’re taking some responsibility for your own orchestration!
,
        operationId=Machines_create,
        parameters=[OpenApiComponentOrRef {
          ref=#/paths//apps/{app_name}/machines/post/parameters/0,
          component=OpenApiParameter {
            name=app_name,
            location=path,
            description=Fly App Name,
            required=true,
            schema=OpenApiComponentOrRef {
              ref=#/paths//apps/{app_name}/machines/post/parameters/0/schema,
              component=OpenApiSchema {
                type=string,
                ref=#/paths//apps/{app_name}/machines/post/parameters/0/schema,
                node={type: string},
              },
            },
            ref=#/paths//apps/{app_name}/machines/post/parameters/0,
            node={name: app_name, in: path, description: Fly App Name, required: true, schema: {type: string}},
          },
        }],
        requestBody=OpenApiComponentOrRef {
          ref=#/paths//apps/{app_name}/machines/post/requestBody,
          component=OpenApiRequestBody {
            content={application/json: OpenApiMediaType {
              schema=OpenApiComponentOrRef {
                ref=#/paths//apps/{app_name}/machines/post/requestBody/content/application/json/schema,
                reference=OpenApiSchemaReference {
                  ref=#/components/schemas/CreateMachineRequest,
                  name=CreateMachineRequest,
                  node={$ref: #/components/schemas/CreateMachineRequest},
                },
                node={$ref: #/components/schemas/CreateMachineRequest},
              },
              encoding={},
              ref=#/paths//apps/{app_name}/machines/post/requestBody/content/application/json,
              node={schema: {$ref: #/components/schemas/CreateMachineRequest}},
            }},
            description=Create machine request,
            required=true,
            ref=#/paths//apps/{app_name}/machines/post/requestBody,
            node={description: Create machine request, content: {application/json: {schema: {$ref: #/components/schemas/CreateMachineRequest}}}, required: true},
          },
        },
        responses={200: OpenApiComponentOrRef {
          ref=#/paths//apps/{app_name}/machines/post/responses/200,
          component=OpenApiResponse {
            description=OK,
            content={application/json: OpenApiMediaType {
              schema=OpenApiComponentOrRef {
                ref=#/paths//apps/{app_name}/machines/post/responses/200/content/application/json/schema,
                reference=OpenApiSchemaReference {
                  ref=#/components/schemas/Machine,
                  name=Machine,
                  node={$ref: #/components/schemas/Machine},
                },
                node={$ref: #/components/schemas/Machine},
              },
              encoding={},
              ref=#/paths//apps/{app_name}/machines/post/responses/200/content/application/json,
              node={schema: {$ref: #/components/schemas/Machine}},
            }},
            ref=#/paths//apps/{app_name}/machines/post/responses/200,
            node={description: OK, content: {application/json: {schema: {$ref: #/components/schemas/Machine}}}},
          },
        }},
        extensions={x-codegen-request-body-name: request},
      }},
      parameters=[],
      ref=#/paths//apps/{app_name}/machines,
      node={get: {tags: [Machines], summary: List Machines, description: List all Machines associated with a specific app, with optional filters for including deleted Machines and filtering by region.
, operationId: Machines_list, parameters: [{name: app_name, in: path, description: Fly App Name, required: true, schema: {type: string}}, {name: include_deleted, in: query, description: Include deleted machines, schema: {type: boolean}}, {name: region, in: query, description: Region filter, schema: {type: string}}, {name: state, in: query, description: comma separated list of states to filter (created, started, stopped, suspended), schema: {type: string}}, {name: summary, in: query, description: Only return summary info about machines (omit config, checks, events, host_status, nonce, etc.), schema: {type: boolean}}], responses: {200: {description: OK, content: {application/json: {schema: {type: array, items: {$ref: #/components/schemas/Machine}}}}}}}, post: {tags: [Machines], summary: Create Machine, description: Create a Machine within a specific app using the details provided in the request body.

**Important**: This request can fail, and you’re responsible for handling that failure. If you ask for a large Machine, or a Machine in a region we happen to be at capacity for, you might need to retry the request, or to fall back to another region. If you’re working directly with the Machines API, you’re taking some responsibility for your own orchestration!
, operationId: Machines_create, parameters: [{name: app_name, in: path, description: Fly App Name, required: true, schema: {type: string}}], requestBody: {description: Create machine request, content: {application/json: {schema: {$ref: #/components/schemas/CreateMachineRequest}}}, required: true}, responses: {200: {description: OK, content: {application/json: {schema: {$ref: #/components/schemas/Machine}}}}}, x-codegen-request-body-name: request}},
    },
  }, /apps/{app_name}/machines/{machine_id}: OpenApiComponentOrRef {
    ref=#/paths//apps/{app_name}/machines/{machine_id},
    component=OpenApiPathItem {
      operations={get: OpenApiOperation {
        type=get,
        tags=[Machines],
        summary=Get Machine,
        description=Get details of a specific Machine within an app by the Machine ID.
,
        operationId=Machines_show,
        parameters=[OpenApiComponentOrRef {
          ref=#/paths//apps/{app_name}/machines/{machine_id}/get/parameters/0,
          component=OpenApiParameter {
            name=app_name,
            location=path,
            description=Fly App Name,
            required=true,
            schema=OpenApiComponentOrRef {
              ref=#/paths//apps/{app_name}/machines/{machine_id}/get/parameters/0/schema,
              component=OpenApiSchema {
                type=string,
                ref=#/paths//apps/{app_name}/machines/{machine_id}/get/parameters/0/schema,
                node={type: string},
              },
            },
            ref=#/paths//apps/{app_name}/machines/{machine_id}/get/parameters/0,
            node={name: app_name, in: path, description: Fly App Name, required: true, schema: {type: string}},
          },
        }, OpenApiComponentOrRef {
          ref=#/paths//apps/{app_name}/machines/{machine_id}/get/parameters/1,
          component=OpenApiParameter {
            name=machine_id,
            location=path,
            description=Machine ID,
            required=true,
            schema=OpenApiComponentOrRef {
              ref=#/paths//apps/{app_name}/machines/{machine_id}/get/parameters/1/schema,
              component=OpenApiSchema {
                type=string,
                ref=#/paths//apps/{app_name}/machines/{machine_id}/get/parameters/1/schema,
                node={type: string},
              },
            },
            ref=#/paths//apps/{app_name}/machines/{machine_id}/get/parameters/1,
            node={name: machine_id, in: path, description: Machine ID, required: true, schema: {type: string}},
          },
        }],
        responses={200: OpenApiComponentOrRef {
          ref=#/paths//apps/{app_name}/machines/{machine_id}/get/responses/200,
          component=OpenApiResponse {
            description=OK,
            content={application/json: OpenApiMediaType {
              schema=OpenApiComponentOrRef {
                ref=#/paths//apps/{app_name}/machines/{machine_id}/get/responses/200/content/application/json/schema,
                reference=OpenApiSchemaReference {
                  ref=#/components/schemas/Machine,
                  name=Machine,
                  node={$ref: #/components/schemas/Machine},
                },
                node={$ref: #/components/schemas/Machine},
              },
              encoding={},
              ref=#/paths//apps/{app_name}/machines/{machine_id}/get/responses/200/content/application/json,
              node={schema: {$ref: #/components/schemas/Machine}},
            }},
            ref=#/paths//apps/{app_name}/machines/{machine_id}/get/responses/200,
            node={description: OK, content: {application/json: {schema: {$ref: #/components/schemas/Machine}}}},
          },
        }},
      }, post: OpenApiOperation {
        type=post,
        tags=[Machines],
        summary=Update Machine,
        description=Update a Machine's configuration using the details provided in the request body.
,
        operationId=Machines_update,
        parameters=[OpenApiComponentOrRef {
          ref=#/paths//apps/{app_name}/machines/{machine_id}/post/parameters/0,
          component=OpenApiParameter {
            name=app_name,
            location=path,
            description=Fly App Name,
            required=true,
            schema=OpenApiComponentOrRef {
              ref=#/paths//apps/{app_name}/machines/{machine_id}/post/parameters/0/schema,
              component=OpenApiSchema {
                type=string,
                ref=#/paths//apps/{app_name}/machines/{machine_id}/post/parameters/0/schema,
                node={type: string},
              },
            },
            ref=#/paths//apps/{app_name}/machines/{machine_id}/post/parameters/0,
            node={name: app_name, in: path, description: Fly App Name, required: true, schema: {type: string}},
          },
        }, OpenApiComponentOrRef {
          ref=#/paths//apps/{app_name}/machines/{machine_id}/post/parameters/1,
          component=OpenApiParameter {
            name=machine_id,
            location=path,
            description=Machine ID,
            required=true,
            schema=OpenApiComponentOrRef {
              ref=#/paths//apps/{app_name}/machines/{machine_id}/post/parameters/1/schema,
              component=OpenApiSchema {
                type=string,
                ref=#/paths//apps/{app_name}/machines/{machine_id}/post/parameters/1/schema,
                node={type: string},
              },
            },
            ref=#/paths//apps/{app_name}/machines/{machine_id}/post/parameters/1,
            node={name: machine_id, in: path, description: Machine ID, required: true, schema: {type: string}},
          },
        }],
        requestBody=OpenApiComponentOrRef {
          ref=#/paths//apps/{app_name}/machines/{machine_id}/post/requestBody,
          component=OpenApiRequestBody {
            content={application/json: OpenApiMediaType {
              schema=OpenApiComponentOrRef {
                ref=#/paths//apps/{app_name}/machines/{machine_id}/post/requestBody/content/application/json/schema,
                reference=OpenApiSchemaReference {
                  ref=#/components/schemas/UpdateMachineRequest,
                  name=UpdateMachineRequest,
                  node={$ref: #/components/schemas/UpdateMachineRequest},
                },
                node={$ref: #/components/schemas/UpdateMachineRequest},
              },
              encoding={},
              ref=#/paths//apps/{app_name}/machines/{machine_id}/post/requestBody/content/application/json,
              node={schema: {$ref: #/components/schemas/UpdateMachineRequest}},
            }},
            description=Request body,
            required=true,
            ref=#/paths//apps/{app_name}/machines/{machine_id}/post/requestBody,
            node={description: Request body, content: {application/json: {schema: {$ref: #/components/schemas/UpdateMachineRequest}}}, required: true},
          },
        },
        responses={200: OpenApiComponentOrRef {
          ref=#/paths//apps/{app_name}/machines/{machine_id}/post/responses/200,
          component=OpenApiResponse {
            description=OK,
            content={application/json: OpenApiMediaType {
              schema=OpenApiComponentOrRef {
                ref=#/paths//apps/{app_name}/machines/{machine_id}/post/responses/200/content/application/json/schema,
                reference=OpenApiSchemaReference {
                  ref=#/components/schemas/Machine,
                  name=Machine,
                  node={$ref: #/components/schemas/Machine},
                },
                node={$ref: #/components/schemas/Machine},
              },
              encoding={},
              ref=#/paths//apps/{app_name}/machines/{machine_id}/post/responses/200/content/application/json,
              node={schema: {$ref: #/components/schemas/Machine}},
            }},
            ref=#/paths//apps/{app_name}/machines/{machine_id}/post/responses/200,
            node={description: OK, content: {application/json: {schema: {$ref: #/components/schemas/Machine}}}},
          },
        }, 400: OpenApiComponentOrRef {
          ref=#/paths//apps/{app_name}/machines/{machine_id}/post/responses/400,
          component=OpenApiResponse {
            description=Bad Request,
            content={application/json: OpenApiMediaType {
              schema=OpenApiComponentOrRef {
                ref=#/paths//apps/{app_name}/machines/{machine_id}/post/responses/400/content/application/json/schema,
                reference=OpenApiSchemaReference {
                  ref=#/components/schemas/ErrorResponse,
                  name=ErrorResponse,
                  node={$ref: #/components/schemas/ErrorResponse},
                },
                node={$ref: #/components/schemas/ErrorResponse},
              },
              encoding={},
              ref=#/paths//apps/{app_name}/machines/{machine_id}/post/responses/400/content/application/json,
              node={schema: {$ref: #/components/schemas/ErrorResponse}},
            }},
            ref=#/paths//apps/{app_name}/machines/{machine_id}/post/responses/400,
            node={description: Bad Request, content: {application/json: {schema: {$ref: #/components/schemas/ErrorResponse}}}},
          },
        }},
        extensions={x-codegen-request-body-name: request},
      }, delete: OpenApiOperation {
        type=delete,
        tags=[Machines],
        summary=Destroy Machine,
        description=Delete a specific Machine within an app by Machine ID, with an optional force parameter to force kill the Machine if it's running.
,
        operationId=Machines_delete,
        parameters=[OpenApiComponentOrRef {
          ref=#/paths//apps/{app_name}/machines/{machine_id}/delete/parameters/0,
          component=OpenApiParameter {
            name=app_name,
            location=path,
            description=Fly App Name,
            required=true,
            schema=OpenApiComponentOrRef {
              ref=#/paths//apps/{app_name}/machines/{machine_id}/delete/parameters/0/schema,
              component=OpenApiSchema {
                type=string,
                ref=#/paths//apps/{app_name}/machines/{machine_id}/delete/parameters/0/schema,
                node={type: string},
              },
            },
            ref=#/paths//apps/{app_name}/machines/{machine_id}/delete/parameters/0,
            node={name: app_name, in: path, description: Fly App Name, required: true, schema: {type: string}},
          },
        }, OpenApiComponentOrRef {
          ref=#/paths//apps/{app_name}/machines/{machine_id}/delete/parameters/1,
          component=OpenApiParameter {
            name=machine_id,
            location=path,
            description=Machine ID,
            required=true,
            schema=OpenApiComponentOrRef {
              ref=#/paths//apps/{app_name}/machines/{machine_id}/delete/parameters/1/schema,
              component=OpenApiSchema {
                type=string,
                ref=#/paths//apps/{app_name}/machines/{machine_id}/delete/parameters/1/schema,
                node={type: string},
              },
            },
            ref=#/paths//apps/{app_name}/machines/{machine_id}/delete/parameters/1,
            node={name: machine_id, in: path, description: Machine ID, required: true, schema: {type: string}},
          },
        }, OpenApiComponentOrRef {
          ref=#/paths//apps/{app_name}/machines/{machine_id}/delete/parameters/2,
          component=OpenApiParameter {
            name=force,
            location=query,
            description=Force kill the machine if it's running,
            schema=OpenApiComponentOrRef {
              ref=#/paths//apps/{app_name}/machines/{machine_id}/delete/parameters/2/schema,
              component=OpenApiSchema {
                type=boolean,
                ref=#/paths//apps/{app_name}/machines/{machine_id}/delete/parameters/2/schema,
                node={type: boolean},
              },
            },
            ref=#/paths//apps/{app_name}/machines/{machine_id}/delete/parameters/2,
            node={name: force, in: query, description: Force kill the machine if it's running, schema: {type: boolean}},
          },
        }],
        responses={200: OpenApiComponentOrRef {
          ref=#/paths//apps/{app_name}/machines/{machine_id}/delete/responses/200,
          component=OpenApiResponse {
            description=OK,
            content={},
            ref=#/paths//apps/{app_name}/machines/{machine_id}/delete/responses/200,
            node={description: OK, content: {}},
          },
        }},
      }},
      parameters=[],
      ref=#/paths//apps/{app_name}/machines/{machine_id},
      node={get: {tags: [Machines], summary: Get Machine, description: Get details of a specific Machine within an app by the Machine ID.
, operationId: Machines_show, parameters: [{name: app_name, in: path, description: Fly App Name, required: true, schema: {type: string}}, {name: machine_id, in: path, description: Machine ID, required: true, schema: {type: string}}], responses: {200: {description: OK, content: {application/json: {schema: {$ref: #/components/schemas/Machine}}}}}}, post: {tags: [Machines], summary: Update Machine, description: Update a Machine's configuration using the details provided in the request body.
, operationId: Machines_update, parameters: [{name: app_name, in: path, description: Fly App Name, required: true, schema: {type: string}}, {name: machine_id, in: path, description: Machine ID, required: true, schema: {type: string}}], requestBody: {description: Request body, content: {application/json: {schema: {$ref: #/components/schemas/UpdateMachineRequest}}}, required: true}, responses: {200: {description: OK, content: {application/json: {schema: {$ref: #/components/schemas/Machine}}}}, 400: {description: Bad Request, content: {application/json: {schema: {$ref: #/components/schemas/ErrorResponse}}}}}, x-codegen-request-body-name: request}, delete: {tags: [Machines], summary: Destroy Machine, description: Delete a specific Machine within an app by Machine ID, with an optional force parameter to force kill the Machine if it's running.
, operationId: Machines_delete, parameters: [{name: app_name, in: path, description: Fly App Name, required: true, schema: {type: string}}, {name: machine_id, in: path, description: Machine ID, required: true, schema: {type: string}}, {name: force, in: query, description: Force kill the machine if it's running, schema: {type: boolean}}], responses: {200: {description: OK, content: {}}}}},
    },
  }, /apps/{app_name}/machines/{machine_id}/cordon: OpenApiComponentOrRef {
    ref=#/paths//apps/{app_name}/machines/{machine_id}/cordon,
    component=OpenApiPathItem {
      operations={post: OpenApiOperation {
        type=post,
        tags=[Machines],
        summary=Cordon Machine,
        description=“Cordoning” a Machine refers to disabling its services, so the Fly Proxy won’t route requests to it. In flyctl this is used by blue/green deployments; one set of Machines is started up with services disabled, and when they are all healthy, the services are enabled on the new Machines and disabled on the old ones.
,
        operationId=Machines_cordon,
        parameters=[OpenApiComponentOrRef {
          ref=#/paths//apps/{app_name}/machines/{machine_id}/cordon/post/parameters/0,
          component=OpenApiParameter {
            name=app_name,
            location=path,
            description=Fly App Name,
            required=true,
            schema=OpenApiComponentOrRef {
              ref=#/paths//apps/{app_name}/machines/{machine_id}/cordon/post/parameters/0/schema,
              component=OpenApiSchema {
                type=string,
                ref=#/paths//apps/{app_name}/machines/{machine_id}/cordon/post/parameters/0/schema,
                node={type: string},
              },
            },
            ref=#/paths//apps/{app_name}/machines/{machine_id}/cordon/post/parameters/0,
            node={name: app_name, in: path, description: Fly App Name, required: true, schema: {type: string}},
          },
        }, OpenApiComponentOrRef {
          ref=#/paths//apps/{app_name}/machines/{machine_id}/cordon/post/parameters/1,
          component=OpenApiParameter {
            name=machine_id,
            location=path,
            description=Machine ID,
            required=true,
            schema=OpenApiComponentOrRef {
              ref=#/paths//apps/{app_name}/machines/{machine_id}/cordon/post/parameters/1/schema,
              component=OpenApiSchema {
                type=string,
                ref=#/paths//apps/{app_name}/machines/{machine_id}/cordon/post/parameters/1/schema,
                node={type: string},
              },
            },
            ref=#/paths//apps/{app_name}/machines/{machine_id}/cordon/post/parameters/1,
            node={name: machine_id, in: path, description: Machine ID, required: true, schema: {type: string}},
          },
        }],
        responses={200: OpenApiComponentOrRef {
          ref=#/paths//apps/{app_name}/machines/{machine_id}/cordon/post/responses/200,
          component=OpenApiResponse {
            description=OK,
            content={},
            ref=#/paths//apps/{app_name}/machines/{machine_id}/cordon/post/responses/200,
            node={description: OK, content: {}},
          },
        }},
      }},
      parameters=[],
      ref=#/paths//apps/{app_name}/machines/{machine_id}/cordon,
      node={post: {tags: [Machines], summary: Cordon Machine, description: “Cordoning” a Machine refers to disabling its services, so the Fly Proxy won’t route requests to it. In flyctl this is used by blue/green deployments; one set of Machines is started up with services disabled, and when they are all healthy, the services are enabled on the new Machines and disabled on the old ones.
, operationId: Machines_cordon, parameters: [{name: app_name, in: path, description: Fly App Name, required: true, schema: {type: string}}, {name: machine_id, in: path, description: Machine ID, required: true, schema: {type: string}}], responses: {200: {description: OK, content: {}}}}},
    },
  }, /apps/{app_name}/machines/{machine_id}/events: OpenApiComponentOrRef {
    ref=#/paths//apps/{app_name}/machines/{machine_id}/events,
    component=OpenApiPathItem {
      operations={get: OpenApiOperation {
        type=get,
        tags=[Machines],
        summary=List Events,
        description=List all events associated with a specific Machine within an app.
,
        operationId=Machines_list_events,
        parameters=[OpenApiComponentOrRef {
          ref=#/paths//apps/{app_name}/machines/{machine_id}/events/get/parameters/0,
          component=OpenApiParameter {
            name=app_name,
            location=path,
            description=Fly App Name,
            required=true,
            schema=OpenApiComponentOrRef {
              ref=#/paths//apps/{app_name}/machines/{machine_id}/events/get/parameters/0/schema,
              component=OpenApiSchema {
                type=string,
                ref=#/paths//apps/{app_name}/machines/{machine_id}/events/get/parameters/0/schema,
                node={type: string},
              },
            },
            ref=#/paths//apps/{app_name}/machines/{machine_id}/events/get/parameters/0,
            node={name: app_name, in: path, description: Fly App Name, required: true, schema: {type: string}},
          },
        }, OpenApiComponentOrRef {
          ref=#/paths//apps/{app_name}/machines/{machine_id}/events/get/parameters/1,
          component=OpenApiParameter {
            name=machine_id,
            location=path,
            description=Machine ID,
            required=true,
            schema=OpenApiComponentOrRef {
              ref=#/paths//apps/{app_name}/machines/{machine_id}/events/get/parameters/1/schema,
              component=OpenApiSchema {
                type=string,
                ref=#/paths//apps/{app_name}/machines/{machine_id}/events/get/parameters/1/schema,
                node={type: string},
              },
            },
            ref=#/paths//apps/{app_name}/machines/{machine_id}/events/get/parameters/1,
            node={name: machine_id, in: path, description: Machine ID, required: true, schema: {type: string}},
          },
        }],
        responses={200: OpenApiComponentOrRef {
          ref=#/paths//apps/{app_name}/machines/{machine_id}/events/get/responses/200,
          component=OpenApiResponse {
            description=OK,
            content={application/json: OpenApiMediaType {
              schema=OpenApiComponentOrRef {
                ref=#/paths//apps/{app_name}/machines/{machine_id}/events/get/responses/200/content/application/json/schema,
                component=OpenApiSchema {
                  type=array,
                  items=OpenApiComponentOrRef {
                    ref=#/paths//apps/{app_name}/machines/{machine_id}/events/get/responses/200/content/application/json/schema/items,
                    reference=OpenApiSchemaReference {
                      ref=#/components/schemas/MachineEvent,
                      name=MachineEvent,
                      node={$ref: #/components/schemas/MachineEvent},
                    },
                    node={$ref: #/components/schemas/MachineEvent},
                  },
                  ref=#/paths//apps/{app_name}/machines/{machine_id}/events/get/responses/200/content/application/json/schema,
                  node={type: array, items: {$ref: #/components/schemas/MachineEvent}},
                },
              },
              encoding={},
              ref=#/paths//apps/{app_name}/machines/{machine_id}/events/get/responses/200/content/application/json,
              node={schema: {type: array, items: {$ref: #/components/schemas/MachineEvent}}},
            }},
            ref=#/paths//apps/{app_name}/machines/{machine_id}/events/get/responses/200,
            node={description: OK, content: {application/json: {schema: {type: array, items: {$ref: #/components/schemas/MachineEvent}}}}},
          },
        }},
      }},
      parameters=[],
      ref=#/paths//apps/{app_name}/machines/{machine_id}/events,
      node={get: {tags: [Machines], summary: List Events, description: List all events associated with a specific Machine within an app.
, operationId: Machines_list_events, parameters: [{name: app_name, in: path, description: Fly App Name, required: true, schema: {type: string}}, {name: machine_id, in: path, description: Machine ID, required: true, schema: {type: string}}], responses: {200: {description: OK, content: {application/json: {schema: {type: array, items: {$ref: #/components/schemas/MachineEvent}}}}}}}},
    },
  }, /apps/{app_name}/machines/{machine_id}/exec: OpenApiComponentOrRef {
    ref=#/paths//apps/{app_name}/machines/{machine_id}/exec,
    component=OpenApiPathItem {
      operations={post: OpenApiOperation {
        type=post,
        tags=[Machines],
        summary=Execute Command,
        description=Execute a command on a specific Machine and return the raw command output bytes.
,
        operationId=Machines_exec,
        parameters=[OpenApiComponentOrRef {
          ref=#/paths//apps/{app_name}/machines/{machine_id}/exec/post/parameters/0,
          component=OpenApiParameter {
            name=app_name,
            location=path,
            description=Fly App Name,
            required=true,
            schema=OpenApiComponentOrRef {
              ref=#/paths//apps/{app_name}/machines/{machine_id}/exec/post/parameters/0/schema,
              component=OpenApiSchema {
                type=string,
                ref=#/paths//apps/{app_name}/machines/{machine_id}/exec/post/parameters/0/schema,
                node={type: string},
              },
            },
            ref=#/paths//apps/{app_name}/machines/{machine_id}/exec/post/parameters/0,
            node={name: app_name, in: path, description: Fly App Name, required: true, schema: {type: string}},
          },
        }, OpenApiComponentOrRef {
          ref=#/paths//apps/{app_name}/machines/{machine_id}/exec/post/parameters/1,
          component=OpenApiParameter {
            name=machine_id,
            location=path,
            description=Machine ID,
            required=true,
            schema=OpenApiComponentOrRef {
              ref=#/paths//apps/{app_name}/machines/{machine_id}/exec/post/parameters/1/schema,
              component=OpenApiSchema {
                type=string,
                ref=#/paths//apps/{app_name}/machines/{machine_id}/exec/post/parameters/1/schema,
                node={type: string},
              },
            },
            ref=#/paths//apps/{app_name}/machines/{machine_id}/exec/post/parameters/1,
            node={name: machine_id, in: path, description: Machine ID, required: true, schema: {type: string}},
          },
        }],
        requestBody=OpenApiComponentOrRef {
          ref=#/paths//apps/{app_name}/machines/{machine_id}/exec/post/requestBody,
          component=OpenApiRequestBody {
            content={application/json: OpenApiMediaType {
              schema=OpenApiComponentOrRef {
                ref=#/paths//apps/{app_name}/machines/{machine_id}/exec/post/requestBody/content/application/json/schema,
                reference=OpenApiSchemaReference {
                  ref=#/components/schemas/MachineExecRequest,
                  name=MachineExecRequest,
                  node={$ref: #/components/schemas/MachineExecRequest},
                },
                node={$ref: #/components/schemas/MachineExecRequest},
              },
              encoding={},
              ref=#/paths//apps/{app_name}/machines/{machine_id}/exec/post/requestBody/content/application/json,
              node={schema: {$ref: #/components/schemas/MachineExecRequest}},
            }},
            description=Request body,
            required=true,
            ref=#/paths//apps/{app_name}/machines/{machine_id}/exec/post/requestBody,
            node={description: Request body, content: {application/json: {schema: {$ref: #/components/schemas/MachineExecRequest}}}, required: true},
          },
        },
        responses={200: OpenApiComponentOrRef {
          ref=#/paths//apps/{app_name}/machines/{machine_id}/exec/post/responses/200,
          component=OpenApiResponse {
            description=stdout, stderr, exit code, and exit signal are returned,
            content={application/octet-stream: OpenApiMediaType {
              schema=OpenApiComponentOrRef {
                ref=#/paths//apps/{app_name}/machines/{machine_id}/exec/post/responses/200/content/application/octet-stream/schema,
                reference=OpenApiSchemaReference {
                  ref=#/components/schemas/flydv1.ExecResponse,
                  name=flydv1.ExecResponse,
                  node={$ref: #/components/schemas/flydv1.ExecResponse},
                },
                node={$ref: #/components/schemas/flydv1.ExecResponse},
              },
              encoding={},
              ref=#/paths//apps/{app_name}/machines/{machine_id}/exec/post/responses/200/content/application/octet-stream,
              node={schema: {$ref: #/components/schemas/flydv1.ExecResponse}},
            }, application/json: OpenApiMediaType {
              schema=OpenApiComponentOrRef {
                ref=#/paths//apps/{app_name}/machines/{machine_id}/exec/post/responses/200/content/application/json/schema,
                reference=OpenApiSchemaReference {
                  ref=#/components/schemas/flydv1.ExecResponse,
                  name=flydv1.ExecResponse,
                  node={$ref: #/components/schemas/flydv1.ExecResponse},
                },
                node={$ref: #/components/schemas/flydv1.ExecResponse},
              },
              encoding={},
              ref=#/paths//apps/{app_name}/machines/{machine_id}/exec/post/responses/200/content/application/json,
              node={schema: {$ref: #/components/schemas/flydv1.ExecResponse}},
            }},
            ref=#/paths//apps/{app_name}/machines/{machine_id}/exec/post/responses/200,
            node={description: stdout, stderr, exit code, and exit signal are returned, content: {application/octet-stream: {schema: {$ref: #/components/schemas/flydv1.ExecResponse}}, application/json: {schema: {$ref: #/components/schemas/flydv1.ExecResponse}}}},
          },
        }, 400: OpenApiComponentOrRef {
          ref=#/paths//apps/{app_name}/machines/{machine_id}/exec/post/responses/400,
          component=OpenApiResponse {
            description=Bad Request,
            content={application/octet-stream: OpenApiMediaType {
              schema=OpenApiComponentOrRef {
                ref=#/paths//apps/{app_name}/machines/{machine_id}/exec/post/responses/400/content/application/octet-stream/schema,
                reference=OpenApiSchemaReference {
                  ref=#/components/schemas/ErrorResponse,
                  name=ErrorResponse,
                  node={$ref: #/components/schemas/ErrorResponse},
                },
                node={$ref: #/components/schemas/ErrorResponse},
              },
              encoding={},
              ref=#/paths//apps/{app_name}/machines/{machine_id}/exec/post/responses/400/content/application/octet-stream,
              node={schema: {$ref: #/components/schemas/ErrorResponse}},
            }, application/json: OpenApiMediaType {
              schema=OpenApiComponentOrRef {
                ref=#/paths//apps/{app_name}/machines/{machine_id}/exec/post/responses/400/content/application/json/schema,
                reference=OpenApiSchemaReference {
                  ref=#/components/schemas/ErrorResponse,
                  name=ErrorResponse,
                  node={$ref: #/components/schemas/ErrorResponse},
                },
                node={$ref: #/components/schemas/ErrorResponse},
              },
              encoding={},
              ref=#/paths//apps/{app_name}/machines/{machine_id}/exec/post/responses/400/content/application/json,
              node={schema: {$ref: #/components/schemas/ErrorResponse}},
            }},
            ref=#/paths//apps/{app_name}/machines/{machine_id}/exec/post/responses/400,
            node={description: Bad Request, content: {application/octet-stream: {schema: {$ref: #/components/schemas/ErrorResponse}}, application/json: {schema: {$ref: #/components/schemas/ErrorResponse}}}},
          },
        }},
        extensions={x-codegen-request-body-name: request},
      }},
      parameters=[],
      ref=#/paths//apps/{app_name}/machines/{machine_id}/exec,
      node={post: {tags: [Machines], summary: Execute Command, description: Execute a command on a specific Machine and return the raw command output bytes.
, operationId: Machines_exec, parameters: [{name: app_name, in: path, description: Fly App Name, required: true, schema: {type: string}}, {name: machine_id, in: path, description: Machine ID, required: true, schema: {type: string}}], requestBody: {description: Request body, content: {application/json: {schema: {$ref: #/components/schemas/MachineExecRequest}}}, required: true}, responses: {200: {description: stdout, stderr, exit code, and exit signal are returned, content: {application/octet-stream: {schema: {$ref: #/components/schemas/flydv1.ExecResponse}}, application/json: {schema: {$ref: #/components/schemas/flydv1.ExecResponse}}}}, 400: {description: Bad Request, content: {application/octet-stream: {schema: {$ref: #/components/schemas/ErrorResponse}}, application/json: {schema: {$ref: #/components/schemas/ErrorResponse}}}}}, x-codegen-request-body-name: request}},
    },
  }, /apps/{app_name}/machines/{machine_id}/lease: OpenApiComponentOrRef {
    ref=#/paths//apps/{app_name}/machines/{machine_id}/lease,
    component=OpenApiPathItem {
      operations={get: OpenApiOperation {
        type=get,
        tags=[Machines],
        summary=Get Lease,
        description=Retrieve the current lease of a specific Machine within an app. Machine leases can be used to obtain an exclusive lock on modifying a Machine.
,
        operationId=Machines_show_lease,
        parameters=[OpenApiComponentOrRef {
          ref=#/paths//apps/{app_name}/machines/{machine_id}/lease/get/parameters/0,
          component=OpenApiParameter {
            name=app_name,
            location=path,
            description=Fly App Name,
            required=true,
            schema=OpenApiComponentOrRef {
              ref=#/paths//apps/{app_name}/machines/{machine_id}/lease/get/parameters/0/schema,
              component=OpenApiSchema {
                type=string,
                ref=#/paths//apps/{app_name}/machines/{machine_id}/lease/get/parameters/0/schema,
                node={type: string},
              },
            },
            ref=#/paths//apps/{app_name}/machines/{machine_id}/lease/get/parameters/0,
            node={name: app_name, in: path, description: Fly App Name, required: true, schema: {type: string}},
          },
        }, OpenApiComponentOrRef {
          ref=#/paths//apps/{app_name}/machines/{machine_id}/lease/get/parameters/1,
          component=OpenApiParameter {
            name=machine_id,
            location=path,
            description=Machine ID,
            required=true,
            schema=OpenApiComponentOrRef {
              ref=#/paths//apps/{app_name}/machines/{machine_id}/lease/get/parameters/1/schema,
              component=OpenApiSchema {
                type=string,
                ref=#/paths//apps/{app_name}/machines/{machine_id}/lease/get/parameters/1/schema,
                node={type: string},
              },
            },
            ref=#/paths//apps/{app_name}/machines/{machine_id}/lease/get/parameters/1,
            node={name: machine_id, in: path, description: Machine ID, required: true, schema: {type: string}},
          },
        }],
        responses={200: OpenApiComponentOrRef {
          ref=#/paths//apps/{app_name}/machines/{machine_id}/lease/get/responses/200,
          component=OpenApiResponse {
            description=OK,
            content={application/json: OpenApiMediaType {
              schema=OpenApiComponentOrRef {
                ref=#/paths//apps/{app_name}/machines/{machine_id}/lease/get/responses/200/content/application/json/schema,
                reference=OpenApiSchemaReference {
                  ref=#/components/schemas/Lease,
                  name=Lease,
                  node={$ref: #/components/schemas/Lease},
                },
                node={$ref: #/components/schemas/Lease},
              },
              encoding={},
              ref=#/paths//apps/{app_name}/machines/{machine_id}/lease/get/responses/200/content/application/json,
              node={schema: {$ref: #/components/schemas/Lease}},
            }},
            ref=#/paths//apps/{app_name}/machines/{machine_id}/lease/get/responses/200,
            node={description: OK, content: {application/json: {schema: {$ref: #/components/schemas/Lease}}}},
          },
        }},
      }, post: OpenApiOperation {
        type=post,
        tags=[Machines],
        summary=Create Lease,
        description=Create a lease for a specific Machine within an app using the details provided in the request body. Machine leases can be used to obtain an exclusive lock on modifying a Machine.
,
        operationId=Machines_create_lease,
        parameters=[OpenApiComponentOrRef {
          ref=#/paths//apps/{app_name}/machines/{machine_id}/lease/post/parameters/0,
          component=OpenApiParameter {
            name=app_name,
            location=path,
            description=Fly App Name,
            required=true,
            schema=OpenApiComponentOrRef {
              ref=#/paths//apps/{app_name}/machines/{machine_id}/lease/post/parameters/0/schema,
              component=OpenApiSchema {
                type=string,
                ref=#/paths//apps/{app_name}/machines/{machine_id}/lease/post/parameters/0/schema,
                node={type: string},
              },
            },
            ref=#/paths//apps/{app_name}/machines/{machine_id}/lease/post/parameters/0,
            node={name: app_name, in: path, description: Fly App Name, required: true, schema: {type: string}},
          },
        }, OpenApiComponentOrRef {
          ref=#/paths//apps/{app_name}/machines/{machine_id}/lease/post/parameters/1,
          component=OpenApiParameter {
            name=machine_id,
            location=path,
            description=Machine ID,
            required=true,
            schema=OpenApiComponentOrRef {
              ref=#/paths//apps/{app_name}/machines/{machine_id}/lease/post/parameters/1/schema,
              component=OpenApiSchema {
                type=string,
                ref=#/paths//apps/{app_name}/machines/{machine_id}/lease/post/parameters/1/schema,
                node={type: string},
              },
            },
            ref=#/paths//apps/{app_name}/machines/{machine_id}/lease/post/parameters/1,
            node={name: machine_id, in: path, description: Machine ID, required: true, schema: {type: string}},
          },
        }, OpenApiComponentOrRef {
          ref=#/paths//apps/{app_name}/machines/{machine_id}/lease/post/parameters/2,
          component=OpenApiParameter {
            name=fly-machine-lease-nonce,
            location=header,
            description=Existing lease nonce to refresh by ttl, empty or non-existent to create a new lease,
            schema=OpenApiComponentOrRef {
              ref=#/paths//apps/{app_name}/machines/{machine_id}/lease/post/parameters/2/schema,
              component=OpenApiSchema {
                type=string,
                ref=#/paths//apps/{app_name}/machines/{machine_id}/lease/post/parameters/2/schema,
                node={type: string},
              },
            },
            ref=#/paths//apps/{app_name}/machines/{machine_id}/lease/post/parameters/2,
            node={name: fly-machine-lease-nonce, in: header, description: Existing lease nonce to refresh by ttl, empty or non-existent to create a new lease, schema: {type: string}},
          },
        }],
        requestBody=OpenApiComponentOrRef {
          ref=#/paths//apps/{app_name}/machines/{machine_id}/lease/post/requestBody,
          component=OpenApiRequestBody {
            content={application/json: OpenApiMediaType {
              schema=OpenApiComponentOrRef {
                ref=#/paths//apps/{app_name}/machines/{machine_id}/lease/post/requestBody/content/application/json/schema,
                reference=OpenApiSchemaReference {
                  ref=#/components/schemas/CreateLeaseRequest,
                  name=CreateLeaseRequest,
                  node={$ref: #/components/schemas/CreateLeaseRequest},
                },
                node={$ref: #/components/schemas/CreateLeaseRequest},
              },
              encoding={},
              ref=#/paths//apps/{app_name}/machines/{machine_id}/lease/post/requestBody/content/application/json,
              node={schema: {$ref: #/components/schemas/CreateLeaseRequest}},
            }},
            description=Request body,
            required=true,
            ref=#/paths//apps/{app_name}/machines/{machine_id}/lease/post/requestBody,
            node={description: Request body, content: {application/json: {schema: {$ref: #/components/schemas/CreateLeaseRequest}}}, required: true},
          },
        },
        responses={200: OpenApiComponentOrRef {
          ref=#/paths//apps/{app_name}/machines/{machine_id}/lease/post/responses/200,
          component=OpenApiResponse {
            description=OK,
            content={application/json: OpenApiMediaType {
              schema=OpenApiComponentOrRef {
                ref=#/paths//apps/{app_name}/machines/{machine_id}/lease/post/responses/200/content/application/json/schema,
                reference=OpenApiSchemaReference {
                  ref=#/components/schemas/Lease,
                  name=Lease,
                  node={$ref: #/components/schemas/Lease},
                },
                node={$ref: #/components/schemas/Lease},
              },
              encoding={},
              ref=#/paths//apps/{app_name}/machines/{machine_id}/lease/post/responses/200/content/application/json,
              node={schema: {$ref: #/components/schemas/Lease}},
            }},
            ref=#/paths//apps/{app_name}/machines/{machine_id}/lease/post/responses/200,
            node={description: OK, content: {application/json: {schema: {$ref: #/components/schemas/Lease}}}},
          },
        }},
        extensions={x-codegen-request-body-name: request},
      }, delete: OpenApiOperation {
        type=delete,
        tags=[Machines],
        summary=Release Lease,
        description=Release the lease of a specific Machine within an app. Machine leases can be used to obtain an exclusive lock on modifying a Machine.
,
        operationId=Machines_release_lease,
        parameters=[OpenApiComponentOrRef {
          ref=#/paths//apps/{app_name}/machines/{machine_id}/lease/delete/parameters/0,
          component=OpenApiParameter {
            name=app_name,
            location=path,
            description=Fly App Name,
            required=true,
            schema=OpenApiComponentOrRef {
              ref=#/paths//apps/{app_name}/machines/{machine_id}/lease/delete/parameters/0/schema,
              component=OpenApiSchema {
                type=string,
                ref=#/paths//apps/{app_name}/machines/{machine_id}/lease/delete/parameters/0/schema,
                node={type: string},
              },
            },
            ref=#/paths//apps/{app_name}/machines/{machine_id}/lease/delete/parameters/0,
            node={name: app_name, in: path, description: Fly App Name, required: true, schema: {type: string}},
          },
        }, OpenApiComponentOrRef {
          ref=#/paths//apps/{app_name}/machines/{machine_id}/lease/delete/parameters/1,
          component=OpenApiParameter {
            name=machine_id,
            location=path,
            description=Machine ID,
            required=true,
            schema=OpenApiComponentOrRef {
              ref=#/paths//apps/{app_name}/machines/{machine_id}/lease/delete/parameters/1/schema,
              component=OpenApiSchema {
                type=string,
                ref=#/paths//apps/{app_name}/machines/{machine_id}/lease/delete/parameters/1/schema,
                node={type: string},
              },
            },
            ref=#/paths//apps/{app_name}/machines/{machine_id}/lease/delete/parameters/1,
            node={name: machine_id, in: path, description: Machine ID, required: true, schema: {type: string}},
          },
        }, OpenApiComponentOrRef {
          ref=#/paths//apps/{app_name}/machines/{machine_id}/lease/delete/parameters/2,
          component=OpenApiParameter {
            name=fly-machine-lease-nonce,
            location=header,
            description=Existing lease nonce,
            required=true,
            schema=OpenApiComponentOrRef {
              ref=#/paths//apps/{app_name}/machines/{machine_id}/lease/delete/parameters/2/schema,
              component=OpenApiSchema {
                type=string,
                ref=#/paths//apps/{app_name}/machines/{machine_id}/lease/delete/parameters/2/schema,
                node={type: string},
              },
            },
            ref=#/paths//apps/{app_name}/machines/{machine_id}/lease/delete/parameters/2,
            node={name: fly-machine-lease-nonce, in: header, description: Existing lease nonce, required: true, schema: {type: string}},
          },
        }],
        responses={200: OpenApiComponentOrRef {
          ref=#/paths//apps/{app_name}/machines/{machine_id}/lease/delete/responses/200,
          component=OpenApiResponse {
            description=OK,
            content={},
            ref=#/paths//apps/{app_name}/machines/{machine_id}/lease/delete/responses/200,
            node={description: OK, content: {}},
          },
        }},
      }},
      parameters=[],
      ref=#/paths//apps/{app_name}/machines/{machine_id}/lease,
      node={get: {tags: [Machines], summary: Get Lease, description: Retrieve the current lease of a specific Machine within an app. Machine leases can be used to obtain an exclusive lock on modifying a Machine.
, operationId: Machines_show_lease, parameters: [{name: app_name, in: path, description: Fly App Name, required: true, schema: {type: string}}, {name: machine_id, in: path, description: Machine ID, required: true, schema: {type: string}}], responses: {200: {description: OK, content: {application/json: {schema: {$ref: #/components/schemas/Lease}}}}}}, post: {tags: [Machines], summary: Create Lease, description: Create a lease for a specific Machine within an app using the details provided in the request body. Machine leases can be used to obtain an exclusive lock on modifying a Machine.
, operationId: Machines_create_lease, parameters: [{name: app_name, in: path, description: Fly App Name, required: true, schema: {type: string}}, {name: machine_id, in: path, description: Machine ID, required: true, schema: {type: string}}, {name: fly-machine-lease-nonce, in: header, description: Existing lease nonce to refresh by ttl, empty or non-existent to create a new lease, schema: {type: string}}], requestBody: {description: Request body, content: {application/json: {schema: {$ref: #/components/schemas/CreateLeaseRequest}}}, required: true}, responses: {200: {description: OK, content: {application/json: {schema: {$ref: #/components/schemas/Lease}}}}}, x-codegen-request-body-name: request}, delete: {tags: [Machines], summary: Release Lease, description: Release the lease of a specific Machine within an app. Machine leases can be used to obtain an exclusive lock on modifying a Machine.
, operationId: Machines_release_lease, parameters: [{name: app_name, in: path, description: Fly App Name, required: true, schema: {type: string}}, {name: machine_id, in: path, description: Machine ID, required: true, schema: {type: string}}, {name: fly-machine-lease-nonce, in: header, description: Existing lease nonce, required: true, schema: {type: string}}], responses: {200: {description: OK, content: {}}}}},
    },
  }, /apps/{app_name}/machines/{machine_id}/metadata: OpenApiComponentOrRef {
    ref=#/paths//apps/{app_name}/machines/{machine_id}/metadata,
    component=OpenApiPathItem {
      operations={get: OpenApiOperation {
        type=get,
        tags=[Machines],
        summary=Get Metadata,
        description=Retrieve metadata for a specific Machine within an app.
,
        operationId=Machines_show_metadata,
        parameters=[OpenApiComponentOrRef {
          ref=#/paths//apps/{app_name}/machines/{machine_id}/metadata/get/parameters/0,
          component=OpenApiParameter {
            name=app_name,
            location=path,
            description=Fly App Name,
            required=true,
            schema=OpenApiComponentOrRef {
              ref=#/paths//apps/{app_name}/machines/{machine_id}/metadata/get/parameters/0/schema,
              component=OpenApiSchema {
                type=string,
                ref=#/paths//apps/{app_name}/machines/{machine_id}/metadata/get/parameters/0/schema,
                node={type: string},
              },
            },
            ref=#/paths//apps/{app_name}/machines/{machine_id}/metadata/get/parameters/0,
            node={name: app_name, in: path, description: Fly App Name, required: true, schema: {type: string}},
          },
        }, OpenApiComponentOrRef {
          ref=#/paths//apps/{app_name}/machines/{machine_id}/metadata/get/parameters/1,
          component=OpenApiParameter {
            name=machine_id,
            location=path,
            description=Machine ID,
            required=true,
            schema=OpenApiComponentOrRef {
              ref=#/paths//apps/{app_name}/machines/{machine_id}/metadata/get/parameters/1/schema,
              component=OpenApiSchema {
                type=string,
                ref=#/paths//apps/{app_name}/machines/{machine_id}/metadata/get/parameters/1/schema,
                node={type: string},
              },
            },
            ref=#/paths//apps/{app_name}/machines/{machine_id}/metadata/get/parameters/1,
            node={name: machine_id, in: path, description: Machine ID, required: true, schema: {type: string}},
          },
        }],
        responses={200: OpenApiComponentOrRef {
          ref=#/paths//apps/{app_name}/machines/{machine_id}/metadata/get/responses/200,
          component=OpenApiResponse {
            description=OK,
            content={application/json: OpenApiMediaType {
              schema=OpenApiComponentOrRef {
                ref=#/paths//apps/{app_name}/machines/{machine_id}/metadata/get/responses/200/content/application/json/schema,
                component=OpenApiSchema {
                  type=object,
                  additionalProperties=OpenApiAdditionalProperties {
                    schema=OpenApiComponentOrRef {
                      ref=#/paths//apps/{app_name}/machines/{machine_id}/metadata/get/responses/200/content/application/json/schema/additionalProperties,
                      component=OpenApiSchema {
                        type=string,
                        ref=#/paths//apps/{app_name}/machines/{machine_id}/metadata/get/responses/200/content/application/json/schema/additionalProperties,
                        node={type: string},
                      },
                    },
                  },
                  ref=#/paths//apps/{app_name}/machines/{machine_id}/metadata/get/responses/200/content/application/json/schema,
                  node={type: object, additionalProperties: {type: string}},
                },
              },
              encoding={},
              ref=#/paths//apps/{app_name}/machines/{machine_id}/metadata/get/responses/200/content/application/json,
              node={schema: {type: object, additionalProperties: {type: string}}},
            }},
            ref=#/paths//apps/{app_name}/machines/{machine_id}/metadata/get/responses/200,
            node={description: OK, content: {application/json: {schema: {type: object, additionalProperties: {type: string}}}}},
          },
        }},
      }},
      parameters=[],
      ref=#/paths//apps/{app_name}/machines/{machine_id}/metadata,
      node={get: {tags: [Machines], summary: Get Metadata, description: Retrieve metadata for a specific Machine within an app.
, operationId: Machines_show_metadata, parameters: [{name: app_name, in: path, description: Fly App Name, required: true, schema: {type: string}}, {name: machine_id, in: path, description: Machine ID, required: true, schema: {type: string}}], responses: {200: {description: OK, content: {application/json: {schema: {type: object, additionalProperties: {type: string}}}}}}}},
    },
  }, /apps/{app_name}/machines/{machine_id}/metadata/{key}: OpenApiComponentOrRef {
    ref=#/paths//apps/{app_name}/machines/{machine_id}/metadata/{key},
    component=OpenApiPathItem {
      operations={post: OpenApiOperation {
        type=post,
        tags=[Machines],
        summary=Update Metadata,
        description=Update metadata for a specific machine within an app by providing a metadata key.
,
        operationId=Machines_update_metadata,
        parameters=[OpenApiComponentOrRef {
          ref=#/paths//apps/{app_name}/machines/{machine_id}/metadata/{key}/post/parameters/0,
          component=OpenApiParameter {
            name=app_name,
            location=path,
            description=Fly App Name,
            required=true,
            schema=OpenApiComponentOrRef {
              ref=#/paths//apps/{app_name}/machines/{machine_id}/metadata/{key}/post/parameters/0/schema,
              component=OpenApiSchema {
                type=string,
                ref=#/paths//apps/{app_name}/machines/{machine_id}/metadata/{key}/post/parameters/0/schema,
                node={type: string},
              },
            },
            ref=#/paths//apps/{app_name}/machines/{machine_id}/metadata/{key}/post/parameters/0,
            node={name: app_name, in: path, description: Fly App Name, required: true, schema: {type: string}},
          },
        }, OpenApiComponentOrRef {
          ref=#/paths//apps/{app_name}/machines/{machine_id}/metadata/{key}/post/parameters/1,
          component=OpenApiParameter {
            name=machine_id,
            location=path,
            description=Machine ID,
            required=true,
            schema=OpenApiComponentOrRef {
              ref=#/paths//apps/{app_name}/machines/{machine_id}/metadata/{key}/post/parameters/1/schema,
              component=OpenApiSchema {
                type=string,
                ref=#/paths//apps/{app_name}/machines/{machine_id}/metadata/{key}/post/parameters/1/schema,
                node={type: string},
              },
            },
            ref=#/paths//apps/{app_name}/machines/{machine_id}/metadata/{key}/post/parameters/1,
            node={name: machine_id, in: path, description: Machine ID, required: true, schema: {type: string}},
          },
        }, OpenApiComponentOrRef {
          ref=#/paths//apps/{app_name}/machines/{machine_id}/metadata/{key}/post/parameters/2,
          component=OpenApiParameter {
            name=key,
            location=path,
            description=Metadata Key,
            required=true,
            schema=OpenApiComponentOrRef {
              ref=#/paths//apps/{app_name}/machines/{machine_id}/metadata/{key}/post/parameters/2/schema,
              component=OpenApiSchema {
                type=string,
                ref=#/paths//apps/{app_name}/machines/{machine_id}/metadata/{key}/post/parameters/2/schema,
                node={type: string},
              },
            },
            ref=#/paths//apps/{app_name}/machines/{machine_id}/metadata/{key}/post/parameters/2,
            node={name: key, in: path, description: Metadata Key, required: true, schema: {type: string}},
          },
        }],
        responses={204: OpenApiComponentOrRef {
          ref=#/paths//apps/{app_name}/machines/{machine_id}/metadata/{key}/post/responses/204,
          component=OpenApiResponse {
            description=No Content,
            content={},
            ref=#/paths//apps/{app_name}/machines/{machine_id}/metadata/{key}/post/responses/204,
            node={description: No Content, content: {}},
          },
        }, 400: OpenApiComponentOrRef {
          ref=#/paths//apps/{app_name}/machines/{machine_id}/metadata/{key}/post/responses/400,
          component=OpenApiResponse {
            description=Bad Request,
            content={application/json: OpenApiMediaType {
              schema=OpenApiComponentOrRef {
                ref=#/paths//apps/{app_name}/machines/{machine_id}/metadata/{key}/post/responses/400/content/application/json/schema,
                reference=OpenApiSchemaReference {
                  ref=#/components/schemas/ErrorResponse,
                  name=ErrorResponse,
                  node={$ref: #/components/schemas/ErrorResponse},
                },
                node={$ref: #/components/schemas/ErrorResponse},
              },
              encoding={},
              ref=#/paths//apps/{app_name}/machines/{machine_id}/metadata/{key}/post/responses/400/content/application/json,
              node={schema: {$ref: #/components/schemas/ErrorResponse}},
            }},
            ref=#/paths//apps/{app_name}/machines/{machine_id}/metadata/{key}/post/responses/400,
            node={description: Bad Request, content: {application/json: {schema: {$ref: #/components/schemas/ErrorResponse}}}},
          },
        }},
      }, delete: OpenApiOperation {
        type=delete,
        tags=[Machines],
        summary=Delete Metadata,
        description=Delete metadata for a specific Machine within an app by providing a metadata key.
,
        operationId=Machines_delete_metadata,
        parameters=[OpenApiComponentOrRef {
          ref=#/paths//apps/{app_name}/machines/{machine_id}/metadata/{key}/delete/parameters/0,
          component=OpenApiParameter {
            name=app_name,
            location=path,
            description=Fly App Name,
            required=true,
            schema=OpenApiComponentOrRef {
              ref=#/paths//apps/{app_name}/machines/{machine_id}/metadata/{key}/delete/parameters/0/schema,
              component=OpenApiSchema {
                type=string,
                ref=#/paths//apps/{app_name}/machines/{machine_id}/metadata/{key}/delete/parameters/0/schema,
                node={type: string},
              },
            },
            ref=#/paths//apps/{app_name}/machines/{machine_id}/metadata/{key}/delete/parameters/0,
            node={name: app_name, in: path, description: Fly App Name, required: true, schema: {type: string}},
          },
        }, OpenApiComponentOrRef {
          ref=#/paths//apps/{app_name}/machines/{machine_id}/metadata/{key}/delete/parameters/1,
          component=OpenApiParameter {
            name=machine_id,
            location=path,
            description=Machine ID,
            required=true,
            schema=OpenApiComponentOrRef {
              ref=#/paths//apps/{app_name}/machines/{machine_id}/metadata/{key}/delete/parameters/1/schema,
              component=OpenApiSchema {
                type=string,
                ref=#/paths//apps/{app_name}/machines/{machine_id}/metadata/{key}/delete/parameters/1/schema,
                node={type: string},
              },
            },
            ref=#/paths//apps/{app_name}/machines/{machine_id}/metadata/{key}/delete/parameters/1,
            node={name: machine_id, in: path, description: Machine ID, required: true, schema: {type: string}},
          },
        }, OpenApiComponentOrRef {
          ref=#/paths//apps/{app_name}/machines/{machine_id}/metadata/{key}/delete/parameters/2,
          component=OpenApiParameter {
            name=key,
            location=path,
            description=Metadata Key,
            required=true,
            schema=OpenApiComponentOrRef {
              ref=#/paths//apps/{app_name}/machines/{machine_id}/metadata/{key}/delete/parameters/2/schema,
              component=OpenApiSchema {
                type=string,
                ref=#/paths//apps/{app_name}/machines/{machine_id}/metadata/{key}/delete/parameters/2/schema,
                node={type: string},
              },
            },
            ref=#/paths//apps/{app_name}/machines/{machine_id}/metadata/{key}/delete/parameters/2,
            node={name: key, in: path, description: Metadata Key, required: true, schema: {type: string}},
          },
        }],
        responses={204: OpenApiComponentOrRef {
          ref=#/paths//apps/{app_name}/machines/{machine_id}/metadata/{key}/delete/responses/204,
          component=OpenApiResponse {
            description=No Content,
            content={},
            ref=#/paths//apps/{app_name}/machines/{machine_id}/metadata/{key}/delete/responses/204,
            node={description: No Content, content: {}},
          },
        }},
      }},
      parameters=[],
      ref=#/paths//apps/{app_name}/machines/{machine_id}/metadata/{key},
      node={post: {tags: [Machines], summary: Update Metadata, description: Update metadata for a specific machine within an app by providing a metadata key.
, operationId: Machines_update_metadata, parameters: [{name: app_name, in: path, description: Fly App Name, required: true, schema: {type: string}}, {name: machine_id, in: path, description: Machine ID, required: true, schema: {type: string}}, {name: key, in: path, description: Metadata Key, required: true, schema: {type: string}}], responses: {204: {description: No Content, content: {}}, 400: {description: Bad Request, content: {application/json: {schema: {$ref: #/components/schemas/ErrorResponse}}}}}}, delete: {tags: [Machines], summary: Delete Metadata, description: Delete metadata for a specific Machine within an app by providing a metadata key.
, operationId: Machines_delete_metadata, parameters: [{name: app_name, in: path, description: Fly App Name, required: true, schema: {type: string}}, {name: machine_id, in: path, description: Machine ID, required: true, schema: {type: string}}, {name: key, in: path, description: Metadata Key, required: true, schema: {type: string}}], responses: {204: {description: No Content, content: {}}}}},
    },
  }, /apps/{app_name}/machines/{machine_id}/ps: OpenApiComponentOrRef {
    ref=#/paths//apps/{app_name}/machines/{machine_id}/ps,
    component=OpenApiPathItem {
      operations={get: OpenApiOperation {
        type=get,
        tags=[Machines],
        summary=List Processes,
        description=List all processes running on a specific Machine within an app, with optional sorting parameters.
,
        operationId=Machines_list_processes,
        parameters=[OpenApiComponentOrRef {
          ref=#/paths//apps/{app_name}/machines/{machine_id}/ps/get/parameters/0,
          component=OpenApiParameter {
            name=app_name,
            location=path,
            description=Fly App Name,
            required=true,
            schema=OpenApiComponentOrRef {
              ref=#/paths//apps/{app_name}/machines/{machine_id}/ps/get/parameters/0/schema,
              component=OpenApiSchema {
                type=string,
                ref=#/paths//apps/{app_name}/machines/{machine_id}/ps/get/parameters/0/schema,
                node={type: string},
              },
            },
            ref=#/paths//apps/{app_name}/machines/{machine_id}/ps/get/parameters/0,
            node={name: app_name, in: path, description: Fly App Name, required: true, schema: {type: string}},
          },
        }, OpenApiComponentOrRef {
          ref=#/paths//apps/{app_name}/machines/{machine_id}/ps/get/parameters/1,
          component=OpenApiParameter {
            name=machine_id,
            location=path,
            description=Machine ID,
            required=true,
            schema=OpenApiComponentOrRef {
              ref=#/paths//apps/{app_name}/machines/{machine_id}/ps/get/parameters/1/schema,
              component=OpenApiSchema {
                type=string,
                ref=#/paths//apps/{app_name}/machines/{machine_id}/ps/get/parameters/1/schema,
                node={type: string},
              },
            },
            ref=#/paths//apps/{app_name}/machines/{machine_id}/ps/get/parameters/1,
            node={name: machine_id, in: path, description: Machine ID, required: true, schema: {type: string}},
          },
        }, OpenApiComponentOrRef {
          ref=#/paths//apps/{app_name}/machines/{machine_id}/ps/get/parameters/2,
          component=OpenApiParameter {
            name=sort_by,
            location=query,
            description=Sort by,
            schema=OpenApiComponentOrRef {
              ref=#/paths//apps/{app_name}/machines/{machine_id}/ps/get/parameters/2/schema,
              component=OpenApiSchema {
                type=string,
                ref=#/paths//apps/{app_name}/machines/{machine_id}/ps/get/parameters/2/schema,
                node={type: string},
              },
            },
            ref=#/paths//apps/{app_name}/machines/{machine_id}/ps/get/parameters/2,
            node={name: sort_by, in: query, description: Sort by, schema: {type: string}},
          },
        }, OpenApiComponentOrRef {
          ref=#/paths//apps/{app_name}/machines/{machine_id}/ps/get/parameters/3,
          component=OpenApiParameter {
            name=order,
            location=query,
            description=Order,
            schema=OpenApiComponentOrRef {
              ref=#/paths//apps/{app_name}/machines/{machine_id}/ps/get/parameters/3/schema,
              component=OpenApiSchema {
                type=string,
                ref=#/paths//apps/{app_name}/machines/{machine_id}/ps/get/parameters/3/schema,
                node={type: string},
              },
            },
            ref=#/paths//apps/{app_name}/machines/{machine_id}/ps/get/parameters/3,
            node={name: order, in: query, description: Order, schema: {type: string}},
          },
        }],
        responses={200: OpenApiComponentOrRef {
          ref=#/paths//apps/{app_name}/machines/{machine_id}/ps/get/responses/200,
          component=OpenApiResponse {
            description=OK,
            content={application/json: OpenApiMediaType {
              schema=OpenApiComponentOrRef {
                ref=#/paths//apps/{app_name}/machines/{machine_id}/ps/get/responses/200/content/application/json/schema,
                component=OpenApiSchema {
                  type=array,
                  items=OpenApiComponentOrRef {
                    ref=#/paths//apps/{app_name}/machines/{machine_id}/ps/get/responses/200/content/application/json/schema/items,
                    reference=OpenApiSchemaReference {
                      ref=#/components/schemas/ProcessStat,
                      name=ProcessStat,
                      node={$ref: #/components/schemas/ProcessStat},
                    },
                    node={$ref: #/components/schemas/ProcessStat},
                  },
                  ref=#/paths//apps/{app_name}/machines/{machine_id}/ps/get/responses/200/content/application/json/schema,
                  node={type: array, items: {$ref: #/components/schemas/ProcessStat}},
                },
              },
              encoding={},
              ref=#/paths//apps/{app_name}/machines/{machine_id}/ps/get/responses/200/content/application/json,
              node={schema: {type: array, items: {$ref: #/components/schemas/ProcessStat}}},
            }},
            ref=#/paths//apps/{app_name}/machines/{machine_id}/ps/get/responses/200,
            node={description: OK, content: {application/json: {schema: {type: array, items: {$ref: #/components/schemas/ProcessStat}}}}},
          },
        }, 400: OpenApiComponentOrRef {
          ref=#/paths//apps/{app_name}/machines/{machine_id}/ps/get/responses/400,
          component=OpenApiResponse {
            description=Bad Request,
            content={application/json: OpenApiMediaType {
              schema=OpenApiComponentOrRef {
                ref=#/paths//apps/{app_name}/machines/{machine_id}/ps/get/responses/400/content/application/json/schema,
                reference=OpenApiSchemaReference {
                  ref=#/components/schemas/ErrorResponse,
                  name=ErrorResponse,
                  node={$ref: #/components/schemas/ErrorResponse},
                },
                node={$ref: #/components/schemas/ErrorResponse},
              },
              encoding={},
              ref=#/paths//apps/{app_name}/machines/{machine_id}/ps/get/responses/400/content/application/json,
              node={schema: {$ref: #/components/schemas/ErrorResponse}},
            }},
            ref=#/paths//apps/{app_name}/machines/{machine_id}/ps/get/responses/400,
            node={description: Bad Request, content: {application/json: {schema: {$ref: #/components/schemas/ErrorResponse}}}},
          },
        }},
      }},
      parameters=[],
      ref=#/paths//apps/{app_name}/machines/{machine_id}/ps,
      node={get: {tags: [Machines], summary: List Processes, description: List all processes running on a specific Machine within an app, with optional sorting parameters.
, operationId: Machines_list_processes, parameters: [{name: app_name, in: path, description: Fly App Name, required: true, schema: {type: string}}, {name: machine_id, in: path, description: Machine ID, required: true, schema: {type: string}}, {name: sort_by, in: query, description: Sort by, schema: {type: string}}, {name: order, in: query, description: Order, schema: {type: string}}], responses: {200: {description: OK, content: {application/json: {schema: {type: array, items: {$ref: #/components/schemas/ProcessStat}}}}}, 400: {description: Bad Request, content: {application/json: {schema: {$ref: #/components/schemas/ErrorResponse}}}}}}},
    },
  }, /apps/{app_name}/machines/{machine_id}/restart: OpenApiComponentOrRef {
    ref=#/paths//apps/{app_name}/machines/{machine_id}/restart,
    component=OpenApiPathItem {
      operations={post: OpenApiOperation {
        type=post,
        tags=[Machines],
        summary=Restart Machine,
        description=Restart a specific Machine within an app, with an optional timeout parameter.
,
        operationId=Machines_restart,
        parameters=[OpenApiComponentOrRef {
          ref=#/paths//apps/{app_name}/machines/{machine_id}/restart/post/parameters/0,
          component=OpenApiParameter {
            name=app_name,
            location=path,
            description=Fly App Name,
            required=true,
            schema=OpenApiComponentOrRef {
              ref=#/paths//apps/{app_name}/machines/{machine_id}/restart/post/parameters/0/schema,
              component=OpenApiSchema {
                type=string,
                ref=#/paths//apps/{app_name}/machines/{machine_id}/restart/post/parameters/0/schema,
                node={type: string},
              },
            },
            ref=#/paths//apps/{app_name}/machines/{machine_id}/restart/post/parameters/0,
            node={name: app_name, in: path, description: Fly App Name, required: true, schema: {type: string}},
          },
        }, OpenApiComponentOrRef {
          ref=#/paths//apps/{app_name}/machines/{machine_id}/restart/post/parameters/1,
          component=OpenApiParameter {
            name=machine_id,
            location=path,
            description=Machine ID,
            required=true,
            schema=OpenApiComponentOrRef {
              ref=#/paths//apps/{app_name}/machines/{machine_id}/restart/post/parameters/1/schema,
              component=OpenApiSchema {
                type=string,
                ref=#/paths//apps/{app_name}/machines/{machine_id}/restart/post/parameters/1/schema,
                node={type: string},
              },
            },
            ref=#/paths//apps/{app_name}/machines/{machine_id}/restart/post/parameters/1,
            node={name: machine_id, in: path, description: Machine ID, required: true, schema: {type: string}},
          },
        }, OpenApiComponentOrRef {
          ref=#/paths//apps/{app_name}/machines/{machine_id}/restart/post/parameters/2,
          component=OpenApiParameter {
            name=timeout,
            location=query,
            description=Restart timeout as a Go duration string or number of seconds,
            schema=OpenApiComponentOrRef {
              ref=#/paths//apps/{app_name}/machines/{machine_id}/restart/post/parameters/2/schema,
              component=OpenApiSchema {
                type=string,
                ref=#/paths//apps/{app_name}/machines/{machine_id}/restart/post/parameters/2/schema,
                node={type: string},
              },
            },
            ref=#/paths//apps/{app_name}/machines/{machine_id}/restart/post/parameters/2,
            node={name: timeout, in: query, description: Restart timeout as a Go duration string or number of seconds, schema: {type: string}},
          },
        }, OpenApiComponentOrRef {
          ref=#/paths//apps/{app_name}/machines/{machine_id}/restart/post/parameters/3,
          component=OpenApiParameter {
            name=signal,
            location=query,
            description=Unix signal name,
            schema=OpenApiComponentOrRef {
              ref=#/paths//apps/{app_name}/machines/{machine_id}/restart/post/parameters/3/schema,
              component=OpenApiSchema {
                type=string,
                ref=#/paths//apps/{app_name}/machines/{machine_id}/restart/post/parameters/3/schema,
                node={type: string},
              },
            },
            ref=#/paths//apps/{app_name}/machines/{machine_id}/restart/post/parameters/3,
            node={name: signal, in: query, description: Unix signal name, schema: {type: string}},
          },
        }],
        responses={200: OpenApiComponentOrRef {
          ref=#/paths//apps/{app_name}/machines/{machine_id}/restart/post/responses/200,
          component=OpenApiResponse {
            description=OK,
            content={},
            ref=#/paths//apps/{app_name}/machines/{machine_id}/restart/post/responses/200,
            node={description: OK, content: {}},
          },
        }, 400: OpenApiComponentOrRef {
          ref=#/paths//apps/{app_name}/machines/{machine_id}/restart/post/responses/400,
          component=OpenApiResponse {
            description=Bad Request,
            content={application/json: OpenApiMediaType {
              schema=OpenApiComponentOrRef {
                ref=#/paths//apps/{app_name}/machines/{machine_id}/restart/post/responses/400/content/application/json/schema,
                reference=OpenApiSchemaReference {
                  ref=#/components/schemas/ErrorResponse,
                  name=ErrorResponse,
                  node={$ref: #/components/schemas/ErrorResponse},
                },
                node={$ref: #/components/schemas/ErrorResponse},
              },
              encoding={},
              ref=#/paths//apps/{app_name}/machines/{machine_id}/restart/post/responses/400/content/application/json,
              node={schema: {$ref: #/components/schemas/ErrorResponse}},
            }},
            ref=#/paths//apps/{app_name}/machines/{machine_id}/restart/post/responses/400,
            node={description: Bad Request, content: {application/json: {schema: {$ref: #/components/schemas/ErrorResponse}}}},
          },
        }},
      }},
      parameters=[],
      ref=#/paths//apps/{app_name}/machines/{machine_id}/restart,
      node={post: {tags: [Machines], summary: Restart Machine, description: Restart a specific Machine within an app, with an optional timeout parameter.
, operationId: Machines_restart, parameters: [{name: app_name, in: path, description: Fly App Name, required: true, schema: {type: string}}, {name: machine_id, in: path, description: Machine ID, required: true, schema: {type: string}}, {name: timeout, in: query, description: Restart timeout as a Go duration string or number of seconds, schema: {type: string}}, {name: signal, in: query, description: Unix signal name, schema: {type: string}}], responses: {200: {description: OK, content: {}}, 400: {description: Bad Request, content: {application/json: {schema: {$ref: #/components/schemas/ErrorResponse}}}}}}},
    },
  }, /apps/{app_name}/machines/{machine_id}/signal: OpenApiComponentOrRef {
    ref=#/paths//apps/{app_name}/machines/{machine_id}/signal,
    component=OpenApiPathItem {
      operations={post: OpenApiOperation {
        type=post,
        tags=[Machines],
        summary=Signal Machine,
        description=Send a signal to a specific Machine within an app using the details provided in the request body.
,
        operationId=Machines_signal,
        parameters=[OpenApiComponentOrRef {
          ref=#/paths//apps/{app_name}/machines/{machine_id}/signal/post/parameters/0,
          component=OpenApiParameter {
            name=app_name,
            location=path,
            description=Fly App Name,
            required=true,
            schema=OpenApiComponentOrRef {
              ref=#/paths//apps/{app_name}/machines/{machine_id}/signal/post/parameters/0/schema,
              component=OpenApiSchema {
                type=string,
                ref=#/paths//apps/{app_name}/machines/{machine_id}/signal/post/parameters/0/schema,
                node={type: string},
              },
            },
            ref=#/paths//apps/{app_name}/machines/{machine_id}/signal/post/parameters/0,
            node={name: app_name, in: path, description: Fly App Name, required: true, schema: {type: string}},
          },
        }, OpenApiComponentOrRef {
          ref=#/paths//apps/{app_name}/machines/{machine_id}/signal/post/parameters/1,
          component=OpenApiParameter {
            name=machine_id,
            location=path,
            description=Machine ID,
            required=true,
            schema=OpenApiComponentOrRef {
              ref=#/paths//apps/{app_name}/machines/{machine_id}/signal/post/parameters/1/schema,
              component=OpenApiSchema {
                type=string,
                ref=#/paths//apps/{app_name}/machines/{machine_id}/signal/post/parameters/1/schema,
                node={type: string},
              },
            },
            ref=#/paths//apps/{app_name}/machines/{machine_id}/signal/post/parameters/1,
            node={name: machine_id, in: path, description: Machine ID, required: true, schema: {type: string}},
          },
        }],
        requestBody=OpenApiComponentOrRef {
          ref=#/paths//apps/{app_name}/machines/{machine_id}/signal/post/requestBody,
          component=OpenApiRequestBody {
            content={application/json: OpenApiMediaType {
              schema=OpenApiComponentOrRef {
                ref=#/paths//apps/{app_name}/machines/{machine_id}/signal/post/requestBody/content/application/json/schema,
                reference=OpenApiSchemaReference {
                  ref=#/components/schemas/SignalRequest,
                  name=SignalRequest,
                  node={$ref: #/components/schemas/SignalRequest},
                },
                node={$ref: #/components/schemas/SignalRequest},
              },
              encoding={},
              ref=#/paths//apps/{app_name}/machines/{machine_id}/signal/post/requestBody/content/application/json,
              node={schema: {$ref: #/components/schemas/SignalRequest}},
            }},
            description=Request body,
            required=true,
            ref=#/paths//apps/{app_name}/machines/{machine_id}/signal/post/requestBody,
            node={description: Request body, content: {application/json: {schema: {$ref: #/components/schemas/SignalRequest}}}, required: true},
          },
        },
        responses={200: OpenApiComponentOrRef {
          ref=#/paths//apps/{app_name}/machines/{machine_id}/signal/post/responses/200,
          component=OpenApiResponse {
            description=OK,
            content={},
            ref=#/paths//apps/{app_name}/machines/{machine_id}/signal/post/responses/200,
            node={description: OK, content: {}},
          },
        }, 400: OpenApiComponentOrRef {
          ref=#/paths//apps/{app_name}/machines/{machine_id}/signal/post/responses/400,
          component=OpenApiResponse {
            description=Bad Request,
            content={application/json: OpenApiMediaType {
              schema=OpenApiComponentOrRef {
                ref=#/paths//apps/{app_name}/machines/{machine_id}/signal/post/responses/400/content/application/json/schema,
                reference=OpenApiSchemaReference {
                  ref=#/components/schemas/ErrorResponse,
                  name=ErrorResponse,
                  node={$ref: #/components/schemas/ErrorResponse},
                },
                node={$ref: #/components/schemas/ErrorResponse},
              },
              encoding={},
              ref=#/paths//apps/{app_name}/machines/{machine_id}/signal/post/responses/400/content/application/json,
              node={schema: {$ref: #/components/schemas/ErrorResponse}},
            }},
            ref=#/paths//apps/{app_name}/machines/{machine_id}/signal/post/responses/400,
            node={description: Bad Request, content: {application/json: {schema: {$ref: #/components/schemas/ErrorResponse}}}},
          },
        }},
        extensions={x-codegen-request-body-name: request},
      }},
      parameters=[],
      ref=#/paths//apps/{app_name}/machines/{machine_id}/signal,
      node={post: {tags: [Machines], summary: Signal Machine, description: Send a signal to a specific Machine within an app using the details provided in the request body.
, operationId: Machines_signal, parameters: [{name: app_name, in: path, description: Fly App Name, required: true, schema: {type: string}}, {name: machine_id, in: path, description: Machine ID, required: true, schema: {type: string}}], requestBody: {description: Request body, content: {application/json: {schema: {$ref: #/components/schemas/SignalRequest}}}, required: true}, responses: {200: {description: OK, content: {}}, 400: {description: Bad Request, content: {application/json: {schema: {$ref: #/components/schemas/ErrorResponse}}}}}, x-codegen-request-body-name: request}},
    },
  }, /apps/{app_name}/machines/{machine_id}/start: OpenApiComponentOrRef {
    ref=#/paths//apps/{app_name}/machines/{machine_id}/start,
    component=OpenApiPathItem {
      operations={post: OpenApiOperation {
        type=post,
        tags=[Machines],
        summary=Start Machine,
        description=Start a specific Machine within an app.
,
        operationId=Machines_start,
        parameters=[OpenApiComponentOrRef {
          ref=#/paths//apps/{app_name}/machines/{machine_id}/start/post/parameters/0,
          component=OpenApiParameter {
            name=app_name,
            location=path,
            description=Fly App Name,
            required=true,
            schema=OpenApiComponentOrRef {
              ref=#/paths//apps/{app_name}/machines/{machine_id}/start/post/parameters/0/schema,
              component=OpenApiSchema {
                type=string,
                ref=#/paths//apps/{app_name}/machines/{machine_id}/start/post/parameters/0/schema,
                node={type: string},
              },
            },
            ref=#/paths//apps/{app_name}/machines/{machine_id}/start/post/parameters/0,
            node={name: app_name, in: path, description: Fly App Name, required: true, schema: {type: string}},
          },
        }, OpenApiComponentOrRef {
          ref=#/paths//apps/{app_name}/machines/{machine_id}/start/post/parameters/1,
          component=OpenApiParameter {
            name=machine_id,
            location=path,
            description=Machine ID,
            required=true,
            schema=OpenApiComponentOrRef {
              ref=#/paths//apps/{app_name}/machines/{machine_id}/start/post/parameters/1/schema,
              component=OpenApiSchema {
                type=string,
                ref=#/paths//apps/{app_name}/machines/{machine_id}/start/post/parameters/1/schema,
                node={type: string},
              },
            },
            ref=#/paths//apps/{app_name}/machines/{machine_id}/start/post/parameters/1,
            node={name: machine_id, in: path, description: Machine ID, required: true, schema: {type: string}},
          },
        }],
        responses={200: OpenApiComponentOrRef {
          ref=#/paths//apps/{app_name}/machines/{machine_id}/start/post/responses/200,
          component=OpenApiResponse {
            description=OK,
            content={},
            ref=#/paths//apps/{app_name}/machines/{machine_id}/start/post/responses/200,
            node={description: OK, content: {}},
          },
        }},
      }},
      parameters=[],
      ref=#/paths//apps/{app_name}/machines/{machine_id}/start,
      node={post: {tags: [Machines], summary: Start Machine, description: Start a specific Machine within an app.
, operationId: Machines_start, parameters: [{name: app_name, in: path, description: Fly App Name, required: true, schema: {type: string}}, {name: machine_id, in: path, description: Machine ID, required: true, schema: {type: string}}], responses: {200: {description: OK, content: {}}}}},
    },
  }, /apps/{app_name}/machines/{machine_id}/stop: OpenApiComponentOrRef {
    ref=#/paths//apps/{app_name}/machines/{machine_id}/stop,
    component=OpenApiPathItem {
      operations={post: OpenApiOperation {
        type=post,
        tags=[Machines],
        summary=Stop Machine,
        description=Stop a specific Machine within an app, with an optional request body to specify signal and timeout.
,
        operationId=Machines_stop,
        parameters=[OpenApiComponentOrRef {
          ref=#/paths//apps/{app_name}/machines/{machine_id}/stop/post/parameters/0,
          component=OpenApiParameter {
            name=app_name,
            location=path,
            description=Fly App Name,
            required=true,
            schema=OpenApiComponentOrRef {
              ref=#/paths//apps/{app_name}/machines/{machine_id}/stop/post/parameters/0/schema,
              component=OpenApiSchema {
                type=string,
                ref=#/paths//apps/{app_name}/machines/{machine_id}/stop/post/parameters/0/schema,
                node={type: string},
              },
            },
            ref=#/paths//apps/{app_name}/machines/{machine_id}/stop/post/parameters/0,
            node={name: app_name, in: path, description: Fly App Name, required: true, schema: {type: string}},
          },
        }, OpenApiComponentOrRef {
          ref=#/paths//apps/{app_name}/machines/{machine_id}/stop/post/parameters/1,
          component=OpenApiParameter {
            name=machine_id,
            location=path,
            description=Machine ID,
            required=true,
            schema=OpenApiComponentOrRef {
              ref=#/paths//apps/{app_name}/machines/{machine_id}/stop/post/parameters/1/schema,
              component=OpenApiSchema {
                type=string,
                ref=#/paths//apps/{app_name}/machines/{machine_id}/stop/post/parameters/1/schema,
                node={type: string},
              },
            },
            ref=#/paths//apps/{app_name}/machines/{machine_id}/stop/post/parameters/1,
            node={name: machine_id, in: path, description: Machine ID, required: true, schema: {type: string}},
          },
        }],
        requestBody=OpenApiComponentOrRef {
          ref=#/paths//apps/{app_name}/machines/{machine_id}/stop/post/requestBody,
          component=OpenApiRequestBody {
            content={application/json: OpenApiMediaType {
              schema=OpenApiComponentOrRef {
                ref=#/paths//apps/{app_name}/machines/{machine_id}/stop/post/requestBody/content/application/json/schema,
                reference=OpenApiSchemaReference {
                  ref=#/components/schemas/StopRequest,
                  name=StopRequest,
                  node={$ref: #/components/schemas/StopRequest},
                },
                node={$ref: #/components/schemas/StopRequest},
              },
              encoding={},
              ref=#/paths//apps/{app_name}/machines/{machine_id}/stop/post/requestBody/content/application/json,
              node={schema: {$ref: #/components/schemas/StopRequest}},
            }},
            description=Optional request body,
            required=false,
            ref=#/paths//apps/{app_name}/machines/{machine_id}/stop/post/requestBody,
            node={description: Optional request body, content: {application/json: {schema: {$ref: #/components/schemas/StopRequest}}}, required: false},
          },
        },
        responses={200: OpenApiComponentOrRef {
          ref=#/paths//apps/{app_name}/machines/{machine_id}/stop/post/responses/200,
          component=OpenApiResponse {
            description=OK,
            content={},
            ref=#/paths//apps/{app_name}/machines/{machine_id}/stop/post/responses/200,
            node={description: OK, content: {}},
          },
        }, 400: OpenApiComponentOrRef {
          ref=#/paths//apps/{app_name}/machines/{machine_id}/stop/post/responses/400,
          component=OpenApiResponse {
            description=Bad Request,
            content={application/json: OpenApiMediaType {
              schema=OpenApiComponentOrRef {
                ref=#/paths//apps/{app_name}/machines/{machine_id}/stop/post/responses/400/content/application/json/schema,
                reference=OpenApiSchemaReference {
                  ref=#/components/schemas/ErrorResponse,
                  name=ErrorResponse,
                  node={$ref: #/components/schemas/ErrorResponse},
                },
                node={$ref: #/components/schemas/ErrorResponse},
              },
              encoding={},
              ref=#/paths//apps/{app_name}/machines/{machine_id}/stop/post/responses/400/content/application/json,
              node={schema: {$ref: #/components/schemas/ErrorResponse}},
            }},
            ref=#/paths//apps/{app_name}/machines/{machine_id}/stop/post/responses/400,
            node={description: Bad Request, content: {application/json: {schema: {$ref: #/components/schemas/ErrorResponse}}}},
          },
        }},
        extensions={x-codegen-request-body-name: request},
      }},
      parameters=[],
      ref=#/paths//apps/{app_name}/machines/{machine_id}/stop,
      node={post: {tags: [Machines], summary: Stop Machine, description: Stop a specific Machine within an app, with an optional request body to specify signal and timeout.
, operationId: Machines_stop, parameters: [{name: app_name, in: path, description: Fly App Name, required: true, schema: {type: string}}, {name: machine_id, in: path, description: Machine ID, required: true, schema: {type: string}}], requestBody: {description: Optional request body, content: {application/json: {schema: {$ref: #/components/schemas/StopRequest}}}, required: false}, responses: {200: {description: OK, content: {}}, 400: {description: Bad Request, content: {application/json: {schema: {$ref: #/components/schemas/ErrorResponse}}}}}, x-codegen-request-body-name: request}},
    },
  }, /apps/{app_name}/machines/{machine_id}/suspend: OpenApiComponentOrRef {
    ref=#/paths//apps/{app_name}/machines/{machine_id}/suspend,
    component=OpenApiPathItem {
      operations={post: OpenApiOperation {
        type=post,
        tags=[Machines],
        summary=Suspend Machine,
        description=Suspend a specific Machine within an app. The next start operation will attempt (but is not guaranteed) to resume the Machine from a snapshot taken at suspension time, rather than performing a cold boot.
,
        operationId=Machines_suspend,
        parameters=[OpenApiComponentOrRef {
          ref=#/paths//apps/{app_name}/machines/{machine_id}/suspend/post/parameters/0,
          component=OpenApiParameter {
            name=app_name,
            location=path,
            description=Fly App Name,
            required=true,
            schema=OpenApiComponentOrRef {
              ref=#/paths//apps/{app_name}/machines/{machine_id}/suspend/post/parameters/0/schema,
              component=OpenApiSchema {
                type=string,
                ref=#/paths//apps/{app_name}/machines/{machine_id}/suspend/post/parameters/0/schema,
                node={type: string},
              },
            },
            ref=#/paths//apps/{app_name}/machines/{machine_id}/suspend/post/parameters/0,
            node={name: app_name, in: path, description: Fly App Name, required: true, schema: {type: string}},
          },
        }, OpenApiComponentOrRef {
          ref=#/paths//apps/{app_name}/machines/{machine_id}/suspend/post/parameters/1,
          component=OpenApiParameter {
            name=machine_id,
            location=path,
            description=Machine ID,
            required=true,
            schema=OpenApiComponentOrRef {
              ref=#/paths//apps/{app_name}/machines/{machine_id}/suspend/post/parameters/1/schema,
              component=OpenApiSchema {
                type=string,
                ref=#/paths//apps/{app_name}/machines/{machine_id}/suspend/post/parameters/1/schema,
                node={type: string},
              },
            },
            ref=#/paths//apps/{app_name}/machines/{machine_id}/suspend/post/parameters/1,
            node={name: machine_id, in: path, description: Machine ID, required: true, schema: {type: string}},
          },
        }],
        responses={200: OpenApiComponentOrRef {
          ref=#/paths//apps/{app_name}/machines/{machine_id}/suspend/post/responses/200,
          component=OpenApiResponse {
            description=OK,
            content={},
            ref=#/paths//apps/{app_name}/machines/{machine_id}/suspend/post/responses/200,
            node={description: OK, content: {}},
          },
        }},
      }},
      parameters=[],
      ref=#/paths//apps/{app_name}/machines/{machine_id}/suspend,
      node={post: {tags: [Machines], summary: Suspend Machine, description: Suspend a specific Machine within an app. The next start operation will attempt (but is not guaranteed) to resume the Machine from a snapshot taken at suspension time, rather than performing a cold boot.
, operationId: Machines_suspend, parameters: [{name: app_name, in: path, description: Fly App Name, required: true, schema: {type: string}}, {name: machine_id, in: path, description: Machine ID, required: true, schema: {type: string}}], responses: {200: {description: OK, content: {}}}}},
    },
  }, /apps/{app_name}/machines/{machine_id}/uncordon: OpenApiComponentOrRef {
    ref=#/paths//apps/{app_name}/machines/{machine_id}/uncordon,
    component=OpenApiPathItem {
      operations={post: OpenApiOperation {
        type=post,
        tags=[Machines],
        summary=Uncordon Machine,
        description=“Cordoning” a Machine refers to disabling its services, so the Fly Proxy won’t route requests to it. In flyctl this is used by blue/green deployments; one set of Machines is started up with services disabled, and when they are all healthy, the services are enabled on the new Machines and disabled on the old ones.
,
        operationId=Machines_uncordon,
        parameters=[OpenApiComponentOrRef {
          ref=#/paths//apps/{app_name}/machines/{machine_id}/uncordon/post/parameters/0,
          component=OpenApiParameter {
            name=app_name,
            location=path,
            description=Fly App Name,
            required=true,
            schema=OpenApiComponentOrRef {
              ref=#/paths//apps/{app_name}/machines/{machine_id}/uncordon/post/parameters/0/schema,
              component=OpenApiSchema {
                type=string,
                ref=#/paths//apps/{app_name}/machines/{machine_id}/uncordon/post/parameters/0/schema,
                node={type: string},
              },
            },
            ref=#/paths//apps/{app_name}/machines/{machine_id}/uncordon/post/parameters/0,
            node={name: app_name, in: path, description: Fly App Name, required: true, schema: {type: string}},
          },
        }, OpenApiComponentOrRef {
          ref=#/paths//apps/{app_name}/machines/{machine_id}/uncordon/post/parameters/1,
          component=OpenApiParameter {
            name=machine_id,
            location=path,
            description=Machine ID,
            required=true,
            schema=OpenApiComponentOrRef {
              ref=#/paths//apps/{app_name}/machines/{machine_id}/uncordon/post/parameters/1/schema,
              component=OpenApiSchema {
                type=string,
                ref=#/paths//apps/{app_name}/machines/{machine_id}/uncordon/post/parameters/1/schema,
                node={type: string},
              },
            },
            ref=#/paths//apps/{app_name}/machines/{machine_id}/uncordon/post/parameters/1,
            node={name: machine_id, in: path, description: Machine ID, required: true, schema: {type: string}},
          },
        }],
        responses={200: OpenApiComponentOrRef {
          ref=#/paths//apps/{app_name}/machines/{machine_id}/uncordon/post/responses/200,
          component=OpenApiResponse {
            description=OK,
            content={},
            ref=#/paths//apps/{app_name}/machines/{machine_id}/uncordon/post/responses/200,
            node={description: OK, content: {}},
          },
        }},
      }},
      parameters=[],
      ref=#/paths//apps/{app_name}/machines/{machine_id}/uncordon,
      node={post: {tags: [Machines], summary: Uncordon Machine, description: “Cordoning” a Machine refers to disabling its services, so the Fly Proxy won’t route requests to it. In flyctl this is used by blue/green deployments; one set of Machines is started up with services disabled, and when they are all healthy, the services are enabled on the new Machines and disabled on the old ones.
, operationId: Machines_uncordon, parameters: [{name: app_name, in: path, description: Fly App Name, required: true, schema: {type: string}}, {name: machine_id, in: path, description: Machine ID, required: true, schema: {type: string}}], responses: {200: {description: OK, content: {}}}}},
    },
  }, /apps/{app_name}/machines/{machine_id}/versions: OpenApiComponentOrRef {
    ref=#/paths//apps/{app_name}/machines/{machine_id}/versions,
    component=OpenApiPathItem {
      operations={get: OpenApiOperation {
        type=get,
        tags=[Machines],
        summary=List Versions,
        description=List all versions of the configuration for a specific Machine within an app.
,
        operationId=Machines_list_versions,
        parameters=[OpenApiComponentOrRef {
          ref=#/paths//apps/{app_name}/machines/{machine_id}/versions/get/parameters/0,
          component=OpenApiParameter {
            name=app_name,
            location=path,
            description=Fly App Name,
            required=true,
            schema=OpenApiComponentOrRef {
              ref=#/paths//apps/{app_name}/machines/{machine_id}/versions/get/parameters/0/schema,
              component=OpenApiSchema {
                type=string,
                ref=#/paths//apps/{app_name}/machines/{machine_id}/versions/get/parameters/0/schema,
                node={type: string},
              },
            },
            ref=#/paths//apps/{app_name}/machines/{machine_id}/versions/get/parameters/0,
            node={name: app_name, in: path, description: Fly App Name, required: true, schema: {type: string}},
          },
        }, OpenApiComponentOrRef {
          ref=#/paths//apps/{app_name}/machines/{machine_id}/versions/get/parameters/1,
          component=OpenApiParameter {
            name=machine_id,
            location=path,
            description=Machine ID,
            required=true,
            schema=OpenApiComponentOrRef {
              ref=#/paths//apps/{app_name}/machines/{machine_id}/versions/get/parameters/1/schema,
              component=OpenApiSchema {
                type=string,
                ref=#/paths//apps/{app_name}/machines/{machine_id}/versions/get/parameters/1/schema,
                node={type: string},
              },
            },
            ref=#/paths//apps/{app_name}/machines/{machine_id}/versions/get/parameters/1,
            node={name: machine_id, in: path, description: Machine ID, required: true, schema: {type: string}},
          },
        }],
        responses={200: OpenApiComponentOrRef {
          ref=#/paths//apps/{app_name}/machines/{machine_id}/versions/get/responses/200,
          component=OpenApiResponse {
            description=OK,
            content={application/json: OpenApiMediaType {
              schema=OpenApiComponentOrRef {
                ref=#/paths//apps/{app_name}/machines/{machine_id}/versions/get/responses/200/content/application/json/schema,
                component=OpenApiSchema {
                  type=array,
                  items=OpenApiComponentOrRef {
                    ref=#/paths//apps/{app_name}/machines/{machine_id}/versions/get/responses/200/content/application/json/schema/items,
                    reference=OpenApiSchemaReference {
                      ref=#/components/schemas/MachineVersion,
                      name=MachineVersion,
                      node={$ref: #/components/schemas/MachineVersion},
                    },
                    node={$ref: #/components/schemas/MachineVersion},
                  },
                  ref=#/paths//apps/{app_name}/machines/{machine_id}/versions/get/responses/200/content/application/json/schema,
                  node={type: array, items: {$ref: #/components/schemas/MachineVersion}},
                },
              },
              encoding={},
              ref=#/paths//apps/{app_name}/machines/{machine_id}/versions/get/responses/200/content/application/json,
              node={schema: {type: array, items: {$ref: #/components/schemas/MachineVersion}}},
            }},
            ref=#/paths//apps/{app_name}/machines/{machine_id}/versions/get/responses/200,
            node={description: OK, content: {application/json: {schema: {type: array, items: {$ref: #/components/schemas/MachineVersion}}}}},
          },
        }},
      }},
      parameters=[],
      ref=#/paths//apps/{app_name}/machines/{machine_id}/versions,
      node={get: {tags: [Machines], summary: List Versions, description: List all versions of the configuration for a specific Machine within an app.
, operationId: Machines_list_versions, parameters: [{name: app_name, in: path, description: Fly App Name, required: true, schema: {type: string}}, {name: machine_id, in: path, description: Machine ID, required: true, schema: {type: string}}], responses: {200: {description: OK, content: {application/json: {schema: {type: array, items: {$ref: #/components/schemas/MachineVersion}}}}}}}},
    },
  }, /apps/{app_name}/machines/{machine_id}/wait: OpenApiComponentOrRef {
    ref=#/paths//apps/{app_name}/machines/{machine_id}/wait,
    component=OpenApiPathItem {
      operations={get: OpenApiOperation {
        type=get,
        tags=[Machines],
        summary=Wait for State,
        description=Wait for a Machine to reach a specific state. Specify the desired state with the state parameter. See the [Machine states table](https://fly.io/docs/machines/working-with-machines/#machine-states) for a list of possible states. The default for this parameter is `started`.

This request will block for up to 60 seconds. Set a shorter timeout with the timeout parameter.
,
        operationId=Machines_wait,
        parameters=[OpenApiComponentOrRef {
          ref=#/paths//apps/{app_name}/machines/{machine_id}/wait/get/parameters/0,
          component=OpenApiParameter {
            name=app_name,
            location=path,
            description=Fly App Name,
            required=true,
            schema=OpenApiComponentOrRef {
              ref=#/paths//apps/{app_name}/machines/{machine_id}/wait/get/parameters/0/schema,
              component=OpenApiSchema {
                type=string,
                ref=#/paths//apps/{app_name}/machines/{machine_id}/wait/get/parameters/0/schema,
                node={type: string},
              },
            },
            ref=#/paths//apps/{app_name}/machines/{machine_id}/wait/get/parameters/0,
            node={name: app_name, in: path, description: Fly App Name, required: true, schema: {type: string}},
          },
        }, OpenApiComponentOrRef {
          ref=#/paths//apps/{app_name}/machines/{machine_id}/wait/get/parameters/1,
          component=OpenApiParameter {
            name=machine_id,
            location=path,
            description=Machine ID,
            required=true,
            schema=OpenApiComponentOrRef {
              ref=#/paths//apps/{app_name}/machines/{machine_id}/wait/get/parameters/1/schema,
              component=OpenApiSchema {
                type=string,
                ref=#/paths//apps/{app_name}/machines/{machine_id}/wait/get/parameters/1/schema,
                node={type: string},
              },
            },
            ref=#/paths//apps/{app_name}/machines/{machine_id}/wait/get/parameters/1,
            node={name: machine_id, in: path, description: Machine ID, required: true, schema: {type: string}},
          },
        }, OpenApiComponentOrRef {
          ref=#/paths//apps/{app_name}/machines/{machine_id}/wait/get/parameters/2,
          component=OpenApiParameter {
            name=instance_id,
            location=query,
            description=26-character Machine version ID,
            schema=OpenApiComponentOrRef {
              ref=#/paths//apps/{app_name}/machines/{machine_id}/wait/get/parameters/2/schema,
              component=OpenApiSchema {
                type=string,
                ref=#/paths//apps/{app_name}/machines/{machine_id}/wait/get/parameters/2/schema,
                node={type: string},
              },
            },
            ref=#/paths//apps/{app_name}/machines/{machine_id}/wait/get/parameters/2,
            node={name: instance_id, in: query, description: 26-character Machine version ID, schema: {type: string}},
          },
        }, OpenApiComponentOrRef {
          ref=#/paths//apps/{app_name}/machines/{machine_id}/wait/get/parameters/3,
          component=OpenApiParameter {
            name=timeout,
            location=query,
            description=wait timeout. default 60s,
            schema=OpenApiComponentOrRef {
              ref=#/paths//apps/{app_name}/machines/{machine_id}/wait/get/parameters/3/schema,
              component=OpenApiSchema {
                type=integer,
                ref=#/paths//apps/{app_name}/machines/{machine_id}/wait/get/parameters/3/schema,
                node={type: integer},
              },
            },
            ref=#/paths//apps/{app_name}/machines/{machine_id}/wait/get/parameters/3,
            node={name: timeout, in: query, description: wait timeout. default 60s, schema: {type: integer}},
          },
        }, OpenApiComponentOrRef {
          ref=#/paths//apps/{app_name}/machines/{machine_id}/wait/get/parameters/4,
          component=OpenApiParameter {
            name=state,
            location=query,
            description=desired state,
            schema=OpenApiComponentOrRef {
              ref=#/paths//apps/{app_name}/machines/{machine_id}/wait/get/parameters/4/schema,
              component=OpenApiSchema {
                type=string,
                enumValues={started, stopped, suspended, destroyed},
                ref=#/paths//apps/{app_name}/machines/{machine_id}/wait/get/parameters/4/schema,
                node={type: string, enum: [started, stopped, suspended, destroyed]},
              },
            },
            ref=#/paths//apps/{app_name}/machines/{machine_id}/wait/get/parameters/4,
            node={name: state, in: query, description: desired state, schema: {type: string, enum: [started, stopped, suspended, destroyed]}},
          },
        }],
        responses={200: OpenApiComponentOrRef {
          ref=#/paths//apps/{app_name}/machines/{machine_id}/wait/get/responses/200,
          component=OpenApiResponse {
            description=OK,
            content={},
            ref=#/paths//apps/{app_name}/machines/{machine_id}/wait/get/responses/200,
            node={description: OK, content: {}},
          },
        }, 400: OpenApiComponentOrRef {
          ref=#/paths//apps/{app_name}/machines/{machine_id}/wait/get/responses/400,
          component=OpenApiResponse {
            description=Bad Request,
            content={application/json: OpenApiMediaType {
              schema=OpenApiComponentOrRef {
                ref=#/paths//apps/{app_name}/machines/{machine_id}/wait/get/responses/400/content/application/json/schema,
                reference=OpenApiSchemaReference {
                  ref=#/components/schemas/ErrorResponse,
                  name=ErrorResponse,
                  node={$ref: #/components/schemas/ErrorResponse},
                },
                node={$ref: #/components/schemas/ErrorResponse},
              },
              encoding={},
              ref=#/paths//apps/{app_name}/machines/{machine_id}/wait/get/responses/400/content/application/json,
              node={schema: {$ref: #/components/schemas/ErrorResponse}},
            }},
            ref=#/paths//apps/{app_name}/machines/{machine_id}/wait/get/responses/400,
            node={description: Bad Request, content: {application/json: {schema: {$ref: #/components/schemas/ErrorResponse}}}},
          },
        }},
      }},
      parameters=[],
      ref=#/paths//apps/{app_name}/machines/{machine_id}/wait,
      node={get: {tags: [Machines], summary: Wait for State, description: Wait for a Machine to reach a specific state. Specify the desired state with the state parameter. See the [Machine states table](https://fly.io/docs/machines/working-with-machines/#machine-states) for a list of possible states. The default for this parameter is `started`.

This request will block for up to 60 seconds. Set a shorter timeout with the timeout parameter.
, operationId: Machines_wait, parameters: [{name: app_name, in: path, description: Fly App Name, required: true, schema: {type: string}}, {name: machine_id, in: path, description: Machine ID, required: true, schema: {type: string}}, {name: instance_id, in: query, description: 26-character Machine version ID, schema: {type: string}}, {name: timeout, in: query, description: wait timeout. default 60s, schema: {type: integer}}, {name: state, in: query, description: desired state, schema: {type: string, enum: [started, stopped, suspended, destroyed]}}], responses: {200: {description: OK, content: {}}, 400: {description: Bad Request, content: {application/json: {schema: {$ref: #/components/schemas/ErrorResponse}}}}}}},
    },
  }, /apps/{app_name}/secrets: OpenApiComponentOrRef {
    ref=#/paths//apps/{app_name}/secrets,
    component=OpenApiPathItem {
      operations={get: OpenApiOperation {
        type=get,
        tags=[Secrets],
        summary=List App secrets,
        operationId=Secrets_list,
        parameters=[OpenApiComponentOrRef {
          ref=#/paths//apps/{app_name}/secrets/get/parameters/0,
          component=OpenApiParameter {
            name=app_name,
            location=path,
            description=Fly App Name,
            required=true,
            schema=OpenApiComponentOrRef {
              ref=#/paths//apps/{app_name}/secrets/get/parameters/0/schema,
              component=OpenApiSchema {
                type=string,
                ref=#/paths//apps/{app_name}/secrets/get/parameters/0/schema,
                node={type: string},
              },
            },
            ref=#/paths//apps/{app_name}/secrets/get/parameters/0,
            node={name: app_name, in: path, description: Fly App Name, required: true, schema: {type: string}},
          },
        }],
        responses={200: OpenApiComponentOrRef {
          ref=#/paths//apps/{app_name}/secrets/get/responses/200,
          component=OpenApiResponse {
            description=OK,
            content={application/json: OpenApiMediaType {
              schema=OpenApiComponentOrRef {
                ref=#/paths//apps/{app_name}/secrets/get/responses/200/content/application/json/schema,
                component=OpenApiSchema {
                  type=array,
                  items=OpenApiComponentOrRef {
                    ref=#/paths//apps/{app_name}/secrets/get/responses/200/content/application/json/schema/items,
                    reference=OpenApiSchemaReference {
                      ref=#/components/schemas/ListSecret,
                      name=ListSecret,
                      node={$ref: #/components/schemas/ListSecret},
                    },
                    node={$ref: #/components/schemas/ListSecret},
                  },
                  ref=#/paths//apps/{app_name}/secrets/get/responses/200/content/application/json/schema,
                  node={type: array, items: {$ref: #/components/schemas/ListSecret}},
                },
              },
              encoding={},
              ref=#/paths//apps/{app_name}/secrets/get/responses/200/content/application/json,
              node={schema: {type: array, items: {$ref: #/components/schemas/ListSecret}}},
            }},
            ref=#/paths//apps/{app_name}/secrets/get/responses/200,
            node={description: OK, content: {application/json: {schema: {type: array, items: {$ref: #/components/schemas/ListSecret}}}}},
          },
        }},
      }},
      parameters=[],
      ref=#/paths//apps/{app_name}/secrets,
      node={get: {tags: [Secrets], summary: List App secrets, operationId: Secrets_list, parameters: [{name: app_name, in: path, description: Fly App Name, required: true, schema: {type: string}}], responses: {200: {description: OK, content: {application/json: {schema: {type: array, items: {$ref: #/components/schemas/ListSecret}}}}}}}},
    },
  }, /apps/{app_name}/secrets/{secret_label}: OpenApiComponentOrRef {
    ref=#/paths//apps/{app_name}/secrets/{secret_label},
    component=OpenApiPathItem {
      operations={delete: OpenApiOperation {
        type=delete,
        tags=[Secrets],
        summary=Destroy Secret,
        operationId=Secret_delete,
        parameters=[OpenApiComponentOrRef {
          ref=#/paths//apps/{app_name}/secrets/{secret_label}/delete/parameters/0,
          component=OpenApiParameter {
            name=app_name,
            location=path,
            description=Fly App Name,
            required=true,
            schema=OpenApiComponentOrRef {
              ref=#/paths//apps/{app_name}/secrets/{secret_label}/delete/parameters/0/schema,
              component=OpenApiSchema {
                type=string,
                ref=#/paths//apps/{app_name}/secrets/{secret_label}/delete/parameters/0/schema,
                node={type: string},
              },
            },
            ref=#/paths//apps/{app_name}/secrets/{secret_label}/delete/parameters/0,
            node={name: app_name, in: path, description: Fly App Name, required: true, schema: {type: string}},
          },
        }, OpenApiComponentOrRef {
          ref=#/paths//apps/{app_name}/secrets/{secret_label}/delete/parameters/1,
          component=OpenApiParameter {
            name=secret_label,
            location=path,
            description=App Secret Label,
            required=true,
            schema=OpenApiComponentOrRef {
              ref=#/paths//apps/{app_name}/secrets/{secret_label}/delete/parameters/1/schema,
              component=OpenApiSchema {
                type=string,
                ref=#/paths//apps/{app_name}/secrets/{secret_label}/delete/parameters/1/schema,
                node={type: string},
              },
            },
            ref=#/paths//apps/{app_name}/secrets/{secret_label}/delete/parameters/1,
            node={name: secret_label, in: path, description: App Secret Label, required: true, schema: {type: string}},
          },
        }],
        responses={200: OpenApiComponentOrRef {
          ref=#/paths//apps/{app_name}/secrets/{secret_label}/delete/responses/200,
          component=OpenApiResponse {
            description=OK,
            content={},
            ref=#/paths//apps/{app_name}/secrets/{secret_label}/delete/responses/200,
            node={description: OK, content: {}},
          },
        }},
      }},
      parameters=[],
      ref=#/paths//apps/{app_name}/secrets/{secret_label},
      node={delete: {tags: [Secrets], summary: Destroy Secret, operationId: Secret_delete, parameters: [{name: app_name, in: path, description: Fly App Name, required: true, schema: {type: string}}, {name: secret_label, in: path, description: App Secret Label, required: true, schema: {type: string}}], responses: {200: {description: OK, content: {}}}}},
    },
  }, /apps/{app_name}/secrets/{secret_label}/type/{secret_type}: OpenApiComponentOrRef {
    ref=#/paths//apps/{app_name}/secrets/{secret_label}/type/{secret_type},
    component=OpenApiPathItem {
      operations={post: OpenApiOperation {
        type=post,
        tags=[Secrets],
        summary=Create Secret,
        operationId=Secret_create,
        parameters=[OpenApiComponentOrRef {
          ref=#/paths//apps/{app_name}/secrets/{secret_label}/type/{secret_type}/post/parameters/0,
          component=OpenApiParameter {
            name=app_name,
            location=path,
            description=Fly App Name,
            required=true,
            schema=OpenApiComponentOrRef {
              ref=#/paths//apps/{app_name}/secrets/{secret_label}/type/{secret_type}/post/parameters/0/schema,
              component=OpenApiSchema {
                type=string,
                ref=#/paths//apps/{app_name}/secrets/{secret_label}/type/{secret_type}/post/parameters/0/schema,
                node={type: string},
              },
            },
            ref=#/paths//apps/{app_name}/secrets/{secret_label}/type/{secret_type}/post/parameters/0,
            node={name: app_name, in: path, description: Fly App Name, required: true, schema: {type: string}},
          },
        }, OpenApiComponentOrRef {
          ref=#/paths//apps/{app_name}/secrets/{secret_label}/type/{secret_type}/post/parameters/1,
          component=OpenApiParameter {
            name=secret_label,
            location=path,
            description=App Secret Label,
            required=true,
            schema=OpenApiComponentOrRef {
              ref=#/paths//apps/{app_name}/secrets/{secret_label}/type/{secret_type}/post/parameters/1/schema,
              component=OpenApiSchema {
                type=string,
                ref=#/paths//apps/{app_name}/secrets/{secret_label}/type/{secret_type}/post/parameters/1/schema,
                node={type: string},
              },
            },
            ref=#/paths//apps/{app_name}/secrets/{secret_label}/type/{secret_type}/post/parameters/1,
            node={name: secret_label, in: path, description: App Secret Label, required: true, schema: {type: string}},
          },
        }, OpenApiComponentOrRef {
          ref=#/paths//apps/{app_name}/secrets/{secret_label}/type/{secret_type}/post/parameters/2,
          component=OpenApiParameter {
            name=secret_type,
            location=path,
            description=App Secret Type,
            required=true,
            schema=OpenApiComponentOrRef {
              ref=#/paths//apps/{app_name}/secrets/{secret_label}/type/{secret_type}/post/parameters/2/schema,
              component=OpenApiSchema {
                type=string,
                ref=#/paths//apps/{app_name}/secrets/{secret_label}/type/{secret_type}/post/parameters/2/schema,
                node={type: string},
              },
            },
            ref=#/paths//apps/{app_name}/secrets/{secret_label}/type/{secret_type}/post/parameters/2,
            node={name: secret_type, in: path, description: App Secret Type, required: true, schema: {type: string}},
          },
        }],
        requestBody=OpenApiComponentOrRef {
          ref=#/paths//apps/{app_name}/secrets/{secret_label}/type/{secret_type}/post/requestBody,
          component=OpenApiRequestBody {
            content={application/json: OpenApiMediaType {
              schema=OpenApiComponentOrRef {
                ref=#/paths//apps/{app_name}/secrets/{secret_label}/type/{secret_type}/post/requestBody/content/application/json/schema,
                reference=OpenApiSchemaReference {
                  ref=#/components/schemas/CreateSecretRequest,
                  name=CreateSecretRequest,
                  node={$ref: #/components/schemas/CreateSecretRequest},
                },
                node={$ref: #/components/schemas/CreateSecretRequest},
              },
              encoding={},
              ref=#/paths//apps/{app_name}/secrets/{secret_label}/type/{secret_type}/post/requestBody/content/application/json,
              node={schema: {$ref: #/components/schemas/CreateSecretRequest}},
            }},
            description=secret body,
            required=true,
            ref=#/paths//apps/{app_name}/secrets/{secret_label}/type/{secret_type}/post/requestBody,
            node={description: secret body, content: {application/json: {schema: {$ref: #/components/schemas/CreateSecretRequest}}}, required: true},
          },
        },
        responses={201: OpenApiComponentOrRef {
          ref=#/paths//apps/{app_name}/secrets/{secret_label}/type/{secret_type}/post/responses/201,
          component=OpenApiResponse {
            description=Created,
            content={},
            ref=#/paths//apps/{app_name}/secrets/{secret_label}/type/{secret_type}/post/responses/201,
            node={description: Created, content: {}},
          },
        }, 400: OpenApiComponentOrRef {
          ref=#/paths//apps/{app_name}/secrets/{secret_label}/type/{secret_type}/post/responses/400,
          component=OpenApiResponse {
            description=Bad Request,
            content={application/json: OpenApiMediaType {
              schema=OpenApiComponentOrRef {
                ref=#/paths//apps/{app_name}/secrets/{secret_label}/type/{secret_type}/post/responses/400/content/application/json/schema,
                reference=OpenApiSchemaReference {
                  ref=#/components/schemas/ErrorResponse,
                  name=ErrorResponse,
                  node={$ref: #/components/schemas/ErrorResponse},
                },
                node={$ref: #/components/schemas/ErrorResponse},
              },
              encoding={},
              ref=#/paths//apps/{app_name}/secrets/{secret_label}/type/{secret_type}/post/responses/400/content/application/json,
              node={schema: {$ref: #/components/schemas/ErrorResponse}},
            }},
            ref=#/paths//apps/{app_name}/secrets/{secret_label}/type/{secret_type}/post/responses/400,
            node={description: Bad Request, content: {application/json: {schema: {$ref: #/components/schemas/ErrorResponse}}}},
          },
        }},
        extensions={x-codegen-request-body-name: request},
      }},
      parameters=[],
      ref=#/paths//apps/{app_name}/secrets/{secret_label}/type/{secret_type},
      node={post: {tags: [Secrets], summary: Create Secret, operationId: Secret_create, parameters: [{name: app_name, in: path, description: Fly App Name, required: true, schema: {type: string}}, {name: secret_label, in: path, description: App Secret Label, required: true, schema: {type: string}}, {name: secret_type, in: path, description: App Secret Type, required: true, schema: {type: string}}], requestBody: {description: secret body, content: {application/json: {schema: {$ref: #/components/schemas/CreateSecretRequest}}}, required: true}, responses: {201: {description: Created, content: {}}, 400: {description: Bad Request, content: {application/json: {schema: {$ref: #/components/schemas/ErrorResponse}}}}}, x-codegen-request-body-name: request}},
    },
  }, /apps/{app_name}/secrets/{secret_label}/type/{secret_type}/generate: OpenApiComponentOrRef {
    ref=#/paths//apps/{app_name}/secrets/{secret_label}/type/{secret_type}/generate,
    component=OpenApiPathItem {
      operations={post: OpenApiOperation {
        type=post,
        tags=[Secrets],
        summary=Generate Secret,
        operationId=Secret_generate,
        parameters=[OpenApiComponentOrRef {
          ref=#/paths//apps/{app_name}/secrets/{secret_label}/type/{secret_type}/generate/post/parameters/0,
          component=OpenApiParameter {
            name=app_name,
            location=path,
            description=Fly App Name,
            required=true,
            schema=OpenApiComponentOrRef {
              ref=#/paths//apps/{app_name}/secrets/{secret_label}/type/{secret_type}/generate/post/parameters/0/schema,
              component=OpenApiSchema {
                type=string,
                ref=#/paths//apps/{app_name}/secrets/{secret_label}/type/{secret_type}/generate/post/parameters/0/schema,
                node={type: string},
              },
            },
            ref=#/paths//apps/{app_name}/secrets/{secret_label}/type/{secret_type}/generate/post/parameters/0,
            node={name: app_name, in: path, description: Fly App Name, required: true, schema: {type: string}},
          },
        }, OpenApiComponentOrRef {
          ref=#/paths//apps/{app_name}/secrets/{secret_label}/type/{secret_type}/generate/post/parameters/1,
          component=OpenApiParameter {
            name=secret_label,
            location=path,
            description=App Secret Label,
            required=true,
            schema=OpenApiComponentOrRef {
              ref=#/paths//apps/{app_name}/secrets/{secret_label}/type/{secret_type}/generate/post/parameters/1/schema,
              component=OpenApiSchema {
                type=string,
                ref=#/paths//apps/{app_name}/secrets/{secret_label}/type/{secret_type}/generate/post/parameters/1/schema,
                node={type: string},
              },
            },
            ref=#/paths//apps/{app_name}/secrets/{secret_label}/type/{secret_type}/generate/post/parameters/1,
            node={name: secret_label, in: path, description: App Secret Label, required: true, schema: {type: string}},
          },
        }, OpenApiComponentOrRef {
          ref=#/paths//apps/{app_name}/secrets/{secret_label}/type/{secret_type}/generate/post/parameters/2,
          component=OpenApiParameter {
            name=secret_type,
            location=path,
            description=App Secret Type,
            required=true,
            schema=OpenApiComponentOrRef {
              ref=#/paths//apps/{app_name}/secrets/{secret_label}/type/{secret_type}/generate/post/parameters/2/schema,
              component=OpenApiSchema {
                type=string,
                ref=#/paths//apps/{app_name}/secrets/{secret_label}/type/{secret_type}/generate/post/parameters/2/schema,
                node={type: string},
              },
            },
            ref=#/paths//apps/{app_name}/secrets/{secret_label}/type/{secret_type}/generate/post/parameters/2,
            node={name: secret_type, in: path, description: App Secret Type, required: true, schema: {type: string}},
          },
        }],
        responses={201: OpenApiComponentOrRef {
          ref=#/paths//apps/{app_name}/secrets/{secret_label}/type/{secret_type}/generate/post/responses/201,
          component=OpenApiResponse {
            description=Created,
            content={},
            ref=#/paths//apps/{app_name}/secrets/{secret_label}/type/{secret_type}/generate/post/responses/201,
            node={description: Created, content: {}},
          },
        }, 400: OpenApiComponentOrRef {
          ref=#/paths//apps/{app_name}/secrets/{secret_label}/type/{secret_type}/generate/post/responses/400,
          component=OpenApiResponse {
            description=Bad Request,
            content={application/json: OpenApiMediaType {
              schema=OpenApiComponentOrRef {
                ref=#/paths//apps/{app_name}/secrets/{secret_label}/type/{secret_type}/generate/post/responses/400/content/application/json/schema,
                reference=OpenApiSchemaReference {
                  ref=#/components/schemas/ErrorResponse,
                  name=ErrorResponse,
                  node={$ref: #/components/schemas/ErrorResponse},
                },
                node={$ref: #/components/schemas/ErrorResponse},
              },
              encoding={},
              ref=#/paths//apps/{app_name}/secrets/{secret_label}/type/{secret_type}/generate/post/responses/400/content/application/json,
              node={schema: {$ref: #/components/schemas/ErrorResponse}},
            }},
            ref=#/paths//apps/{app_name}/secrets/{secret_label}/type/{secret_type}/generate/post/responses/400,
            node={description: Bad Request, content: {application/json: {schema: {$ref: #/components/schemas/ErrorResponse}}}},
          },
        }},
      }},
      parameters=[],
      ref=#/paths//apps/{app_name}/secrets/{secret_label}/type/{secret_type}/generate,
      node={post: {tags: [Secrets], summary: Generate Secret, operationId: Secret_generate, parameters: [{name: app_name, in: path, description: Fly App Name, required: true, schema: {type: string}}, {name: secret_label, in: path, description: App Secret Label, required: true, schema: {type: string}}, {name: secret_type, in: path, description: App Secret Type, required: true, schema: {type: string}}], responses: {201: {description: Created, content: {}}, 400: {description: Bad Request, content: {application/json: {schema: {$ref: #/components/schemas/ErrorResponse}}}}}}},
    },
  }, /apps/{app_name}/volumes: OpenApiComponentOrRef {
    ref=#/paths//apps/{app_name}/volumes,
    component=OpenApiPathItem {
      operations={get: OpenApiOperation {
        type=get,
        tags=[Volumes],
        summary=List Volumes,
        description=List all volumes associated with a specific app.
,
        operationId=Volumes_list,
        parameters=[OpenApiComponentOrRef {
          ref=#/paths//apps/{app_name}/volumes/get/parameters/0,
          component=OpenApiParameter {
            name=app_name,
            location=path,
            description=Fly App Name,
            required=true,
            schema=OpenApiComponentOrRef {
              ref=#/paths//apps/{app_name}/volumes/get/parameters/0/schema,
              component=OpenApiSchema {
                type=string,
                ref=#/paths//apps/{app_name}/volumes/get/parameters/0/schema,
                node={type: string},
              },
            },
            ref=#/paths//apps/{app_name}/volumes/get/parameters/0,
            node={name: app_name, in: path, description: Fly App Name, required: true, schema: {type: string}},
          },
        }, OpenApiComponentOrRef {
          ref=#/paths//apps/{app_name}/volumes/get/parameters/1,
          component=OpenApiParameter {
            name=summary,
            location=query,
            description=Only return summary info about volumes (omit blocks, block size, etc),
            schema=OpenApiComponentOrRef {
              ref=#/paths//apps/{app_name}/volumes/get/parameters/1/schema,
              component=OpenApiSchema {
                type=boolean,
                ref=#/paths//apps/{app_name}/volumes/get/parameters/1/schema,
                node={type: boolean},
              },
            },
            ref=#/paths//apps/{app_name}/volumes/get/parameters/1,
            node={name: summary, in: query, description: Only return summary info about volumes (omit blocks, block size, etc), schema: {type: boolean}},
          },
        }],
        responses={200: OpenApiComponentOrRef {
          ref=#/paths//apps/{app_name}/volumes/get/responses/200,
          component=OpenApiResponse {
            description=OK,
            content={application/json: OpenApiMediaType {
              schema=OpenApiComponentOrRef {
                ref=#/paths//apps/{app_name}/volumes/get/responses/200/content/application/json/schema,
                component=OpenApiSchema {
                  type=array,
                  items=OpenApiComponentOrRef {
                    ref=#/paths//apps/{app_name}/volumes/get/responses/200/content/application/json/schema/items,
                    reference=OpenApiSchemaReference {
                      ref=#/components/schemas/Volume,
                      name=Volume,
                      node={$ref: #/components/schemas/Volume},
                    },
                    node={$ref: #/components/schemas/Volume},
                  },
                  ref=#/paths//apps/{app_name}/volumes/get/responses/200/content/application/json/schema,
                  node={type: array, items: {$ref: #/components/schemas/Volume}},
                },
              },
              encoding={},
              ref=#/paths//apps/{app_name}/volumes/get/responses/200/content/application/json,
              node={schema: {type: array, items: {$ref: #/components/schemas/Volume}}},
            }},
            ref=#/paths//apps/{app_name}/volumes/get/responses/200,
            node={description: OK, content: {application/json: {schema: {type: array, items: {$ref: #/components/schemas/Volume}}}}},
          },
        }},
      }, post: OpenApiOperation {
        type=post,
        tags=[Volumes],
        summary=Create Volume,
        description=Create a volume for a specific app using the details provided in the request body.
,
        operationId=Volumes_create,
        parameters=[OpenApiComponentOrRef {
          ref=#/paths//apps/{app_name}/volumes/post/parameters/0,
          component=OpenApiParameter {
            name=app_name,
            location=path,
            description=Fly App Name,
            required=true,
            schema=OpenApiComponentOrRef {
              ref=#/paths//apps/{app_name}/volumes/post/parameters/0/schema,
              component=OpenApiSchema {
                type=string,
                ref=#/paths//apps/{app_name}/volumes/post/parameters/0/schema,
                node={type: string},
              },
            },
            ref=#/paths//apps/{app_name}/volumes/post/parameters/0,
            node={name: app_name, in: path, description: Fly App Name, required: true, schema: {type: string}},
          },
        }],
        requestBody=OpenApiComponentOrRef {
          ref=#/paths//apps/{app_name}/volumes/post/requestBody,
          component=OpenApiRequestBody {
            content={application/json: OpenApiMediaType {
              schema=OpenApiComponentOrRef {
                ref=#/paths//apps/{app_name}/volumes/post/requestBody/content/application/json/schema,
                reference=OpenApiSchemaReference {
                  ref=#/components/schemas/CreateVolumeRequest,
                  name=CreateVolumeRequest,
                  node={$ref: #/components/schemas/CreateVolumeRequest},
                },
                node={$ref: #/components/schemas/CreateVolumeRequest},
              },
              encoding={},
              ref=#/paths//apps/{app_name}/volumes/post/requestBody/content/application/json,
              node={schema: {$ref: #/components/schemas/CreateVolumeRequest}},
            }},
            description=Request body,
            required=true,
            ref=#/paths//apps/{app_name}/volumes/post/requestBody,
            node={description: Request body, content: {application/json: {schema: {$ref: #/components/schemas/CreateVolumeRequest}}}, required: true},
          },
        },
        responses={200: OpenApiComponentOrRef {
          ref=#/paths//apps/{app_name}/volumes/post/responses/200,
          component=OpenApiResponse {
            description=OK,
            content={application/json: OpenApiMediaType {
              schema=OpenApiComponentOrRef {
                ref=#/paths//apps/{app_name}/volumes/post/responses/200/content/application/json/schema,
                reference=OpenApiSchemaReference {
                  ref=#/components/schemas/Volume,
                  name=Volume,
                  node={$ref: #/components/schemas/Volume},
                },
                node={$ref: #/components/schemas/Volume},
              },
              encoding={},
              ref=#/paths//apps/{app_name}/volumes/post/responses/200/content/application/json,
              node={schema: {$ref: #/components/schemas/Volume}},
            }},
            ref=#/paths//apps/{app_name}/volumes/post/responses/200,
            node={description: OK, content: {application/json: {schema: {$ref: #/components/schemas/Volume}}}},
          },
        }},
        extensions={x-codegen-request-body-name: request},
      }},
      parameters=[],
      ref=#/paths//apps/{app_name}/volumes,
      node={get: {tags: [Volumes], summary: List Volumes, description: List all volumes associated with a specific app.
, operationId: Volumes_list, parameters: [{name: app_name, in: path, description: Fly App Name, required: true, schema: {type: string}}, {name: summary, in: query, description: Only return summary info about volumes (omit blocks, block size, etc), schema: {type: boolean}}], responses: {200: {description: OK, content: {application/json: {schema: {type: array, items: {$ref: #/components/schemas/Volume}}}}}}}, post: {tags: [Volumes], summary: Create Volume, description: Create a volume for a specific app using the details provided in the request body.
, operationId: Volumes_create, parameters: [{name: app_name, in: path, description: Fly App Name, required: true, schema: {type: string}}], requestBody: {description: Request body, content: {application/json: {schema: {$ref: #/components/schemas/CreateVolumeRequest}}}, required: true}, responses: {200: {description: OK, content: {application/json: {schema: {$ref: #/components/schemas/Volume}}}}}, x-codegen-request-body-name: request}},
    },
  }, /apps/{app_name}/volumes/{volume_id}: OpenApiComponentOrRef {
    ref=#/paths//apps/{app_name}/volumes/{volume_id},
    component=OpenApiPathItem {
      operations={get: OpenApiOperation {
        type=get,
        tags=[Volumes],
        summary=Get Volume,
        description=Retrieve details about a specific volume by its ID within an app.
,
        operationId=Volumes_get_by_id,
        parameters=[OpenApiComponentOrRef {
          ref=#/paths//apps/{app_name}/volumes/{volume_id}/get/parameters/0,
          component=OpenApiParameter {
            name=app_name,
            location=path,
            description=Fly App Name,
            required=true,
            schema=OpenApiComponentOrRef {
              ref=#/paths//apps/{app_name}/volumes/{volume_id}/get/parameters/0/schema,
              component=OpenApiSchema {
                type=string,
                ref=#/paths//apps/{app_name}/volumes/{volume_id}/get/parameters/0/schema,
                node={type: string},
              },
            },
            ref=#/paths//apps/{app_name}/volumes/{volume_id}/get/parameters/0,
            node={name: app_name, in: path, description: Fly App Name, required: true, schema: {type: string}},
          },
        }, OpenApiComponentOrRef {
          ref=#/paths//apps/{app_name}/volumes/{volume_id}/get/parameters/1,
          component=OpenApiParameter {
            name=volume_id,
            location=path,
            description=Volume ID,
            required=true,
            schema=OpenApiComponentOrRef {
              ref=#/paths//apps/{app_name}/volumes/{volume_id}/get/parameters/1/schema,
              component=OpenApiSchema {
                type=string,
                ref=#/paths//apps/{app_name}/volumes/{volume_id}/get/parameters/1/schema,
                node={type: string},
              },
            },
            ref=#/paths//apps/{app_name}/volumes/{volume_id}/get/parameters/1,
            node={name: volume_id, in: path, description: Volume ID, required: true, schema: {type: string}},
          },
        }],
        responses={200: OpenApiComponentOrRef {
          ref=#/paths//apps/{app_name}/volumes/{volume_id}/get/responses/200,
          component=OpenApiResponse {
            description=OK,
            content={application/json: OpenApiMediaType {
              schema=OpenApiComponentOrRef {
                ref=#/paths//apps/{app_name}/volumes/{volume_id}/get/responses/200/content/application/json/schema,
                reference=OpenApiSchemaReference {
                  ref=#/components/schemas/Volume,
                  name=Volume,
                  node={$ref: #/components/schemas/Volume},
                },
                node={$ref: #/components/schemas/Volume},
              },
              encoding={},
              ref=#/paths//apps/{app_name}/volumes/{volume_id}/get/responses/200/content/application/json,
              node={schema: {$ref: #/components/schemas/Volume}},
            }},
            ref=#/paths//apps/{app_name}/volumes/{volume_id}/get/responses/200,
            node={description: OK, content: {application/json: {schema: {$ref: #/components/schemas/Volume}}}},
          },
        }},
      }, put: OpenApiOperation {
        type=put,
        tags=[Volumes],
        summary=Update Volume,
        description=Update a volume's configuration using the details provided in the request body.
,
        operationId=Volumes_update,
        parameters=[OpenApiComponentOrRef {
          ref=#/paths//apps/{app_name}/volumes/{volume_id}/put/parameters/0,
          component=OpenApiParameter {
            name=app_name,
            location=path,
            description=Fly App Name,
            required=true,
            schema=OpenApiComponentOrRef {
              ref=#/paths//apps/{app_name}/volumes/{volume_id}/put/parameters/0/schema,
              component=OpenApiSchema {
                type=string,
                ref=#/paths//apps/{app_name}/volumes/{volume_id}/put/parameters/0/schema,
                node={type: string},
              },
            },
            ref=#/paths//apps/{app_name}/volumes/{volume_id}/put/parameters/0,
            node={name: app_name, in: path, description: Fly App Name, required: true, schema: {type: string}},
          },
        }, OpenApiComponentOrRef {
          ref=#/paths//apps/{app_name}/volumes/{volume_id}/put/parameters/1,
          component=OpenApiParameter {
            name=volume_id,
            location=path,
            description=Volume ID,
            required=true,
            schema=OpenApiComponentOrRef {
              ref=#/paths//apps/{app_name}/volumes/{volume_id}/put/parameters/1/schema,
              component=OpenApiSchema {
                type=string,
                ref=#/paths//apps/{app_name}/volumes/{volume_id}/put/parameters/1/schema,
                node={type: string},
              },
            },
            ref=#/paths//apps/{app_name}/volumes/{volume_id}/put/parameters/1,
            node={name: volume_id, in: path, description: Volume ID, required: true, schema: {type: string}},
          },
        }],
        requestBody=OpenApiComponentOrRef {
          ref=#/paths//apps/{app_name}/volumes/{volume_id}/put/requestBody,
          component=OpenApiRequestBody {
            content={application/json: OpenApiMediaType {
              schema=OpenApiComponentOrRef {
                ref=#/paths//apps/{app_name}/volumes/{volume_id}/put/requestBody/content/application/json/schema,
                reference=OpenApiSchemaReference {
                  ref=#/components/schemas/UpdateVolumeRequest,
                  name=UpdateVolumeRequest,
                  node={$ref: #/components/schemas/UpdateVolumeRequest},
                },
                node={$ref: #/components/schemas/UpdateVolumeRequest},
              },
              encoding={},
              ref=#/paths//apps/{app_name}/volumes/{volume_id}/put/requestBody/content/application/json,
              node={schema: {$ref: #/components/schemas/UpdateVolumeRequest}},
            }},
            description=Request body,
            required=true,
            ref=#/paths//apps/{app_name}/volumes/{volume_id}/put/requestBody,
            node={description: Request body, content: {application/json: {schema: {$ref: #/components/schemas/UpdateVolumeRequest}}}, required: true},
          },
        },
        responses={200: OpenApiComponentOrRef {
          ref=#/paths//apps/{app_name}/volumes/{volume_id}/put/responses/200,
          component=OpenApiResponse {
            description=OK,
            content={application/json: OpenApiMediaType {
              schema=OpenApiComponentOrRef {
                ref=#/paths//apps/{app_name}/volumes/{volume_id}/put/responses/200/content/application/json/schema,
                reference=OpenApiSchemaReference {
                  ref=#/components/schemas/Volume,
                  name=Volume,
                  node={$ref: #/components/schemas/Volume},
                },
                node={$ref: #/components/schemas/Volume},
              },
              encoding={},
              ref=#/paths//apps/{app_name}/volumes/{volume_id}/put/responses/200/content/application/json,
              node={schema: {$ref: #/components/schemas/Volume}},
            }},
            ref=#/paths//apps/{app_name}/volumes/{volume_id}/put/responses/200,
            node={description: OK, content: {application/json: {schema: {$ref: #/components/schemas/Volume}}}},
          },
        }, 400: OpenApiComponentOrRef {
          ref=#/paths//apps/{app_name}/volumes/{volume_id}/put/responses/400,
          component=OpenApiResponse {
            description=Bad Request,
            content={application/json: OpenApiMediaType {
              schema=OpenApiComponentOrRef {
                ref=#/paths//apps/{app_name}/volumes/{volume_id}/put/responses/400/content/application/json/schema,
                reference=OpenApiSchemaReference {
                  ref=#/components/schemas/ErrorResponse,
                  name=ErrorResponse,
                  node={$ref: #/components/schemas/ErrorResponse},
                },
                node={$ref: #/components/schemas/ErrorResponse},
              },
              encoding={},
              ref=#/paths//apps/{app_name}/volumes/{volume_id}/put/responses/400/content/application/json,
              node={schema: {$ref: #/components/schemas/ErrorResponse}},
            }},
            ref=#/paths//apps/{app_name}/volumes/{volume_id}/put/responses/400,
            node={description: Bad Request, content: {application/json: {schema: {$ref: #/components/schemas/ErrorResponse}}}},
          },
        }},
        extensions={x-codegen-request-body-name: request},
      }, delete: OpenApiOperation {
        type=delete,
        tags=[Volumes],
        summary=Destroy Volume,
        description=Delete a specific volume within an app by volume ID.
,
        operationId=Volume_delete,
        parameters=[OpenApiComponentOrRef {
          ref=#/paths//apps/{app_name}/volumes/{volume_id}/delete/parameters/0,
          component=OpenApiParameter {
            name=app_name,
            location=path,
            description=Fly App Name,
            required=true,
            schema=OpenApiComponentOrRef {
              ref=#/paths//apps/{app_name}/volumes/{volume_id}/delete/parameters/0/schema,
              component=OpenApiSchema {
                type=string,
                ref=#/paths//apps/{app_name}/volumes/{volume_id}/delete/parameters/0/schema,
                node={type: string},
              },
            },
            ref=#/paths//apps/{app_name}/volumes/{volume_id}/delete/parameters/0,
            node={name: app_name, in: path, description: Fly App Name, required: true, schema: {type: string}},
          },
        }, OpenApiComponentOrRef {
          ref=#/paths//apps/{app_name}/volumes/{volume_id}/delete/parameters/1,
          component=OpenApiParameter {
            name=volume_id,
            location=path,
            description=Volume ID,
            required=true,
            schema=OpenApiComponentOrRef {
              ref=#/paths//apps/{app_name}/volumes/{volume_id}/delete/parameters/1/schema,
              component=OpenApiSchema {
                type=string,
                ref=#/paths//apps/{app_name}/volumes/{volume_id}/delete/parameters/1/schema,
                node={type: string},
              },
            },
            ref=#/paths//apps/{app_name}/volumes/{volume_id}/delete/parameters/1,
            node={name: volume_id, in: path, description: Volume ID, required: true, schema: {type: string}},
          },
        }],
        responses={200: OpenApiComponentOrRef {
          ref=#/paths//apps/{app_name}/volumes/{volume_id}/delete/responses/200,
          component=OpenApiResponse {
            description=OK,
            content={application/json: OpenApiMediaType {
              schema=OpenApiComponentOrRef {
                ref=#/paths//apps/{app_name}/volumes/{volume_id}/delete/responses/200/content/application/json/schema,
                reference=OpenApiSchemaReference {
                  ref=#/components/schemas/Volume,
                  name=Volume,
                  node={$ref: #/components/schemas/Volume},
                },
                node={$ref: #/components/schemas/Volume},
              },
              encoding={},
              ref=#/paths//apps/{app_name}/volumes/{volume_id}/delete/responses/200/content/application/json,
              node={schema: {$ref: #/components/schemas/Volume}},
            }},
            ref=#/paths//apps/{app_name}/volumes/{volume_id}/delete/responses/200,
            node={description: OK, content: {application/json: {schema: {$ref: #/components/schemas/Volume}}}},
          },
        }},
      }},
      parameters=[],
      ref=#/paths//apps/{app_name}/volumes/{volume_id},
      node={get: {tags: [Volumes], summary: Get Volume, description: Retrieve details about a specific volume by its ID within an app.
, operationId: Volumes_get_by_id, parameters: [{name: app_name, in: path, description: Fly App Name, required: true, schema: {type: string}}, {name: volume_id, in: path, description: Volume ID, required: true, schema: {type: string}}], responses: {200: {description: OK, content: {application/json: {schema: {$ref: #/components/schemas/Volume}}}}}}, put: {tags: [Volumes], summary: Update Volume, description: Update a volume's configuration using the details provided in the request body.
, operationId: Volumes_update, parameters: [{name: app_name, in: path, description: Fly App Name, required: true, schema: {type: string}}, {name: volume_id, in: path, description: Volume ID, required: true, schema: {type: string}}], requestBody: {description: Request body, content: {application/json: {schema: {$ref: #/components/schemas/UpdateVolumeRequest}}}, required: true}, responses: {200: {description: OK, content: {application/json: {schema: {$ref: #/components/schemas/Volume}}}}, 400: {description: Bad Request, content: {application/json: {schema: {$ref: #/components/schemas/ErrorResponse}}}}}, x-codegen-request-body-name: request}, delete: {tags: [Volumes], summary: Destroy Volume, description: Delete a specific volume within an app by volume ID.
, operationId: Volume_delete, parameters: [{name: app_name, in: path, description: Fly App Name, required: true, schema: {type: string}}, {name: volume_id, in: path, description: Volume ID, required: true, schema: {type: string}}], responses: {200: {description: OK, content: {application/json: {schema: {$ref: #/components/schemas/Volume}}}}}}},
    },
  }, /apps/{app_name}/volumes/{volume_id}/extend: OpenApiComponentOrRef {
    ref=#/paths//apps/{app_name}/volumes/{volume_id}/extend,
    component=OpenApiPathItem {
      operations={put: OpenApiOperation {
        type=put,
        tags=[Volumes],
        summary=Extend Volume,
        description=Extend a volume's size within an app using the details provided in the request body.
,
        operationId=Volumes_extend,
        parameters=[OpenApiComponentOrRef {
          ref=#/paths//apps/{app_name}/volumes/{volume_id}/extend/put/parameters/0,
          component=OpenApiParameter {
            name=app_name,
            location=path,
            description=Fly App Name,
            required=true,
            schema=OpenApiComponentOrRef {
              ref=#/paths//apps/{app_name}/volumes/{volume_id}/extend/put/parameters/0/schema,
              component=OpenApiSchema {
                type=string,
                ref=#/paths//apps/{app_name}/volumes/{volume_id}/extend/put/parameters/0/schema,
                node={type: string},
              },
            },
            ref=#/paths//apps/{app_name}/volumes/{volume_id}/extend/put/parameters/0,
            node={name: app_name, in: path, description: Fly App Name, required: true, schema: {type: string}},
          },
        }, OpenApiComponentOrRef {
          ref=#/paths//apps/{app_name}/volumes/{volume_id}/extend/put/parameters/1,
          component=OpenApiParameter {
            name=volume_id,
            location=path,
            description=Volume ID,
            required=true,
            schema=OpenApiComponentOrRef {
              ref=#/paths//apps/{app_name}/volumes/{volume_id}/extend/put/parameters/1/schema,
              component=OpenApiSchema {
                type=string,
                ref=#/paths//apps/{app_name}/volumes/{volume_id}/extend/put/parameters/1/schema,
                node={type: string},
              },
            },
            ref=#/paths//apps/{app_name}/volumes/{volume_id}/extend/put/parameters/1,
            node={name: volume_id, in: path, description: Volume ID, required: true, schema: {type: string}},
          },
        }],
        requestBody=OpenApiComponentOrRef {
          ref=#/paths//apps/{app_name}/volumes/{volume_id}/extend/put/requestBody,
          component=OpenApiRequestBody {
            content={application/json: OpenApiMediaType {
              schema=OpenApiComponentOrRef {
                ref=#/paths//apps/{app_name}/volumes/{volume_id}/extend/put/requestBody/content/application/json/schema,
                reference=OpenApiSchemaReference {
                  ref=#/components/schemas/ExtendVolumeRequest,
                  name=ExtendVolumeRequest,
                  node={$ref: #/components/schemas/ExtendVolumeRequest},
                },
                node={$ref: #/components/schemas/ExtendVolumeRequest},
              },
              encoding={},
              ref=#/paths//apps/{app_name}/volumes/{volume_id}/extend/put/requestBody/content/application/json,
              node={schema: {$ref: #/components/schemas/ExtendVolumeRequest}},
            }},
            description=Request body,
            required=true,
            ref=#/paths//apps/{app_name}/volumes/{volume_id}/extend/put/requestBody,
            node={description: Request body, content: {application/json: {schema: {$ref: #/components/schemas/ExtendVolumeRequest}}}, required: true},
          },
        },
        responses={200: OpenApiComponentOrRef {
          ref=#/paths//apps/{app_name}/volumes/{volume_id}/extend/put/responses/200,
          component=OpenApiResponse {
            description=OK,
            content={application/json: OpenApiMediaType {
              schema=OpenApiComponentOrRef {
                ref=#/paths//apps/{app_name}/volumes/{volume_id}/extend/put/responses/200/content/application/json/schema,
                reference=OpenApiSchemaReference {
                  ref=#/components/schemas/ExtendVolumeResponse,
                  name=ExtendVolumeResponse,
                  node={$ref: #/components/schemas/ExtendVolumeResponse},
                },
                node={$ref: #/components/schemas/ExtendVolumeResponse},
              },
              encoding={},
              ref=#/paths//apps/{app_name}/volumes/{volume_id}/extend/put/responses/200/content/application/json,
              node={schema: {$ref: #/components/schemas/ExtendVolumeResponse}},
            }},
            ref=#/paths//apps/{app_name}/volumes/{volume_id}/extend/put/responses/200,
            node={description: OK, content: {application/json: {schema: {$ref: #/components/schemas/ExtendVolumeResponse}}}},
          },
        }},
        extensions={x-codegen-request-body-name: request},
      }},
      parameters=[],
      ref=#/paths//apps/{app_name}/volumes/{volume_id}/extend,
      node={put: {tags: [Volumes], summary: Extend Volume, description: Extend a volume's size within an app using the details provided in the request body.
, operationId: Volumes_extend, parameters: [{name: app_name, in: path, description: Fly App Name, required: true, schema: {type: string}}, {name: volume_id, in: path, description: Volume ID, required: true, schema: {type: string}}], requestBody: {description: Request body, content: {application/json: {schema: {$ref: #/components/schemas/ExtendVolumeRequest}}}, required: true}, responses: {200: {description: OK, content: {application/json: {schema: {$ref: #/components/schemas/ExtendVolumeResponse}}}}}, x-codegen-request-body-name: request}},
    },
  }, /apps/{app_name}/volumes/{volume_id}/snapshots: OpenApiComponentOrRef {
    ref=#/paths//apps/{app_name}/volumes/{volume_id}/snapshots,
    component=OpenApiPathItem {
      operations={get: OpenApiOperation {
        type=get,
        tags=[Volumes],
        summary=List Snapshots,
        description=List all snapshots for a specific volume within an app.
,
        operationId=Volumes_list_snapshots,
        parameters=[OpenApiComponentOrRef {
          ref=#/paths//apps/{app_name}/volumes/{volume_id}/snapshots/get/parameters/0,
          component=OpenApiParameter {
            name=app_name,
            location=path,
            description=Fly App Name,
            required=true,
            schema=OpenApiComponentOrRef {
              ref=#/paths//apps/{app_name}/volumes/{volume_id}/snapshots/get/parameters/0/schema,
              component=OpenApiSchema {
                type=string,
                ref=#/paths//apps/{app_name}/volumes/{volume_id}/snapshots/get/parameters/0/schema,
                node={type: string},
              },
            },
            ref=#/paths//apps/{app_name}/volumes/{volume_id}/snapshots/get/parameters/0,
            node={name: app_name, in: path, description: Fly App Name, required: true, schema: {type: string}},
          },
        }, OpenApiComponentOrRef {
          ref=#/paths//apps/{app_name}/volumes/{volume_id}/snapshots/get/parameters/1,
          component=OpenApiParameter {
            name=volume_id,
            location=path,
            description=Volume ID,
            required=true,
            schema=OpenApiComponentOrRef {
              ref=#/paths//apps/{app_name}/volumes/{volume_id}/snapshots/get/parameters/1/schema,
              component=OpenApiSchema {
                type=string,
                ref=#/paths//apps/{app_name}/volumes/{volume_id}/snapshots/get/parameters/1/schema,
                node={type: string},
              },
            },
            ref=#/paths//apps/{app_name}/volumes/{volume_id}/snapshots/get/parameters/1,
            node={name: volume_id, in: path, description: Volume ID, required: true, schema: {type: string}},
          },
        }],
        responses={200: OpenApiComponentOrRef {
          ref=#/paths//apps/{app_name}/volumes/{volume_id}/snapshots/get/responses/200,
          component=OpenApiResponse {
            description=OK,
            content={application/json: OpenApiMediaType {
              schema=OpenApiComponentOrRef {
                ref=#/paths//apps/{app_name}/volumes/{volume_id}/snapshots/get/responses/200/content/application/json/schema,
                component=OpenApiSchema {
                  type=array,
                  items=OpenApiComponentOrRef {
                    ref=#/paths//apps/{app_name}/volumes/{volume_id}/snapshots/get/responses/200/content/application/json/schema/items,
                    reference=OpenApiSchemaReference {
                      ref=#/components/schemas/VolumeSnapshot,
                      name=VolumeSnapshot,
                      node={$ref: #/components/schemas/VolumeSnapshot},
                    },
                    node={$ref: #/components/schemas/VolumeSnapshot},
                  },
                  ref=#/paths//apps/{app_name}/volumes/{volume_id}/snapshots/get/responses/200/content/application/json/schema,
                  node={type: array, items: {$ref: #/components/schemas/VolumeSnapshot}},
                },
              },
              encoding={},
              ref=#/paths//apps/{app_name}/volumes/{volume_id}/snapshots/get/responses/200/content/application/json,
              node={schema: {type: array, items: {$ref: #/components/schemas/VolumeSnapshot}}},
            }},
            ref=#/paths//apps/{app_name}/volumes/{volume_id}/snapshots/get/responses/200,
            node={description: OK, content: {application/json: {schema: {type: array, items: {$ref: #/components/schemas/VolumeSnapshot}}}}},
          },
        }},
      }, post: OpenApiOperation {
        type=post,
        tags=[Volumes],
        summary=Create Snapshot,
        description=Create a snapshot for a specific volume within an app.
,
        operationId=createVolumeSnapshot,
        parameters=[OpenApiComponentOrRef {
          ref=#/paths//apps/{app_name}/volumes/{volume_id}/snapshots/post/parameters/0,
          component=OpenApiParameter {
            name=app_name,
            location=path,
            description=Fly App Name,
            required=true,
            schema=OpenApiComponentOrRef {
              ref=#/paths//apps/{app_name}/volumes/{volume_id}/snapshots/post/parameters/0/schema,
              component=OpenApiSchema {
                type=string,
                ref=#/paths//apps/{app_name}/volumes/{volume_id}/snapshots/post/parameters/0/schema,
                node={type: string},
              },
            },
            ref=#/paths//apps/{app_name}/volumes/{volume_id}/snapshots/post/parameters/0,
            node={name: app_name, in: path, description: Fly App Name, required: true, schema: {type: string}},
          },
        }, OpenApiComponentOrRef {
          ref=#/paths//apps/{app_name}/volumes/{volume_id}/snapshots/post/parameters/1,
          component=OpenApiParameter {
            name=volume_id,
            location=path,
            description=Volume ID,
            required=true,
            schema=OpenApiComponentOrRef {
              ref=#/paths//apps/{app_name}/volumes/{volume_id}/snapshots/post/parameters/1/schema,
              component=OpenApiSchema {
                type=string,
                ref=#/paths//apps/{app_name}/volumes/{volume_id}/snapshots/post/parameters/1/schema,
                node={type: string},
              },
            },
            ref=#/paths//apps/{app_name}/volumes/{volume_id}/snapshots/post/parameters/1,
            node={name: volume_id, in: path, description: Volume ID, required: true, schema: {type: string}},
          },
        }],
        responses={200: OpenApiComponentOrRef {
          ref=#/paths//apps/{app_name}/volumes/{volume_id}/snapshots/post/responses/200,
          component=OpenApiResponse {
            description=OK,
            content={},
            ref=#/paths//apps/{app_name}/volumes/{volume_id}/snapshots/post/responses/200,
            node={description: OK, content: {}},
          },
        }},
      }},
      parameters=[],
      ref=#/paths//apps/{app_name}/volumes/{volume_id}/snapshots,
      node={get: {tags: [Volumes], summary: List Snapshots, description: List all snapshots for a specific volume within an app.
, operationId: Volumes_list_snapshots, parameters: [{name: app_name, in: path, description: Fly App Name, required: true, schema: {type: string}}, {name: volume_id, in: path, description: Volume ID, required: true, schema: {type: string}}], responses: {200: {description: OK, content: {application/json: {schema: {type: array, items: {$ref: #/components/schemas/VolumeSnapshot}}}}}}}, post: {tags: [Volumes], summary: Create Snapshot, description: Create a snapshot for a specific volume within an app.
, operationId: createVolumeSnapshot, parameters: [{name: app_name, in: path, description: Fly App Name, required: true, schema: {type: string}}, {name: volume_id, in: path, description: Volume ID, required: true, schema: {type: string}}], responses: {200: {description: OK, content: {}}}}},
    },
  }, /tokens/kms: OpenApiComponentOrRef {
    ref=#/paths//tokens/kms,
    component=OpenApiPathItem {
      operations={post: OpenApiOperation {
        type=post,
        tags=[Tokens],
        summary=Request a Petsem token for accessing KMS,
        description=This site hosts documentation generated from the Fly.io Machines API OpenAPI specification. Visit our complete [Machines API docs](https://fly.io/docs/machines/api/apps-resource/) for details about using the Apps resource.,
        operationId=Tokens_request_Kms,
        parameters=[],
        responses={200: OpenApiComponentOrRef {
          ref=#/paths//tokens/kms/post/responses/200,
          component=OpenApiResponse {
            description=KMS token,
            content={application/json: OpenApiMediaType {
              schema=OpenApiComponentOrRef {
                ref=#/paths//tokens/kms/post/responses/200/content/application/json/schema,
                component=OpenApiSchema {
                  type=string,
                  ref=#/paths//tokens/kms/post/responses/200/content/application/json/schema,
                  node={type: string},
                },
              },
              encoding={},
              ref=#/paths//tokens/kms/post/responses/200/content/application/json,
              node={schema: {type: string}},
            }},
            ref=#/paths//tokens/kms/post/responses/200,
            node={description: KMS token, content: {application/json: {schema: {type: string}}}},
          },
        }},
      }},
      parameters=[],
      ref=#/paths//tokens/kms,
      node={post: {tags: [Tokens], summary: Request a Petsem token for accessing KMS, description: This site hosts documentation generated from the Fly.io Machines API OpenAPI specification. Visit our complete [Machines API docs](https://fly.io/docs/machines/api/apps-resource/) for details about using the Apps resource., operationId: Tokens_request_Kms, responses: {200: {description: KMS token, content: {application/json: {schema: {type: string}}}}}}},
    },
  }, /tokens/oidc: OpenApiComponentOrRef {
    ref=#/paths//tokens/oidc,
    component=OpenApiPathItem {
      operations={post: OpenApiOperation {
        type=post,
        tags=[Tokens],
        summary=Request an OIDC token,
        description=Request an Open ID Connect token for your machine. Customize the audience claim with the `aud` parameter. This returns a JWT token. Learn more about [using OpenID Connect](/docs/reference/openid-connect/) on Fly.io.
,
        operationId=Tokens_request_OIDC,
        parameters=[],
        requestBody=OpenApiComponentOrRef {
          ref=#/paths//tokens/oidc/post/requestBody,
          component=OpenApiRequestBody {
            content={application/json: OpenApiMediaType {
              schema=OpenApiComponentOrRef {
                ref=#/paths//tokens/oidc/post/requestBody/content/application/json/schema,
                reference=OpenApiSchemaReference {
                  ref=#/components/schemas/CreateOIDCTokenRequest,
                  name=CreateOIDCTokenRequest,
                  node={$ref: #/components/schemas/CreateOIDCTokenRequest},
                },
                node={$ref: #/components/schemas/CreateOIDCTokenRequest},
              },
              encoding={},
              ref=#/paths//tokens/oidc/post/requestBody/content/application/json,
              node={schema: {$ref: #/components/schemas/CreateOIDCTokenRequest}},
            }},
            description=Optional request body,
            required=true,
            ref=#/paths//tokens/oidc/post/requestBody,
            node={description: Optional request body, content: {application/json: {schema: {$ref: #/components/schemas/CreateOIDCTokenRequest}}}, required: true},
          },
        },
        responses={200: OpenApiComponentOrRef {
          ref=#/paths//tokens/oidc/post/responses/200,
          component=OpenApiResponse {
            description=OIDC token,
            content={application/json: OpenApiMediaType {
              schema=OpenApiComponentOrRef {
                ref=#/paths//tokens/oidc/post/responses/200/content/application/json/schema,
                component=OpenApiSchema {
                  type=string,
                  ref=#/paths//tokens/oidc/post/responses/200/content/application/json/schema,
                  node={type: string},
                },
              },
              encoding={},
              ref=#/paths//tokens/oidc/post/responses/200/content/application/json,
              node={schema: {type: string}},
            }},
            ref=#/paths//tokens/oidc/post/responses/200,
            node={description: OIDC token, content: {application/json: {schema: {type: string}}}},
          },
        }, 400: OpenApiComponentOrRef {
          ref=#/paths//tokens/oidc/post/responses/400,
          component=OpenApiResponse {
            description=Bad Request,
            content={application/json: OpenApiMediaType {
              schema=OpenApiComponentOrRef {
                ref=#/paths//tokens/oidc/post/responses/400/content/application/json/schema,
                reference=OpenApiSchemaReference {
                  ref=#/components/schemas/ErrorResponse,
                  name=ErrorResponse,
                  node={$ref: #/components/schemas/ErrorResponse},
                },
                node={$ref: #/components/schemas/ErrorResponse},
              },
              encoding={},
              ref=#/paths//tokens/oidc/post/responses/400/content/application/json,
              node={schema: {$ref: #/components/schemas/ErrorResponse}},
            }},
            ref=#/paths//tokens/oidc/post/responses/400,
            node={description: Bad Request, content: {application/json: {schema: {$ref: #/components/schemas/ErrorResponse}}}},
          },
        }},
        extensions={x-codegen-request-body-name: request},
      }},
      parameters=[],
      ref=#/paths//tokens/oidc,
      node={post: {tags: [Tokens], summary: Request an OIDC token, description: Request an Open ID Connect token for your machine. Customize the audience claim with the `aud` parameter. This returns a JWT token. Learn more about [using OpenID Connect](/docs/reference/openid-connect/) on Fly.io.
, operationId: Tokens_request_OIDC, requestBody: {description: Optional request body, content: {application/json: {schema: {$ref: #/components/schemas/CreateOIDCTokenRequest}}}, required: true}, responses: {200: {description: OIDC token, content: {application/json: {schema: {type: string}}}}, 400: {description: Bad Request, content: {application/json: {schema: {$ref: #/components/schemas/ErrorResponse}}}}}, x-codegen-request-body-name: request}},
    },
  }},
  components=OpenApiComponents {
    schemas={App: OpenApiSchema {
      name=App,
      type=object,
      properties={id: OpenApiComponentOrRef {
        ref=#/components/schemas/App/properties/id,
        component=OpenApiSchema {
          name=id,
          type=string,
          ref=#/components/schemas/App/properties/id,
          node={type: string},
        },
      }, name: OpenApiComponentOrRef {
        ref=#/components/schemas/App/properties/name,
        component=OpenApiSchema {
          name=name,
          type=string,
          ref=#/components/schemas/App/properties/name,
          node={type: string},
        },
      }, organization: OpenApiComponentOrRef {
        ref=#/components/schemas/App/properties/organization,
        reference=OpenApiSchemaReference {
          ref=#/components/schemas/Organization,
          name=Organization,
          node={$ref: #/components/schemas/Organization},
        },
        node={$ref: #/components/schemas/Organization},
      }, status: OpenApiComponentOrRef {
        ref=#/components/schemas/App/properties/status,
        component=OpenApiSchema {
          name=status,
          type=string,
          ref=#/components/schemas/App/properties/status,
          node={type: string},
        },
      }},
      ref=#/components/schemas/App,
      node={type: object, properties: {id: {type: string}, name: {type: string}, organization: {$ref: #/components/schemas/Organization}, status: {type: string}}},
    }, CheckStatus: OpenApiSchema {
      name=CheckStatus,
      type=object,
      properties={name: OpenApiComponentOrRef {
        ref=#/components/schemas/CheckStatus/properties/name,
        component=OpenApiSchema {
          name=name,
          type=string,
          ref=#/components/schemas/CheckStatus/properties/name,
          node={type: string},
        },
      }, output: OpenApiComponentOrRef {
        ref=#/components/schemas/CheckStatus/properties/output,
        component=OpenApiSchema {
          name=output,
          type=string,
          ref=#/components/schemas/CheckStatus/properties/output,
          node={type: string},
        },
      }, status: OpenApiComponentOrRef {
        ref=#/components/schemas/CheckStatus/properties/status,
        component=OpenApiSchema {
          name=status,
          type=string,
          ref=#/components/schemas/CheckStatus/properties/status,
          node={type: string},
        },
      }, updated_at: OpenApiComponentOrRef {
        ref=#/components/schemas/CheckStatus/properties/updated_at,
        component=OpenApiSchema {
          name=updated_at,
          type=string,
          ref=#/components/schemas/CheckStatus/properties/updated_at,
          node={type: string},
        },
      }},
      ref=#/components/schemas/CheckStatus,
      node={type: object, properties: {name: {type: string}, output: {type: string}, status: {type: string}, updated_at: {type: string}}},
    }, CreateAppRequest: OpenApiSchema {
      name=CreateAppRequest,
      type=object,
      properties={app_name: OpenApiComponentOrRef {
        ref=#/components/schemas/CreateAppRequest/properties/app_name,
        component=OpenApiSchema {
          name=app_name,
          type=string,
          ref=#/components/schemas/CreateAppRequest/properties/app_name,
          node={type: string},
        },
      }, enable_subdomains: OpenApiComponentOrRef {
        ref=#/components/schemas/CreateAppRequest/properties/enable_subdomains,
        component=OpenApiSchema {
          name=enable_subdomains,
          type=boolean,
          ref=#/components/schemas/CreateAppRequest/properties/enable_subdomains,
          node={type: boolean},
        },
      }, network: OpenApiComponentOrRef {
        ref=#/components/schemas/CreateAppRequest/properties/network,
        component=OpenApiSchema {
          name=network,
          type=string,
          ref=#/components/schemas/CreateAppRequest/properties/network,
          node={type: string},
        },
      }, org_slug: OpenApiComponentOrRef {
        ref=#/components/schemas/CreateAppRequest/properties/org_slug,
        component=OpenApiSchema {
          name=org_slug,
          type=string,
          ref=#/components/schemas/CreateAppRequest/properties/org_slug,
          node={type: string},
        },
      }},
      ref=#/components/schemas/CreateAppRequest,
      node={type: object, properties: {app_name: {type: string}, enable_subdomains: {type: boolean}, network: {type: string}, org_slug: {type: string}}},
    }, CreateLeaseRequest: OpenApiSchema {
      name=CreateLeaseRequest,
      type=object,
      properties={description: OpenApiComponentOrRef {
        ref=#/components/schemas/CreateLeaseRequest/properties/description,
        component=OpenApiSchema {
          name=description,
          type=string,
          ref=#/components/schemas/CreateLeaseRequest/properties/description,
          node={type: string},
        },
      }, ttl: OpenApiComponentOrRef {
        ref=#/components/schemas/CreateLeaseRequest/properties/ttl,
        component=OpenApiSchema {
          name=ttl,
          type=integer,
          description=seconds lease will be valid,
          ref=#/components/schemas/CreateLeaseRequest/properties/ttl,
          node={type: integer, description: seconds lease will be valid},
        },
      }},
      ref=#/components/schemas/CreateLeaseRequest,
      node={type: object, properties: {description: {type: string}, ttl: {type: integer, description: seconds lease will be valid}}},
    }, CreateMachineRequest: OpenApiSchema {
      name=CreateMachineRequest,
      type=object,
      properties={config: OpenApiComponentOrRef {
        ref=#/components/schemas/CreateMachineRequest/properties/config,
        component=OpenApiSchema {
          name=config,
          type=object,
          allOf=[OpenApiComponentOrRef {
            ref=#/components/schemas/CreateMachineRequest/properties/config/allOf/0,
            reference=OpenApiSchemaReference {
              ref=#/components/schemas/fly.MachineConfig,
              name=fly.MachineConfig,
              node={$ref: #/components/schemas/fly.MachineConfig},
            },
            node={$ref: #/components/schemas/fly.MachineConfig},
          }],
          description=An object defining the Machine configuration,
          ref=#/components/schemas/CreateMachineRequest/properties/config,
          node={type: object, description: An object defining the Machine configuration, allOf: [{$ref: #/components/schemas/fly.MachineConfig}]},
        },
      }, lease_ttl: OpenApiComponentOrRef {
        ref=#/components/schemas/CreateMachineRequest/properties/lease_ttl,
        component=OpenApiSchema {
          name=lease_ttl,
          type=integer,
          ref=#/components/schemas/CreateMachineRequest/properties/lease_ttl,
          node={type: integer},
        },
      }, lsvd: OpenApiComponentOrRef {
        ref=#/components/schemas/CreateMachineRequest/properties/lsvd,
        component=OpenApiSchema {
          name=lsvd,
          type=boolean,
          ref=#/components/schemas/CreateMachineRequest/properties/lsvd,
          node={type: boolean},
        },
      }, name: OpenApiComponentOrRef {
        ref=#/components/schemas/CreateMachineRequest/properties/name,
        component=OpenApiSchema {
          name=name,
          type=string,
          description=Unique name for this Machine. If omitted, one is generated for you,
          ref=#/components/schemas/CreateMachineRequest/properties/name,
          node={type: string, description: Unique name for this Machine. If omitted, one is generated for you},
        },
      }, region: OpenApiComponentOrRef {
        ref=#/components/schemas/CreateMachineRequest/properties/region,
        component=OpenApiSchema {
          name=region,
          type=string,
          description=The target region. Omitting this param launches in the same region as your WireGuard peer connection (somewhere near you).,
          ref=#/components/schemas/CreateMachineRequest/properties/region,
          node={type: string, description: The target region. Omitting this param launches in the same region as your WireGuard peer connection (somewhere near you).},
        },
      }, skip_launch: OpenApiComponentOrRef {
        ref=#/components/schemas/CreateMachineRequest/properties/skip_launch,
        component=OpenApiSchema {
          name=skip_launch,
          type=boolean,
          ref=#/components/schemas/CreateMachineRequest/properties/skip_launch,
          node={type: boolean},
        },
      }, skip_service_registration: OpenApiComponentOrRef {
        ref=#/components/schemas/CreateMachineRequest/properties/skip_service_registration,
        component=OpenApiSchema {
          name=skip_service_registration,
          type=boolean,
          ref=#/components/schemas/CreateMachineRequest/properties/skip_service_registration,
          node={type: boolean},
        },
      }},
      ref=#/components/schemas/CreateMachineRequest,
      node={type: object, properties: {config: {type: object, description: An object defining the Machine configuration, allOf: [{$ref: #/components/schemas/fly.MachineConfig}]}, lease_ttl: {type: integer}, lsvd: {type: boolean}, name: {type: string, description: Unique name for this Machine. If omitted, one is generated for you}, region: {type: string, description: The target region. Omitting this param launches in the same region as your WireGuard peer connection (somewhere near you).}, skip_launch: {type: boolean}, skip_service_registration: {type: boolean}}},
    }, CreateOIDCTokenRequest: OpenApiSchema {
      name=CreateOIDCTokenRequest,
      type=object,
      properties={aud: OpenApiComponentOrRef {
        ref=#/components/schemas/CreateOIDCTokenRequest/properties/aud,
        component=OpenApiSchema {
          name=aud,
          type=string,
          example=https://fly.io/org-slug,
          ref=#/components/schemas/CreateOIDCTokenRequest/properties/aud,
          node={type: string, example: https://fly.io/org-slug},
        },
      }, aws_principal_tags: OpenApiComponentOrRef {
        ref=#/components/schemas/CreateOIDCTokenRequest/properties/aws_principal_tags,
        component=OpenApiSchema {
          name=aws_principal_tags,
          type=boolean,
          ref=#/components/schemas/CreateOIDCTokenRequest/properties/aws_principal_tags,
          node={type: boolean},
        },
      }},
      description=Optional parameters,
      ref=#/components/schemas/CreateOIDCTokenRequest,
      node={type: object, properties: {aud: {type: string, example: https://fly.io/org-slug}, aws_principal_tags: {type: boolean}}, description: Optional parameters},
    }, CreateSecretRequest: OpenApiSchema {
      name=CreateSecretRequest,
      type=object,
      properties={value: OpenApiComponentOrRef {
        ref=#/components/schemas/CreateSecretRequest/properties/value,
        component=OpenApiSchema {
          name=value,
          type=array,
          items=OpenApiComponentOrRef {
            ref=#/components/schemas/CreateSecretRequest/properties/value/items,
            component=OpenApiSchema {
              name=items,
              type=integer,
              ref=#/components/schemas/CreateSecretRequest/properties/value/items,
              node={type: integer},
            },
          },
          ref=#/components/schemas/CreateSecretRequest/properties/value,
          node={type: array, items: {type: integer}},
        },
      }},
      ref=#/components/schemas/CreateSecretRequest,
      node={type: object, properties: {value: {type: array, items: {type: integer}}}},
    }, CreateVolumeRequest: OpenApiSchema {
      name=CreateVolumeRequest,
      type=object,
      properties={compute: OpenApiComponentOrRef {
        ref=#/components/schemas/CreateVolumeRequest/properties/compute,
        reference=OpenApiSchemaReference {
          ref=#/components/schemas/fly.MachineGuest,
          name=fly.MachineGuest,
          node={$ref: #/components/schemas/fly.MachineGuest},
        },
        node={$ref: #/components/schemas/fly.MachineGuest},
      }, compute_image: OpenApiComponentOrRef {
        ref=#/components/schemas/CreateVolumeRequest/properties/compute_image,
        component=OpenApiSchema {
          name=compute_image,
          type=string,
          ref=#/components/schemas/CreateVolumeRequest/properties/compute_image,
          node={type: string},
        },
      }, encrypted: OpenApiComponentOrRef {
        ref=#/components/schemas/CreateVolumeRequest/properties/encrypted,
        component=OpenApiSchema {
          name=encrypted,
          type=boolean,
          ref=#/components/schemas/CreateVolumeRequest/properties/encrypted,
          node={type: boolean},
        },
      }, fstype: OpenApiComponentOrRef {
        ref=#/components/schemas/CreateVolumeRequest/properties/fstype,
        component=OpenApiSchema {
          name=fstype,
          type=string,
          ref=#/components/schemas/CreateVolumeRequest/properties/fstype,
          node={type: string},
        },
      }, name: OpenApiComponentOrRef {
        ref=#/components/schemas/CreateVolumeRequest/properties/name,
        component=OpenApiSchema {
          name=name,
          type=string,
          ref=#/components/schemas/CreateVolumeRequest/properties/name,
          node={type: string},
        },
      }, region: OpenApiComponentOrRef {
        ref=#/components/schemas/CreateVolumeRequest/properties/region,
        component=OpenApiSchema {
          name=region,
          type=string,
          ref=#/components/schemas/CreateVolumeRequest/properties/region,
          node={type: string},
        },
      }, require_unique_zone: OpenApiComponentOrRef {
        ref=#/components/schemas/CreateVolumeRequest/properties/require_unique_zone,
        component=OpenApiSchema {
          name=require_unique_zone,
          type=boolean,
          ref=#/components/schemas/CreateVolumeRequest/properties/require_unique_zone,
          node={type: boolean},
        },
      }, size_gb: OpenApiComponentOrRef {
        ref=#/components/schemas/CreateVolumeRequest/properties/size_gb,
        component=OpenApiSchema {
          name=size_gb,
          type=integer,
          ref=#/components/schemas/CreateVolumeRequest/properties/size_gb,
          node={type: integer},
        },
      }, snapshot_id: OpenApiComponentOrRef {
        ref=#/components/schemas/CreateVolumeRequest/properties/snapshot_id,
        component=OpenApiSchema {
          name=snapshot_id,
          type=string,
          description=restore from snapshot,
          ref=#/components/schemas/CreateVolumeRequest/properties/snapshot_id,
          node={type: string, description: restore from snapshot},
        },
      }, snapshot_retention: OpenApiComponentOrRef {
        ref=#/components/schemas/CreateVolumeRequest/properties/snapshot_retention,
        component=OpenApiSchema {
          name=snapshot_retention,
          type=integer,
          ref=#/components/schemas/CreateVolumeRequest/properties/snapshot_retention,
          node={type: integer},
        },
      }, source_volume_id: OpenApiComponentOrRef {
        ref=#/components/schemas/CreateVolumeRequest/properties/source_volume_id,
        component=OpenApiSchema {
          name=source_volume_id,
          type=string,
          description=fork from remote volume,
          ref=#/components/schemas/CreateVolumeRequest/properties/source_volume_id,
          node={type: string, description: fork from remote volume},
        },
      }, unique_zone_app_wide: OpenApiComponentOrRef {
        ref=#/components/schemas/CreateVolumeRequest/properties/unique_zone_app_wide,
        component=OpenApiSchema {
          name=unique_zone_app_wide,
          type=boolean,
          ref=#/components/schemas/CreateVolumeRequest/properties/unique_zone_app_wide,
          node={type: boolean},
        },
      }},
      ref=#/components/schemas/CreateVolumeRequest,
      node={type: object, properties: {compute: {$ref: #/components/schemas/fly.MachineGuest}, compute_image: {type: string}, encrypted: {type: boolean}, fstype: {type: string}, name: {type: string}, region: {type: string}, require_unique_zone: {type: boolean}, size_gb: {type: integer}, snapshot_id: {type: string, description: restore from snapshot}, snapshot_retention: {type: integer}, source_volume_id: {type: string, description: fork from remote volume}, unique_zone_app_wide: {type: boolean}}},
    }, ErrorResponse: OpenApiSchema {
      name=ErrorResponse,
      type=object,
      properties={details: OpenApiComponentOrRef {
        ref=#/components/schemas/ErrorResponse/properties/details,
        component=OpenApiSchema {
          name=details,
          type=object,
          description=Deprecated,
          ref=#/components/schemas/ErrorResponse/properties/details,
          node={type: object, description: Deprecated},
        },
      }, error: OpenApiComponentOrRef {
        ref=#/components/schemas/ErrorResponse/properties/error,
        component=OpenApiSchema {
          name=error,
          type=string,
          ref=#/components/schemas/ErrorResponse/properties/error,
          node={type: string},
        },
      }, status: OpenApiComponentOrRef {
        ref=#/components/schemas/ErrorResponse/properties/status,
        reference=OpenApiSchemaReference {
          ref=#/components/schemas/main.statusCode,
          name=main.statusCode,
          node={$ref: #/components/schemas/main.statusCode},
        },
        node={$ref: #/components/schemas/main.statusCode},
      }},
      ref=#/components/schemas/ErrorResponse,
      node={type: object, properties: {details: {type: object, description: Deprecated}, error: {type: string}, status: {$ref: #/components/schemas/main.statusCode}}},
    }, ExtendVolumeRequest: OpenApiSchema {
      name=ExtendVolumeRequest,
      type=object,
      properties={size_gb: OpenApiComponentOrRef {
        ref=#/components/schemas/ExtendVolumeRequest/properties/size_gb,
        component=OpenApiSchema {
          name=size_gb,
          type=integer,
          ref=#/components/schemas/ExtendVolumeRequest/properties/size_gb,
          node={type: integer},
        },
      }},
      ref=#/components/schemas/ExtendVolumeRequest,
      node={type: object, properties: {size_gb: {type: integer}}},
    }, ExtendVolumeResponse: OpenApiSchema {
      name=ExtendVolumeResponse,
      type=object,
      properties={needs_restart: OpenApiComponentOrRef {
        ref=#/components/schemas/ExtendVolumeResponse/properties/needs_restart,
        component=OpenApiSchema {
          name=needs_restart,
          type=boolean,
          ref=#/components/schemas/ExtendVolumeResponse/properties/needs_restart,
          node={type: boolean},
        },
      }, volume: OpenApiComponentOrRef {
        ref=#/components/schemas/ExtendVolumeResponse/properties/volume,
        reference=OpenApiSchemaReference {
          ref=#/components/schemas/Volume,
          name=Volume,
          node={$ref: #/components/schemas/Volume},
        },
        node={$ref: #/components/schemas/Volume},
      }},
      ref=#/components/schemas/ExtendVolumeResponse,
      node={type: object, properties: {needs_restart: {type: boolean}, volume: {$ref: #/components/schemas/Volume}}},
    }, ImageRef: OpenApiSchema {
      name=ImageRef,
      type=object,
      properties={digest: OpenApiComponentOrRef {
        ref=#/components/schemas/ImageRef/properties/digest,
        component=OpenApiSchema {
          name=digest,
          type=string,
          ref=#/components/schemas/ImageRef/properties/digest,
          node={type: string},
        },
      }, labels: OpenApiComponentOrRef {
        ref=#/components/schemas/ImageRef/properties/labels,
        component=OpenApiSchema {
          name=labels,
          type=object,
          additionalProperties=OpenApiAdditionalProperties {
            schema=OpenApiComponentOrRef {
              ref=#/components/schemas/ImageRef/properties/labels/additionalProperties,
              component=OpenApiSchema {
                name=additionalProperties,
                type=string,
                ref=#/components/schemas/ImageRef/properties/labels/additionalProperties,
                node={type: string},
              },
            },
          },
          ref=#/components/schemas/ImageRef/properties/labels,
          node={type: object, additionalProperties: {type: string}},
        },
      }, registry: OpenApiComponentOrRef {
        ref=#/components/schemas/ImageRef/properties/registry,
        component=OpenApiSchema {
          name=registry,
          type=string,
          ref=#/components/schemas/ImageRef/properties/registry,
          node={type: string},
        },
      }, repository: OpenApiComponentOrRef {
        ref=#/components/schemas/ImageRef/properties/repository,
        component=OpenApiSchema {
          name=repository,
          type=string,
          ref=#/components/schemas/ImageRef/properties/repository,
          node={type: string},
        },
      }, tag: OpenApiComponentOrRef {
        ref=#/components/schemas/ImageRef/properties/tag,
        component=OpenApiSchema {
          name=tag,
          type=string,
          ref=#/components/schemas/ImageRef/properties/tag,
          node={type: string},
        },
      }},
      ref=#/components/schemas/ImageRef,
      node={type: object, properties: {digest: {type: string}, labels: {type: object, additionalProperties: {type: string}}, registry: {type: string}, repository: {type: string}, tag: {type: string}}},
    }, Lease: OpenApiSchema {
      name=Lease,
      type=object,
      properties={description: OpenApiComponentOrRef {
        ref=#/components/schemas/Lease/properties/description,
        component=OpenApiSchema {
          name=description,
          type=string,
          description=Description or reason for the Lease.,
          ref=#/components/schemas/Lease/properties/description,
          node={type: string, description: Description or reason for the Lease.},
        },
      }, expires_at: OpenApiComponentOrRef {
        ref=#/components/schemas/Lease/properties/expires_at,
        component=OpenApiSchema {
          name=expires_at,
          type=integer,
          description=ExpiresAt is the unix timestamp in UTC to denote when the Lease will no longer be valid.,
          ref=#/components/schemas/Lease/properties/expires_at,
          node={type: integer, description: ExpiresAt is the unix timestamp in UTC to denote when the Lease will no longer be valid.},
        },
      }, nonce: OpenApiComponentOrRef {
        ref=#/components/schemas/Lease/properties/nonce,
        component=OpenApiSchema {
          name=nonce,
          type=string,
          description=Nonce is the unique ID autogenerated and associated with the Lease.,
          ref=#/components/schemas/Lease/properties/nonce,
          node={type: string, description: Nonce is the unique ID autogenerated and associated with the Lease.},
        },
      }, owner: OpenApiComponentOrRef {
        ref=#/components/schemas/Lease/properties/owner,
        component=OpenApiSchema {
          name=owner,
          type=string,
          description=Owner is the user identifier which acquired the Lease.,
          ref=#/components/schemas/Lease/properties/owner,
          node={type: string, description: Owner is the user identifier which acquired the Lease.},
        },
      }, version: OpenApiComponentOrRef {
        ref=#/components/schemas/Lease/properties/version,
        component=OpenApiSchema {
          name=version,
          type=string,
          description=Machine version,
          ref=#/components/schemas/Lease/properties/version,
          node={type: string, description: Machine version},
        },
      }},
      ref=#/components/schemas/Lease,
      node={type: object, properties: {description: {type: string, description: Description or reason for the Lease.}, expires_at: {type: integer, description: ExpiresAt is the unix timestamp in UTC to denote when the Lease will no longer be valid.}, nonce: {type: string, description: Nonce is the unique ID autogenerated and associated with the Lease.}, owner: {type: string, description: Owner is the user identifier which acquired the Lease.}, version: {type: string, description: Machine version}}},
    }, ListApp: OpenApiSchema {
      name=ListApp,
      type=object,
      properties={id: OpenApiComponentOrRef {
        ref=#/components/schemas/ListApp/properties/id,
        component=OpenApiSchema {
          name=id,
          type=string,
          ref=#/components/schemas/ListApp/properties/id,
          node={type: string},
        },
      }, machine_count: OpenApiComponentOrRef {
        ref=#/components/schemas/ListApp/properties/machine_count,
        component=OpenApiSchema {
          name=machine_count,
          type=integer,
          ref=#/components/schemas/ListApp/properties/machine_count,
          node={type: integer},
        },
      }, name: OpenApiComponentOrRef {
        ref=#/components/schemas/ListApp/properties/name,
        component=OpenApiSchema {
          name=name,
          type=string,
          ref=#/components/schemas/ListApp/properties/name,
          node={type: string},
        },
      }, network: OpenApiComponentOrRef {
        ref=#/components/schemas/ListApp/properties/network,
        component=OpenApiSchema {
          name=network,
          type=object,
          ref=#/components/schemas/ListApp/properties/network,
          node={type: object},
        },
      }},
      ref=#/components/schemas/ListApp,
      node={type: object, properties: {id: {type: string}, machine_count: {type: integer}, name: {type: string}, network: {type: object}}},
    }, ListAppsResponse: OpenApiSchema {
      name=ListAppsResponse,
      type=object,
      properties={apps: OpenApiComponentOrRef {
        ref=#/components/schemas/ListAppsResponse/properties/apps,
        component=OpenApiSchema {
          name=apps,
          type=array,
          items=OpenApiComponentOrRef {
            ref=#/components/schemas/ListAppsResponse/properties/apps/items,
            reference=OpenApiSchemaReference {
              ref=#/components/schemas/ListApp,
              name=ListApp,
              node={$ref: #/components/schemas/ListApp},
            },
            node={$ref: #/components/schemas/ListApp},
          },
          ref=#/components/schemas/ListAppsResponse/properties/apps,
          node={type: array, items: {$ref: #/components/schemas/ListApp}},
        },
      }, total_apps: OpenApiComponentOrRef {
        ref=#/components/schemas/ListAppsResponse/properties/total_apps,
        component=OpenApiSchema {
          name=total_apps,
          type=integer,
          ref=#/components/schemas/ListAppsResponse/properties/total_apps,
          node={type: integer},
        },
      }},
      ref=#/components/schemas/ListAppsResponse,
      node={type: object, properties: {apps: {type: array, items: {$ref: #/components/schemas/ListApp}}, total_apps: {type: integer}}},
    }, ListSecret: OpenApiSchema {
      name=ListSecret,
      type=object,
      properties={label: OpenApiComponentOrRef {
        ref=#/components/schemas/ListSecret/properties/label,
        component=OpenApiSchema {
          name=label,
          type=string,
          ref=#/components/schemas/ListSecret/properties/label,
          node={type: string},
        },
      }, publickey: OpenApiComponentOrRef {
        ref=#/components/schemas/ListSecret/properties/publickey,
        component=OpenApiSchema {
          name=publickey,
          type=array,
          items=OpenApiComponentOrRef {
            ref=#/components/schemas/ListSecret/properties/publickey/items,
            component=OpenApiSchema {
              name=items,
              type=integer,
              ref=#/components/schemas/ListSecret/properties/publickey/items,
              node={type: integer},
            },
          },
          ref=#/components/schemas/ListSecret/properties/publickey,
          node={type: array, items: {type: integer}},
        },
      }, type: OpenApiComponentOrRef {
        ref=#/components/schemas/ListSecret/properties/type,
        component=OpenApiSchema {
          name=type,
          type=string,
          ref=#/components/schemas/ListSecret/properties/type,
          node={type: string},
        },
      }},
      ref=#/components/schemas/ListSecret,
      node={type: object, properties: {label: {type: string}, publickey: {type: array, items: {type: integer}}, type: {type: string}}},
    }, ListenSocket: OpenApiSchema {
      name=ListenSocket,
      type=object,
      properties={address: OpenApiComponentOrRef {
        ref=#/components/schemas/ListenSocket/properties/address,
        component=OpenApiSchema {
          name=address,
          type=string,
          ref=#/components/schemas/ListenSocket/properties/address,
          node={type: string},
        },
      }, proto: OpenApiComponentOrRef {
        ref=#/components/schemas/ListenSocket/properties/proto,
        component=OpenApiSchema {
          name=proto,
          type=string,
          ref=#/components/schemas/ListenSocket/properties/proto,
          node={type: string},
        },
      }},
      ref=#/components/schemas/ListenSocket,
      node={type: object, properties: {address: {type: string}, proto: {type: string}}},
    }, Machine: OpenApiSchema {
      name=Machine,
      type=object,
      properties={checks: OpenApiComponentOrRef {
        ref=#/components/schemas/Machine/properties/checks,
        component=OpenApiSchema {
          name=checks,
          type=array,
          items=OpenApiComponentOrRef {
            ref=#/components/schemas/Machine/properties/checks/items,
            reference=OpenApiSchemaReference {
              ref=#/components/schemas/CheckStatus,
              name=CheckStatus,
              node={$ref: #/components/schemas/CheckStatus},
            },
            node={$ref: #/components/schemas/CheckStatus},
          },
          ref=#/components/schemas/Machine/properties/checks,
          node={type: array, items: {$ref: #/components/schemas/CheckStatus}},
        },
      }, config: OpenApiComponentOrRef {
        ref=#/components/schemas/Machine/properties/config,
        reference=OpenApiSchemaReference {
          ref=#/components/schemas/fly.MachineConfig,
          name=fly.MachineConfig,
          node={$ref: #/components/schemas/fly.MachineConfig},
        },
        node={$ref: #/components/schemas/fly.MachineConfig},
      }, created_at: OpenApiComponentOrRef {
        ref=#/components/schemas/Machine/properties/created_at,
        component=OpenApiSchema {
          name=created_at,
          type=string,
          ref=#/components/schemas/Machine/properties/created_at,
          node={type: string},
        },
      }, events: OpenApiComponentOrRef {
        ref=#/components/schemas/Machine/properties/events,
        component=OpenApiSchema {
          name=events,
          type=array,
          items=OpenApiComponentOrRef {
            ref=#/components/schemas/Machine/properties/events/items,
            reference=OpenApiSchemaReference {
              ref=#/components/schemas/MachineEvent,
              name=MachineEvent,
              node={$ref: #/components/schemas/MachineEvent},
            },
            node={$ref: #/components/schemas/MachineEvent},
          },
          ref=#/components/schemas/Machine/properties/events,
          node={type: array, items: {$ref: #/components/schemas/MachineEvent}},
        },
      }, host_status: OpenApiComponentOrRef {
        ref=#/components/schemas/Machine/properties/host_status,
        component=OpenApiSchema {
          name=host_status,
          type=string,
          enumValues={ok, unknown, unreachable},
          ref=#/components/schemas/Machine/properties/host_status,
          node={type: string, enum: [ok, unknown, unreachable]},
        },
      }, id: OpenApiComponentOrRef {
        ref=#/components/schemas/Machine/properties/id,
        component=OpenApiSchema {
          name=id,
          type=string,
          ref=#/components/schemas/Machine/properties/id,
          node={type: string},
        },
      }, image_ref: OpenApiComponentOrRef {
        ref=#/components/schemas/Machine/properties/image_ref,
        reference=OpenApiSchemaReference {
          ref=#/components/schemas/ImageRef,
          name=ImageRef,
          node={$ref: #/components/schemas/ImageRef},
        },
        node={$ref: #/components/schemas/ImageRef},
      }, incomplete_config: OpenApiComponentOrRef {
        ref=#/components/schemas/Machine/properties/incomplete_config,
        reference=OpenApiSchemaReference {
          ref=#/components/schemas/fly.MachineConfig,
          name=fly.MachineConfig,
          node={$ref: #/components/schemas/fly.MachineConfig},
        },
        node={$ref: #/components/schemas/fly.MachineConfig},
      }, instance_id: OpenApiComponentOrRef {
        ref=#/components/schemas/Machine/properties/instance_id,
        component=OpenApiSchema {
          name=instance_id,
          type=string,
          description=InstanceID is unique for each version of the machine,
          ref=#/components/schemas/Machine/properties/instance_id,
          node={type: string, description: InstanceID is unique for each version of the machine},
        },
      }, name: OpenApiComponentOrRef {
        ref=#/components/schemas/Machine/properties/name,
        component=OpenApiSchema {
          name=name,
          type=string,
          ref=#/components/schemas/Machine/properties/name,
          node={type: string},
        },
      }, nonce: OpenApiComponentOrRef {
        ref=#/components/schemas/Machine/properties/nonce,
        component=OpenApiSchema {
          name=nonce,
          type=string,
          description=Nonce is only every returned on machine creation if a lease_duration was provided.,
          ref=#/components/schemas/Machine/properties/nonce,
          node={type: string, description: Nonce is only every returned on machine creation if a lease_duration was provided.},
        },
      }, private_ip: OpenApiComponentOrRef {
        ref=#/components/schemas/Machine/properties/private_ip,
        component=OpenApiSchema {
          name=private_ip,
          type=string,
          description=PrivateIP is the internal 6PN address of the machine.,
          ref=#/components/schemas/Machine/properties/private_ip,
          node={type: string, description: PrivateIP is the internal 6PN address of the machine.},
        },
      }, region: OpenApiComponentOrRef {
        ref=#/components/schemas/Machine/properties/region,
        component=OpenApiSchema {
          name=region,
          type=string,
          ref=#/components/schemas/Machine/properties/region,
          node={type: string},
        },
      }, state: OpenApiComponentOrRef {
        ref=#/components/schemas/Machine/properties/state,
        component=OpenApiSchema {
          name=state,
          type=string,
          ref=#/components/schemas/Machine/properties/state,
          node={type: string},
        },
      }, updated_at: OpenApiComponentOrRef {
        ref=#/components/schemas/Machine/properties/updated_at,
        component=OpenApiSchema {
          name=updated_at,
          type=string,
          ref=#/components/schemas/Machine/properties/updated_at,
          node={type: string},
        },
      }},
      ref=#/components/schemas/Machine,
      node={type: object, properties: {checks: {type: array, items: {$ref: #/components/schemas/CheckStatus}}, config: {$ref: #/components/schemas/fly.MachineConfig}, created_at: {type: string}, events: {type: array, items: {$ref: #/components/schemas/MachineEvent}}, host_status: {type: string, enum: [ok, unknown, unreachable]}, id: {type: string}, image_ref: {$ref: #/components/schemas/ImageRef}, incomplete_config: {$ref: #/components/schemas/fly.MachineConfig}, instance_id: {type: string, description: InstanceID is unique for each version of the machine}, name: {type: string}, nonce: {type: string, description: Nonce is only every returned on machine creation if a lease_duration was provided.}, private_ip: {type: string, description: PrivateIP is the internal 6PN address of the machine.}, region: {type: string}, state: {type: string}, updated_at: {type: string}}},
    }, MachineEvent: OpenApiSchema {
      name=MachineEvent,
      type=object,
      properties={id: OpenApiComponentOrRef {
        ref=#/components/schemas/MachineEvent/properties/id,
        component=OpenApiSchema {
          name=id,
          type=string,
          ref=#/components/schemas/MachineEvent/properties/id,
          node={type: string},
        },
      }, request: OpenApiComponentOrRef {
        ref=#/components/schemas/MachineEvent/properties/request,
        component=OpenApiSchema {
          name=request,
          type=object,
          ref=#/components/schemas/MachineEvent/properties/request,
          node={type: object},
        },
      }, source: OpenApiComponentOrRef {
        ref=#/components/schemas/MachineEvent/properties/source,
        component=OpenApiSchema {
          name=source,
          type=string,
          ref=#/components/schemas/MachineEvent/properties/source,
          node={type: string},
        },
      }, status: OpenApiComponentOrRef {
        ref=#/components/schemas/MachineEvent/properties/status,
        component=OpenApiSchema {
          name=status,
          type=string,
          ref=#/components/schemas/MachineEvent/properties/status,
          node={type: string},
        },
      }, timestamp: OpenApiComponentOrRef {
        ref=#/components/schemas/MachineEvent/properties/timestamp,
        component=OpenApiSchema {
          name=timestamp,
          type=integer,
          ref=#/components/schemas/MachineEvent/properties/timestamp,
          node={type: integer},
        },
      }, type: OpenApiComponentOrRef {
        ref=#/components/schemas/MachineEvent/properties/type,
        component=OpenApiSchema {
          name=type,
          type=string,
          ref=#/components/schemas/MachineEvent/properties/type,
          node={type: string},
        },
      }},
      ref=#/components/schemas/MachineEvent,
      node={type: object, properties: {id: {type: string}, request: {type: object}, source: {type: string}, status: {type: string}, timestamp: {type: integer}, type: {type: string}}},
    }, MachineExecRequest: OpenApiSchema {
      name=MachineExecRequest,
      type=object,
      properties={cmd: OpenApiComponentOrRef {
        ref=#/components/schemas/MachineExecRequest/properties/cmd,
        component=OpenApiSchema {
          name=cmd,
          type=string,
          description=Deprecated: use Command instead,
          ref=#/components/schemas/MachineExecRequest/properties/cmd,
          node={type: string, description: Deprecated: use Command instead},
        },
      }, command: OpenApiComponentOrRef {
        ref=#/components/schemas/MachineExecRequest/properties/command,
        component=OpenApiSchema {
          name=command,
          type=array,
          items=OpenApiComponentOrRef {
            ref=#/components/schemas/MachineExecRequest/properties/command/items,
            component=OpenApiSchema {
              name=items,
              type=string,
              ref=#/components/schemas/MachineExecRequest/properties/command/items,
              node={type: string},
            },
          },
          ref=#/components/schemas/MachineExecRequest/properties/command,
          node={type: array, items: {type: string}},
        },
      }, container: OpenApiComponentOrRef {
        ref=#/components/schemas/MachineExecRequest/properties/container,
        component=OpenApiSchema {
          name=container,
          type=string,
          ref=#/components/schemas/MachineExecRequest/properties/container,
          node={type: string},
        },
      }, stdin: OpenApiComponentOrRef {
        ref=#/components/schemas/MachineExecRequest/properties/stdin,
        component=OpenApiSchema {
          name=stdin,
          type=string,
          ref=#/components/schemas/MachineExecRequest/properties/stdin,
          node={type: string},
        },
      }, timeout: OpenApiComponentOrRef {
        ref=#/components/schemas/MachineExecRequest/properties/timeout,
        component=OpenApiSchema {
          name=timeout,
          type=integer,
          ref=#/components/schemas/MachineExecRequest/properties/timeout,
          node={type: integer},
        },
      }},
      ref=#/components/schemas/MachineExecRequest,
      node={type: object, properties: {cmd: {type: string, description: Deprecated: use Command instead}, command: {type: array, items: {type: string}}, container: {type: string}, stdin: {type: string}, timeout: {type: integer}}},
    }, MachineVersion: OpenApiSchema {
      name=MachineVersion,
      type=object,
      properties={user_config: OpenApiComponentOrRef {
        ref=#/components/schemas/MachineVersion/properties/user_config,
        reference=OpenApiSchemaReference {
          ref=#/components/schemas/fly.MachineConfig,
          name=fly.MachineConfig,
          node={$ref: #/components/schemas/fly.MachineConfig},
        },
        node={$ref: #/components/schemas/fly.MachineConfig},
      }, version: OpenApiComponentOrRef {
        ref=#/components/schemas/MachineVersion/properties/version,
        component=OpenApiSchema {
          name=version,
          type=string,
          ref=#/components/schemas/MachineVersion/properties/version,
          node={type: string},
        },
      }},
      ref=#/components/schemas/MachineVersion,
      node={type: object, properties: {user_config: {$ref: #/components/schemas/fly.MachineConfig}, version: {type: string}}},
    }, Organization: OpenApiSchema {
      name=Organization,
      type=object,
      properties={name: OpenApiComponentOrRef {
        ref=#/components/schemas/Organization/properties/name,
        component=OpenApiSchema {
          name=name,
          type=string,
          ref=#/components/schemas/Organization/properties/name,
          node={type: string},
        },
      }, slug: OpenApiComponentOrRef {
        ref=#/components/schemas/Organization/properties/slug,
        component=OpenApiSchema {
          name=slug,
          type=string,
          ref=#/components/schemas/Organization/properties/slug,
          node={type: string},
        },
      }},
      ref=#/components/schemas/Organization,
      node={type: object, properties: {name: {type: string}, slug: {type: string}}},
    }, ProcessStat: OpenApiSchema {
      name=ProcessStat,
      type=object,
      properties={command: OpenApiComponentOrRef {
        ref=#/components/schemas/ProcessStat/properties/command,
        component=OpenApiSchema {
          name=command,
          type=string,
          ref=#/components/schemas/ProcessStat/properties/command,
          node={type: string},
        },
      }, cpu: OpenApiComponentOrRef {
        ref=#/components/schemas/ProcessStat/properties/cpu,
        component=OpenApiSchema {
          name=cpu,
          type=integer,
          ref=#/components/schemas/ProcessStat/properties/cpu,
          node={type: integer},
        },
      }, directory: OpenApiComponentOrRef {
        ref=#/components/schemas/ProcessStat/properties/directory,
        component=OpenApiSchema {
          name=directory,
          type=string,
          ref=#/components/schemas/ProcessStat/properties/directory,
          node={type: string},
        },
      }, listen_sockets: OpenApiComponentOrRef {
        ref=#/components/schemas/ProcessStat/properties/listen_sockets,
        component=OpenApiSchema {
          name=listen_sockets,
          type=array,
          items=OpenApiComponentOrRef {
            ref=#/components/schemas/ProcessStat/properties/listen_sockets/items,
            reference=OpenApiSchemaReference {
              ref=#/components/schemas/ListenSocket,
              name=ListenSocket,
              node={$ref: #/components/schemas/ListenSocket},
            },
            node={$ref: #/components/schemas/ListenSocket},
          },
          ref=#/components/schemas/ProcessStat/properties/listen_sockets,
          node={type: array, items: {$ref: #/components/schemas/ListenSocket}},
        },
      }, pid: OpenApiComponentOrRef {
        ref=#/components/schemas/ProcessStat/properties/pid,
        component=OpenApiSchema {
          name=pid,
          type=integer,
          ref=#/components/schemas/ProcessStat/properties/pid,
          node={type: integer},
        },
      }, rss: OpenApiComponentOrRef {
        ref=#/components/schemas/ProcessStat/properties/rss,
        component=OpenApiSchema {
          name=rss,
          type=integer,
          ref=#/components/schemas/ProcessStat/properties/rss,
          node={type: integer},
        },
      }, rtime: OpenApiComponentOrRef {
        ref=#/components/schemas/ProcessStat/properties/rtime,
        component=OpenApiSchema {
          name=rtime,
          type=integer,
          ref=#/components/schemas/ProcessStat/properties/rtime,
          node={type: integer},
        },
      }, stime: OpenApiComponentOrRef {
        ref=#/components/schemas/ProcessStat/properties/stime,
        component=OpenApiSchema {
          name=stime,
          type=integer,
          ref=#/components/schemas/ProcessStat/properties/stime,
          node={type: integer},
        },
      }},
      ref=#/components/schemas/ProcessStat,
      node={type: object, properties: {command: {type: string}, cpu: {type: integer}, directory: {type: string}, listen_sockets: {type: array, items: {$ref: #/components/schemas/ListenSocket}}, pid: {type: integer}, rss: {type: integer}, rtime: {type: integer}, stime: {type: integer}}},
    }, SignalRequest: OpenApiSchema {
      name=SignalRequest,
      type=object,
      properties={signal: OpenApiComponentOrRef {
        ref=#/components/schemas/SignalRequest/properties/signal,
        component=OpenApiSchema {
          name=signal,
          type=string,
          enumValues={SIGABRT, SIGALRM, SIGFPE, SIGHUP, SIGILL, SIGINT, SIGKILL, SIGPIPE, SIGQUIT, SIGSEGV, SIGTERM, SIGTRAP, SIGUSR1},
          ref=#/components/schemas/SignalRequest/properties/signal,
          node={type: string, enum: [SIGABRT, SIGALRM, SIGFPE, SIGHUP, SIGILL, SIGINT, SIGKILL, SIGPIPE, SIGQUIT, SIGSEGV, SIGTERM, SIGTRAP, SIGUSR1]},
        },
      }},
      ref=#/components/schemas/SignalRequest,
      node={type: object, properties: {signal: {type: string, enum: [SIGABRT, SIGALRM, SIGFPE, SIGHUP, SIGILL, SIGINT, SIGKILL, SIGPIPE, SIGQUIT, SIGSEGV, SIGTERM, SIGTRAP, SIGUSR1]}}},
    }, StopRequest: OpenApiSchema {
      name=StopRequest,
      type=object,
      properties={signal: OpenApiComponentOrRef {
        ref=#/components/schemas/StopRequest/properties/signal,
        component=OpenApiSchema {
          name=signal,
          type=string,
          ref=#/components/schemas/StopRequest/properties/signal,
          node={type: string},
        },
      }, timeout: OpenApiComponentOrRef {
        ref=#/components/schemas/StopRequest/properties/timeout,
        reference=OpenApiSchemaReference {
          ref=#/components/schemas/fly.Duration,
          name=fly.Duration,
          node={$ref: #/components/schemas/fly.Duration},
        },
        node={$ref: #/components/schemas/fly.Duration},
      }},
      ref=#/components/schemas/StopRequest,
      node={type: object, properties: {signal: {type: string}, timeout: {$ref: #/components/schemas/fly.Duration}}},
    }, UpdateMachineRequest: OpenApiSchema {
      name=UpdateMachineRequest,
      type=object,
      properties={config: OpenApiComponentOrRef {
        ref=#/components/schemas/UpdateMachineRequest/properties/config,
        component=OpenApiSchema {
          name=config,
          type=object,
          allOf=[OpenApiComponentOrRef {
            ref=#/components/schemas/UpdateMachineRequest/properties/config/allOf/0,
            reference=OpenApiSchemaReference {
              ref=#/components/schemas/fly.MachineConfig,
              name=fly.MachineConfig,
              node={$ref: #/components/schemas/fly.MachineConfig},
            },
            node={$ref: #/components/schemas/fly.MachineConfig},
          }],
          description=An object defining the Machine configuration,
          ref=#/components/schemas/UpdateMachineRequest/properties/config,
          node={type: object, description: An object defining the Machine configuration, allOf: [{$ref: #/components/schemas/fly.MachineConfig}]},
        },
      }, current_version: OpenApiComponentOrRef {
        ref=#/components/schemas/UpdateMachineRequest/properties/current_version,
        component=OpenApiSchema {
          name=current_version,
          type=string,
          ref=#/components/schemas/UpdateMachineRequest/properties/current_version,
          node={type: string},
        },
      }, lease_ttl: OpenApiComponentOrRef {
        ref=#/components/schemas/UpdateMachineRequest/properties/lease_ttl,
        component=OpenApiSchema {
          name=lease_ttl,
          type=integer,
          ref=#/components/schemas/UpdateMachineRequest/properties/lease_ttl,
          node={type: integer},
        },
      }, lsvd: OpenApiComponentOrRef {
        ref=#/components/schemas/UpdateMachineRequest/properties/lsvd,
        component=OpenApiSchema {
          name=lsvd,
          type=boolean,
          ref=#/components/schemas/UpdateMachineRequest/properties/lsvd,
          node={type: boolean},
        },
      }, name: OpenApiComponentOrRef {
        ref=#/components/schemas/UpdateMachineRequest/properties/name,
        component=OpenApiSchema {
          name=name,
          type=string,
          description=Unique name for this Machine. If omitted, one is generated for you,
          ref=#/components/schemas/UpdateMachineRequest/properties/name,
          node={type: string, description: Unique name for this Machine. If omitted, one is generated for you},
        },
      }, region: OpenApiComponentOrRef {
        ref=#/components/schemas/UpdateMachineRequest/properties/region,
        component=OpenApiSchema {
          name=region,
          type=string,
          description=The target region. Omitting this param launches in the same region as your WireGuard peer connection (somewhere near you).,
          ref=#/components/schemas/UpdateMachineRequest/properties/region,
          node={type: string, description: The target region. Omitting this param launches in the same region as your WireGuard peer connection (somewhere near you).},
        },
      }, skip_launch: OpenApiComponentOrRef {
        ref=#/components/schemas/UpdateMachineRequest/properties/skip_launch,
        component=OpenApiSchema {
          name=skip_launch,
          type=boolean,
          ref=#/components/schemas/UpdateMachineRequest/properties/skip_launch,
          node={type: boolean},
        },
      }, skip_service_registration: OpenApiComponentOrRef {
        ref=#/components/schemas/UpdateMachineRequest/properties/skip_service_registration,
        component=OpenApiSchema {
          name=skip_service_registration,
          type=boolean,
          ref=#/components/schemas/UpdateMachineRequest/properties/skip_service_registration,
          node={type: boolean},
        },
      }},
      ref=#/components/schemas/UpdateMachineRequest,
      node={type: object, properties: {config: {type: object, description: An object defining the Machine configuration, allOf: [{$ref: #/components/schemas/fly.MachineConfig}]}, current_version: {type: string}, lease_ttl: {type: integer}, lsvd: {type: boolean}, name: {type: string, description: Unique name for this Machine. If omitted, one is generated for you}, region: {type: string, description: The target region. Omitting this param launches in the same region as your WireGuard peer connection (somewhere near you).}, skip_launch: {type: boolean}, skip_service_registration: {type: boolean}}},
    }, UpdateVolumeRequest: OpenApiSchema {
      name=UpdateVolumeRequest,
      type=object,
      properties={auto_backup_enabled: OpenApiComponentOrRef {
        ref=#/components/schemas/UpdateVolumeRequest/properties/auto_backup_enabled,
        component=OpenApiSchema {
          name=auto_backup_enabled,
          type=boolean,
          ref=#/components/schemas/UpdateVolumeRequest/properties/auto_backup_enabled,
          node={type: boolean},
        },
      }, snapshot_retention: OpenApiComponentOrRef {
        ref=#/components/schemas/UpdateVolumeRequest/properties/snapshot_retention,
        component=OpenApiSchema {
          name=snapshot_retention,
          type=integer,
          ref=#/components/schemas/UpdateVolumeRequest/properties/snapshot_retention,
          node={type: integer},
        },
      }},
      ref=#/components/schemas/UpdateVolumeRequest,
      node={type: object, properties: {auto_backup_enabled: {type: boolean}, snapshot_retention: {type: integer}}},
    }, Volume: OpenApiSchema {
      name=Volume,
      type=object,
      properties={attached_alloc_id: OpenApiComponentOrRef {
        ref=#/components/schemas/Volume/properties/attached_alloc_id,
        component=OpenApiSchema {
          name=attached_alloc_id,
          type=string,
          ref=#/components/schemas/Volume/properties/attached_alloc_id,
          node={type: string},
        },
      }, attached_machine_id: OpenApiComponentOrRef {
        ref=#/components/schemas/Volume/properties/attached_machine_id,
        component=OpenApiSchema {
          name=attached_machine_id,
          type=string,
          ref=#/components/schemas/Volume/properties/attached_machine_id,
          node={type: string},
        },
      }, auto_backup_enabled: OpenApiComponentOrRef {
        ref=#/components/schemas/Volume/properties/auto_backup_enabled,
        component=OpenApiSchema {
          name=auto_backup_enabled,
          type=boolean,
          ref=#/components/schemas/Volume/properties/auto_backup_enabled,
          node={type: boolean},
        },
      }, block_size: OpenApiComponentOrRef {
        ref=#/components/schemas/Volume/properties/block_size,
        component=OpenApiSchema {
          name=block_size,
          type=integer,
          ref=#/components/schemas/Volume/properties/block_size,
          node={type: integer},
        },
      }, blocks: OpenApiComponentOrRef {
        ref=#/components/schemas/Volume/properties/blocks,
        component=OpenApiSchema {
          name=blocks,
          type=integer,
          ref=#/components/schemas/Volume/properties/blocks,
          node={type: integer},
        },
      }, blocks_avail: OpenApiComponentOrRef {
        ref=#/components/schemas/Volume/properties/blocks_avail,
        component=OpenApiSchema {
          name=blocks_avail,
          type=integer,
          ref=#/components/schemas/Volume/properties/blocks_avail,
          node={type: integer},
        },
      }, blocks_free: OpenApiComponentOrRef {
        ref=#/components/schemas/Volume/properties/blocks_free,
        component=OpenApiSchema {
          name=blocks_free,
          type=integer,
          ref=#/components/schemas/Volume/properties/blocks_free,
          node={type: integer},
        },
      }, created_at: OpenApiComponentOrRef {
        ref=#/components/schemas/Volume/properties/created_at,
        component=OpenApiSchema {
          name=created_at,
          type=string,
          ref=#/components/schemas/Volume/properties/created_at,
          node={type: string},
        },
      }, encrypted: OpenApiComponentOrRef {
        ref=#/components/schemas/Volume/properties/encrypted,
        component=OpenApiSchema {
          name=encrypted,
          type=boolean,
          ref=#/components/schemas/Volume/properties/encrypted,
          node={type: boolean},
        },
      }, fstype: OpenApiComponentOrRef {
        ref=#/components/schemas/Volume/properties/fstype,
        component=OpenApiSchema {
          name=fstype,
          type=string,
          ref=#/components/schemas/Volume/properties/fstype,
          node={type: string},
        },
      }, host_status: OpenApiComponentOrRef {
        ref=#/components/schemas/Volume/properties/host_status,
        component=OpenApiSchema {
          name=host_status,
          type=string,
          enumValues={ok, unknown, unreachable},
          ref=#/components/schemas/Volume/properties/host_status,
          node={type: string, enum: [ok, unknown, unreachable]},
        },
      }, id: OpenApiComponentOrRef {
        ref=#/components/schemas/Volume/properties/id,
        component=OpenApiSchema {
          name=id,
          type=string,
          ref=#/components/schemas/Volume/properties/id,
          node={type: string},
        },
      }, name: OpenApiComponentOrRef {
        ref=#/components/schemas/Volume/properties/name,
        component=OpenApiSchema {
          name=name,
          type=string,
          ref=#/components/schemas/Volume/properties/name,
          node={type: string},
        },
      }, region: OpenApiComponentOrRef {
        ref=#/components/schemas/Volume/properties/region,
        component=OpenApiSchema {
          name=region,
          type=string,
          ref=#/components/schemas/Volume/properties/region,
          node={type: string},
        },
      }, size_gb: OpenApiComponentOrRef {
        ref=#/components/schemas/Volume/properties/size_gb,
        component=OpenApiSchema {
          name=size_gb,
          type=integer,
          ref=#/components/schemas/Volume/properties/size_gb,
          node={type: integer},
        },
      }, snapshot_retention: OpenApiComponentOrRef {
        ref=#/components/schemas/Volume/properties/snapshot_retention,
        component=OpenApiSchema {
          name=snapshot_retention,
          type=integer,
          ref=#/components/schemas/Volume/properties/snapshot_retention,
          node={type: integer},
        },
      }, state: OpenApiComponentOrRef {
        ref=#/components/schemas/Volume/properties/state,
        component=OpenApiSchema {
          name=state,
          type=string,
          ref=#/components/schemas/Volume/properties/state,
          node={type: string},
        },
      }, zone: OpenApiComponentOrRef {
        ref=#/components/schemas/Volume/properties/zone,
        component=OpenApiSchema {
          name=zone,
          type=string,
          ref=#/components/schemas/Volume/properties/zone,
          node={type: string},
        },
      }},
      ref=#/components/schemas/Volume,
      node={type: object, properties: {attached_alloc_id: {type: string}, attached_machine_id: {type: string}, auto_backup_enabled: {type: boolean}, block_size: {type: integer}, blocks: {type: integer}, blocks_avail: {type: integer}, blocks_free: {type: integer}, created_at: {type: string}, encrypted: {type: boolean}, fstype: {type: string}, host_status: {type: string, enum: [ok, unknown, unreachable]}, id: {type: string}, name: {type: string}, region: {type: string}, size_gb: {type: integer}, snapshot_retention: {type: integer}, state: {type: string}, zone: {type: string}}},
    }, VolumeSnapshot: OpenApiSchema {
      name=VolumeSnapshot,
      type=object,
      properties={created_at: OpenApiComponentOrRef {
        ref=#/components/schemas/VolumeSnapshot/properties/created_at,
        component=OpenApiSchema {
          name=created_at,
          type=string,
          ref=#/components/schemas/VolumeSnapshot/properties/created_at,
          node={type: string},
        },
      }, digest: OpenApiComponentOrRef {
        ref=#/components/schemas/VolumeSnapshot/properties/digest,
        component=OpenApiSchema {
          name=digest,
          type=string,
          ref=#/components/schemas/VolumeSnapshot/properties/digest,
          node={type: string},
        },
      }, id: OpenApiComponentOrRef {
        ref=#/components/schemas/VolumeSnapshot/properties/id,
        component=OpenApiSchema {
          name=id,
          type=string,
          ref=#/components/schemas/VolumeSnapshot/properties/id,
          node={type: string},
        },
      }, retention_days: OpenApiComponentOrRef {
        ref=#/components/schemas/VolumeSnapshot/properties/retention_days,
        component=OpenApiSchema {
          name=retention_days,
          type=integer,
          ref=#/components/schemas/VolumeSnapshot/properties/retention_days,
          node={type: integer},
        },
      }, size: OpenApiComponentOrRef {
        ref=#/components/schemas/VolumeSnapshot/properties/size,
        component=OpenApiSchema {
          name=size,
          type=integer,
          ref=#/components/schemas/VolumeSnapshot/properties/size,
          node={type: integer},
        },
      }, status: OpenApiComponentOrRef {
        ref=#/components/schemas/VolumeSnapshot/properties/status,
        component=OpenApiSchema {
          name=status,
          type=string,
          ref=#/components/schemas/VolumeSnapshot/properties/status,
          node={type: string},
        },
      }},
      ref=#/components/schemas/VolumeSnapshot,
      node={type: object, properties: {created_at: {type: string}, digest: {type: string}, id: {type: string}, retention_days: {type: integer}, size: {type: integer}, status: {type: string}}},
    }, fly.ContainerConfig: OpenApiSchema {
      name=fly.ContainerConfig,
      type=object,
      properties={cmd: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.ContainerConfig/properties/cmd,
        component=OpenApiSchema {
          name=cmd,
          type=array,
          items=OpenApiComponentOrRef {
            ref=#/components/schemas/fly.ContainerConfig/properties/cmd/items,
            component=OpenApiSchema {
              name=items,
              type=string,
              ref=#/components/schemas/fly.ContainerConfig/properties/cmd/items,
              node={type: string},
            },
          },
          description=CmdOverride is used to override the default command of the image.,
          ref=#/components/schemas/fly.ContainerConfig/properties/cmd,
          node={type: array, description: CmdOverride is used to override the default command of the image., items: {type: string}},
        },
      }, depends_on: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.ContainerConfig/properties/depends_on,
        component=OpenApiSchema {
          name=depends_on,
          type=array,
          items=OpenApiComponentOrRef {
            ref=#/components/schemas/fly.ContainerConfig/properties/depends_on/items,
            reference=OpenApiSchemaReference {
              ref=#/components/schemas/fly.ContainerDependency,
              name=fly.ContainerDependency,
              node={$ref: #/components/schemas/fly.ContainerDependency},
            },
            node={$ref: #/components/schemas/fly.ContainerDependency},
          },
          description=DependsOn can be used to define dependencies between containers. The container will only be
started after all of its dependent conditions have been satisfied.,
          ref=#/components/schemas/fly.ContainerConfig/properties/depends_on,
          node={type: array, description: DependsOn can be used to define dependencies between containers. The container will only be
started after all of its dependent conditions have been satisfied., items: {$ref: #/components/schemas/fly.ContainerDependency}},
        },
      }, entrypoint: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.ContainerConfig/properties/entrypoint,
        component=OpenApiSchema {
          name=entrypoint,
          type=array,
          items=OpenApiComponentOrRef {
            ref=#/components/schemas/fly.ContainerConfig/properties/entrypoint/items,
            component=OpenApiSchema {
              name=items,
              type=string,
              ref=#/components/schemas/fly.ContainerConfig/properties/entrypoint/items,
              node={type: string},
            },
          },
          description=EntrypointOverride is used to override the default entrypoint of the image.,
          ref=#/components/schemas/fly.ContainerConfig/properties/entrypoint,
          node={type: array, description: EntrypointOverride is used to override the default entrypoint of the image., items: {type: string}},
        },
      }, env: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.ContainerConfig/properties/env,
        component=OpenApiSchema {
          name=env,
          type=object,
          additionalProperties=OpenApiAdditionalProperties {
            schema=OpenApiComponentOrRef {
              ref=#/components/schemas/fly.ContainerConfig/properties/env/additionalProperties,
              component=OpenApiSchema {
                name=additionalProperties,
                type=string,
                ref=#/components/schemas/fly.ContainerConfig/properties/env/additionalProperties,
                node={type: string},
              },
            },
          },
          description=ExtraEnv is used to add additional environment variables to the container.,
          ref=#/components/schemas/fly.ContainerConfig/properties/env,
          node={type: object, additionalProperties: {type: string}, description: ExtraEnv is used to add additional environment variables to the container.},
        },
      }, env_from: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.ContainerConfig/properties/env_from,
        component=OpenApiSchema {
          name=env_from,
          type=array,
          items=OpenApiComponentOrRef {
            ref=#/components/schemas/fly.ContainerConfig/properties/env_from/items,
            reference=OpenApiSchemaReference {
              ref=#/components/schemas/fly.EnvFrom,
              name=fly.EnvFrom,
              node={$ref: #/components/schemas/fly.EnvFrom},
            },
            node={$ref: #/components/schemas/fly.EnvFrom},
          },
          description=EnvFrom can be provided to set environment variables from machine fields.,
          ref=#/components/schemas/fly.ContainerConfig/properties/env_from,
          node={type: array, description: EnvFrom can be provided to set environment variables from machine fields., items: {$ref: #/components/schemas/fly.EnvFrom}},
        },
      }, exec: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.ContainerConfig/properties/exec,
        component=OpenApiSchema {
          name=exec,
          type=array,
          items=OpenApiComponentOrRef {
            ref=#/components/schemas/fly.ContainerConfig/properties/exec/items,
            component=OpenApiSchema {
              name=items,
              type=string,
              ref=#/components/schemas/fly.ContainerConfig/properties/exec/items,
              node={type: string},
            },
          },
          description=Image Config overrides - these fields are used to override the image configuration.
If not provided, the image configuration will be used.
ExecOverride is used to override the default command of the image.,
          ref=#/components/schemas/fly.ContainerConfig/properties/exec,
          node={type: array, description: Image Config overrides - these fields are used to override the image configuration.
If not provided, the image configuration will be used.
ExecOverride is used to override the default command of the image., items: {type: string}},
        },
      }, files: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.ContainerConfig/properties/files,
        component=OpenApiSchema {
          name=files,
          type=array,
          items=OpenApiComponentOrRef {
            ref=#/components/schemas/fly.ContainerConfig/properties/files/items,
            reference=OpenApiSchemaReference {
              ref=#/components/schemas/fly.File,
              name=fly.File,
              node={$ref: #/components/schemas/fly.File},
            },
            node={$ref: #/components/schemas/fly.File},
          },
          description=Files are files that will be written to the container file system.,
          ref=#/components/schemas/fly.ContainerConfig/properties/files,
          node={type: array, description: Files are files that will be written to the container file system., items: {$ref: #/components/schemas/fly.File}},
        },
      }, healthchecks: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.ContainerConfig/properties/healthchecks,
        component=OpenApiSchema {
          name=healthchecks,
          type=array,
          items=OpenApiComponentOrRef {
            ref=#/components/schemas/fly.ContainerConfig/properties/healthchecks/items,
            reference=OpenApiSchemaReference {
              ref=#/components/schemas/fly.ContainerHealthcheck,
              name=fly.ContainerHealthcheck,
              node={$ref: #/components/schemas/fly.ContainerHealthcheck},
            },
            node={$ref: #/components/schemas/fly.ContainerHealthcheck},
          },
          description=Healthchecks determine the health of your containers. Healthchecks can use HTTP, TCP or an Exec command.,
          ref=#/components/schemas/fly.ContainerConfig/properties/healthchecks,
          node={type: array, description: Healthchecks determine the health of your containers. Healthchecks can use HTTP, TCP or an Exec command., items: {$ref: #/components/schemas/fly.ContainerHealthcheck}},
        },
      }, image: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.ContainerConfig/properties/image,
        component=OpenApiSchema {
          name=image,
          type=string,
          description=Image is the docker image to run.,
          ref=#/components/schemas/fly.ContainerConfig/properties/image,
          node={type: string, description: Image is the docker image to run.},
        },
      }, mounts: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.ContainerConfig/properties/mounts,
        component=OpenApiSchema {
          name=mounts,
          type=array,
          items=OpenApiComponentOrRef {
            ref=#/components/schemas/fly.ContainerConfig/properties/mounts/items,
            reference=OpenApiSchemaReference {
              ref=#/components/schemas/fly.ContainerMount,
              name=fly.ContainerMount,
              node={$ref: #/components/schemas/fly.ContainerMount},
            },
            node={$ref: #/components/schemas/fly.ContainerMount},
          },
          description=Set of mounts added to the container. These must reference a volume in the machine config via its name.,
          ref=#/components/schemas/fly.ContainerConfig/properties/mounts,
          node={type: array, description: Set of mounts added to the container. These must reference a volume in the machine config via its name., items: {$ref: #/components/schemas/fly.ContainerMount}},
        },
      }, name: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.ContainerConfig/properties/name,
        component=OpenApiSchema {
          name=name,
          type=string,
          description=Name is used to identify the container in the machine.,
          ref=#/components/schemas/fly.ContainerConfig/properties/name,
          node={type: string, description: Name is used to identify the container in the machine.},
        },
      }, restart: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.ContainerConfig/properties/restart,
        component=OpenApiSchema {
          name=restart,
          type=object,
          allOf=[OpenApiComponentOrRef {
            ref=#/components/schemas/fly.ContainerConfig/properties/restart/allOf/0,
            reference=OpenApiSchemaReference {
              ref=#/components/schemas/fly.MachineRestart,
              name=fly.MachineRestart,
              node={$ref: #/components/schemas/fly.MachineRestart},
            },
            node={$ref: #/components/schemas/fly.MachineRestart},
          }],
          description=Restart is used to define the restart policy for the container. NOTE: spot-price is not
supported for containers.,
          ref=#/components/schemas/fly.ContainerConfig/properties/restart,
          node={type: object, description: Restart is used to define the restart policy for the container. NOTE: spot-price is not
supported for containers., allOf: [{$ref: #/components/schemas/fly.MachineRestart}]},
        },
      }, secrets: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.ContainerConfig/properties/secrets,
        component=OpenApiSchema {
          name=secrets,
          type=array,
          items=OpenApiComponentOrRef {
            ref=#/components/schemas/fly.ContainerConfig/properties/secrets/items,
            reference=OpenApiSchemaReference {
              ref=#/components/schemas/fly.MachineSecret,
              name=fly.MachineSecret,
              node={$ref: #/components/schemas/fly.MachineSecret},
            },
            node={$ref: #/components/schemas/fly.MachineSecret},
          },
          description=Secrets can be provided at the process level to explicitly indicate which secrets should be
used for the process. If not provided, the secrets provided at the machine level will be used.,
          ref=#/components/schemas/fly.ContainerConfig/properties/secrets,
          node={type: array, description: Secrets can be provided at the process level to explicitly indicate which secrets should be
used for the process. If not provided, the secrets provided at the machine level will be used., items: {$ref: #/components/schemas/fly.MachineSecret}},
        },
      }, stop: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.ContainerConfig/properties/stop,
        component=OpenApiSchema {
          name=stop,
          type=object,
          allOf=[OpenApiComponentOrRef {
            ref=#/components/schemas/fly.ContainerConfig/properties/stop/allOf/0,
            reference=OpenApiSchemaReference {
              ref=#/components/schemas/fly.StopConfig,
              name=fly.StopConfig,
              node={$ref: #/components/schemas/fly.StopConfig},
            },
            node={$ref: #/components/schemas/fly.StopConfig},
          }],
          description=Stop is used to define the signal and timeout for stopping the container.,
          ref=#/components/schemas/fly.ContainerConfig/properties/stop,
          node={type: object, description: Stop is used to define the signal and timeout for stopping the container., allOf: [{$ref: #/components/schemas/fly.StopConfig}]},
        },
      }, user: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.ContainerConfig/properties/user,
        component=OpenApiSchema {
          name=user,
          type=string,
          description=UserOverride is used to override the default user of the image.,
          ref=#/components/schemas/fly.ContainerConfig/properties/user,
          node={type: string, description: UserOverride is used to override the default user of the image.},
        },
      }},
      ref=#/components/schemas/fly.ContainerConfig,
      node={type: object, properties: {cmd: {type: array, description: CmdOverride is used to override the default command of the image., items: {type: string}}, depends_on: {type: array, description: DependsOn can be used to define dependencies between containers. The container will only be
started after all of its dependent conditions have been satisfied., items: {$ref: #/components/schemas/fly.ContainerDependency}}, entrypoint: {type: array, description: EntrypointOverride is used to override the default entrypoint of the image., items: {type: string}}, env: {type: object, additionalProperties: {type: string}, description: ExtraEnv is used to add additional environment variables to the container.}, env_from: {type: array, description: EnvFrom can be provided to set environment variables from machine fields., items: {$ref: #/components/schemas/fly.EnvFrom}}, exec: {type: array, description: Image Config overrides - these fields are used to override the image configuration.
If not provided, the image configuration will be used.
ExecOverride is used to override the default command of the image., items: {type: string}}, files: {type: array, description: Files are files that will be written to the container file system., items: {$ref: #/components/schemas/fly.File}}, healthchecks: {type: array, description: Healthchecks determine the health of your containers. Healthchecks can use HTTP, TCP or an Exec command., items: {$ref: #/components/schemas/fly.ContainerHealthcheck}}, image: {type: string, description: Image is the docker image to run.}, mounts: {type: array, description: Set of mounts added to the container. These must reference a volume in the machine config via its name., items: {$ref: #/components/schemas/fly.ContainerMount}}, name: {type: string, description: Name is used to identify the container in the machine.}, restart: {type: object, description: Restart is used to define the restart policy for the container. NOTE: spot-price is not
supported for containers., allOf: [{$ref: #/components/schemas/fly.MachineRestart}]}, secrets: {type: array, description: Secrets can be provided at the process level to explicitly indicate which secrets should be
used for the process. If not provided, the secrets provided at the machine level will be used., items: {$ref: #/components/schemas/fly.MachineSecret}}, stop: {type: object, description: Stop is used to define the signal and timeout for stopping the container., allOf: [{$ref: #/components/schemas/fly.StopConfig}]}, user: {type: string, description: UserOverride is used to override the default user of the image.}}},
    }, fly.ContainerDependency: OpenApiSchema {
      name=fly.ContainerDependency,
      type=object,
      properties={condition: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.ContainerDependency/properties/condition,
        component=OpenApiSchema {
          name=condition,
          type=object,
          allOf=[OpenApiComponentOrRef {
            ref=#/components/schemas/fly.ContainerDependency/properties/condition/allOf/0,
            reference=OpenApiSchemaReference {
              ref=#/components/schemas/fly.ContainerDependencyCondition,
              name=fly.ContainerDependencyCondition,
              node={$ref: #/components/schemas/fly.ContainerDependencyCondition},
            },
            node={$ref: #/components/schemas/fly.ContainerDependencyCondition},
          }],
          ref=#/components/schemas/fly.ContainerDependency/properties/condition,
          node={type: object, allOf: [{$ref: #/components/schemas/fly.ContainerDependencyCondition}]},
        },
      }, name: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.ContainerDependency/properties/name,
        component=OpenApiSchema {
          name=name,
          type=string,
          ref=#/components/schemas/fly.ContainerDependency/properties/name,
          node={type: string},
        },
      }},
      ref=#/components/schemas/fly.ContainerDependency,
      node={type: object, properties: {condition: {type: object, allOf: [{$ref: #/components/schemas/fly.ContainerDependencyCondition}]}, name: {type: string}}},
    }, fly.ContainerDependencyCondition: OpenApiSchema {
      name=fly.ContainerDependencyCondition,
      type=string,
      enumValues={exited_successfully, healthy, started},
      ref=#/components/schemas/fly.ContainerDependencyCondition,
      node={type: string, enum: [exited_successfully, healthy, started], x-enum-varnames: [ExitedSuccessfully, Healthy, Started]},
      extensions={x-enum-varnames: [ExitedSuccessfully, Healthy, Started]},
    }, fly.ContainerHealthcheck: OpenApiSchema {
      name=fly.ContainerHealthcheck,
      type=object,
      properties={exec: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.ContainerHealthcheck/properties/exec,
        reference=OpenApiSchemaReference {
          ref=#/components/schemas/fly.ExecHealthcheck,
          name=fly.ExecHealthcheck,
          node={$ref: #/components/schemas/fly.ExecHealthcheck},
        },
        node={$ref: #/components/schemas/fly.ExecHealthcheck},
      }, failure_threshold: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.ContainerHealthcheck/properties/failure_threshold,
        component=OpenApiSchema {
          name=failure_threshold,
          type=integer,
          description=The number of times the check must fail before considering the container unhealthy.,
          ref=#/components/schemas/fly.ContainerHealthcheck/properties/failure_threshold,
          node={type: integer, description: The number of times the check must fail before considering the container unhealthy.},
        },
      }, grace_period: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.ContainerHealthcheck/properties/grace_period,
        component=OpenApiSchema {
          name=grace_period,
          type=integer,
          description=The time in seconds to wait after a container starts before checking its health.,
          ref=#/components/schemas/fly.ContainerHealthcheck/properties/grace_period,
          node={type: integer, description: The time in seconds to wait after a container starts before checking its health.},
        },
      }, http: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.ContainerHealthcheck/properties/http,
        reference=OpenApiSchemaReference {
          ref=#/components/schemas/fly.HTTPHealthcheck,
          name=fly.HTTPHealthcheck,
          node={$ref: #/components/schemas/fly.HTTPHealthcheck},
        },
        node={$ref: #/components/schemas/fly.HTTPHealthcheck},
      }, interval: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.ContainerHealthcheck/properties/interval,
        component=OpenApiSchema {
          name=interval,
          type=integer,
          description=The time in seconds between executing the defined check.,
          ref=#/components/schemas/fly.ContainerHealthcheck/properties/interval,
          node={type: integer, description: The time in seconds between executing the defined check.},
        },
      }, kind: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.ContainerHealthcheck/properties/kind,
        component=OpenApiSchema {
          name=kind,
          type=object,
          allOf=[OpenApiComponentOrRef {
            ref=#/components/schemas/fly.ContainerHealthcheck/properties/kind/allOf/0,
            reference=OpenApiSchemaReference {
              ref=#/components/schemas/fly.ContainerHealthcheckKind,
              name=fly.ContainerHealthcheckKind,
              node={$ref: #/components/schemas/fly.ContainerHealthcheckKind},
            },
            node={$ref: #/components/schemas/fly.ContainerHealthcheckKind},
          }],
          description=Kind of healthcheck (readiness, liveness),
          ref=#/components/schemas/fly.ContainerHealthcheck/properties/kind,
          node={type: object, description: Kind of healthcheck (readiness, liveness), allOf: [{$ref: #/components/schemas/fly.ContainerHealthcheckKind}]},
        },
      }, name: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.ContainerHealthcheck/properties/name,
        component=OpenApiSchema {
          name=name,
          type=string,
          description=The name of the check. Must be unique within the container.,
          ref=#/components/schemas/fly.ContainerHealthcheck/properties/name,
          node={type: string, description: The name of the check. Must be unique within the container.},
        },
      }, success_threshold: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.ContainerHealthcheck/properties/success_threshold,
        component=OpenApiSchema {
          name=success_threshold,
          type=integer,
          description=The number of times the check must succeeed before considering the container healthy.,
          ref=#/components/schemas/fly.ContainerHealthcheck/properties/success_threshold,
          node={type: integer, description: The number of times the check must succeeed before considering the container healthy.},
        },
      }, tcp: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.ContainerHealthcheck/properties/tcp,
        reference=OpenApiSchemaReference {
          ref=#/components/schemas/fly.TCPHealthcheck,
          name=fly.TCPHealthcheck,
          node={$ref: #/components/schemas/fly.TCPHealthcheck},
        },
        node={$ref: #/components/schemas/fly.TCPHealthcheck},
      }, timeout: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.ContainerHealthcheck/properties/timeout,
        component=OpenApiSchema {
          name=timeout,
          type=integer,
          description=The time in seconds to wait for the check to complete.,
          ref=#/components/schemas/fly.ContainerHealthcheck/properties/timeout,
          node={type: integer, description: The time in seconds to wait for the check to complete.},
        },
      }, unhealthy: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.ContainerHealthcheck/properties/unhealthy,
        component=OpenApiSchema {
          name=unhealthy,
          type=object,
          allOf=[OpenApiComponentOrRef {
            ref=#/components/schemas/fly.ContainerHealthcheck/properties/unhealthy/allOf/0,
            reference=OpenApiSchemaReference {
              ref=#/components/schemas/fly.UnhealthyPolicy,
              name=fly.UnhealthyPolicy,
              node={$ref: #/components/schemas/fly.UnhealthyPolicy},
            },
            node={$ref: #/components/schemas/fly.UnhealthyPolicy},
          }],
          description=Unhealthy policy that determines what action to take if a container is deemed unhealthy,
          ref=#/components/schemas/fly.ContainerHealthcheck/properties/unhealthy,
          node={type: object, description: Unhealthy policy that determines what action to take if a container is deemed unhealthy, allOf: [{$ref: #/components/schemas/fly.UnhealthyPolicy}]},
        },
      }},
      ref=#/components/schemas/fly.ContainerHealthcheck,
      node={type: object, properties: {exec: {$ref: #/components/schemas/fly.ExecHealthcheck}, failure_threshold: {type: integer, description: The number of times the check must fail before considering the container unhealthy.}, grace_period: {type: integer, description: The time in seconds to wait after a container starts before checking its health.}, http: {$ref: #/components/schemas/fly.HTTPHealthcheck}, interval: {type: integer, description: The time in seconds between executing the defined check.}, kind: {type: object, description: Kind of healthcheck (readiness, liveness), allOf: [{$ref: #/components/schemas/fly.ContainerHealthcheckKind}]}, name: {type: string, description: The name of the check. Must be unique within the container.}, success_threshold: {type: integer, description: The number of times the check must succeeed before considering the container healthy.}, tcp: {$ref: #/components/schemas/fly.TCPHealthcheck}, timeout: {type: integer, description: The time in seconds to wait for the check to complete.}, unhealthy: {type: object, description: Unhealthy policy that determines what action to take if a container is deemed unhealthy, allOf: [{$ref: #/components/schemas/fly.UnhealthyPolicy}]}}},
    }, fly.ContainerHealthcheckKind: OpenApiSchema {
      name=fly.ContainerHealthcheckKind,
      type=string,
      enumValues={readiness, liveness},
      ref=#/components/schemas/fly.ContainerHealthcheckKind,
      node={type: string, enum: [readiness, liveness], x-enum-varnames: [Readiness, Liveness]},
      extensions={x-enum-varnames: [Readiness, Liveness]},
    }, fly.ContainerHealthcheckScheme: OpenApiSchema {
      name=fly.ContainerHealthcheckScheme,
      type=string,
      enumValues={http, https},
      ref=#/components/schemas/fly.ContainerHealthcheckScheme,
      node={type: string, enum: [http, https], x-enum-varnames: [HTTP, HTTPS]},
      extensions={x-enum-varnames: [HTTP, HTTPS]},
    }, fly.ContainerMount: OpenApiSchema {
      name=fly.ContainerMount,
      type=object,
      properties={name: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.ContainerMount/properties/name,
        component=OpenApiSchema {
          name=name,
          type=string,
          description=The name of the volume. Must exist in the volumes field in the machine configuration,
          ref=#/components/schemas/fly.ContainerMount/properties/name,
          node={type: string, description: The name of the volume. Must exist in the volumes field in the machine configuration},
        },
      }, path: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.ContainerMount/properties/path,
        component=OpenApiSchema {
          name=path,
          type=string,
          description=The path to mount the volume within the container,
          ref=#/components/schemas/fly.ContainerMount/properties/path,
          node={type: string, description: The path to mount the volume within the container},
        },
      }},
      ref=#/components/schemas/fly.ContainerMount,
      node={type: object, properties: {name: {type: string, description: The name of the volume. Must exist in the volumes field in the machine configuration}, path: {type: string, description: The path to mount the volume within the container}}},
    }, fly.DNSConfig: OpenApiSchema {
      name=fly.DNSConfig,
      type=object,
      properties={dns_forward_rules: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.DNSConfig/properties/dns_forward_rules,
        component=OpenApiSchema {
          name=dns_forward_rules,
          type=array,
          items=OpenApiComponentOrRef {
            ref=#/components/schemas/fly.DNSConfig/properties/dns_forward_rules/items,
            reference=OpenApiSchemaReference {
              ref=#/components/schemas/fly.dnsForwardRule,
              name=fly.dnsForwardRule,
              node={$ref: #/components/schemas/fly.dnsForwardRule},
            },
            node={$ref: #/components/schemas/fly.dnsForwardRule},
          },
          ref=#/components/schemas/fly.DNSConfig/properties/dns_forward_rules,
          node={type: array, items: {$ref: #/components/schemas/fly.dnsForwardRule}},
        },
      }, hostname: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.DNSConfig/properties/hostname,
        component=OpenApiSchema {
          name=hostname,
          type=string,
          ref=#/components/schemas/fly.DNSConfig/properties/hostname,
          node={type: string},
        },
      }, hostname_fqdn: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.DNSConfig/properties/hostname_fqdn,
        component=OpenApiSchema {
          name=hostname_fqdn,
          type=string,
          ref=#/components/schemas/fly.DNSConfig/properties/hostname_fqdn,
          node={type: string},
        },
      }, nameservers: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.DNSConfig/properties/nameservers,
        component=OpenApiSchema {
          name=nameservers,
          type=array,
          items=OpenApiComponentOrRef {
            ref=#/components/schemas/fly.DNSConfig/properties/nameservers/items,
            component=OpenApiSchema {
              name=items,
              type=string,
              ref=#/components/schemas/fly.DNSConfig/properties/nameservers/items,
              node={type: string},
            },
          },
          ref=#/components/schemas/fly.DNSConfig/properties/nameservers,
          node={type: array, items: {type: string}},
        },
      }, options: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.DNSConfig/properties/options,
        component=OpenApiSchema {
          name=options,
          type=array,
          items=OpenApiComponentOrRef {
            ref=#/components/schemas/fly.DNSConfig/properties/options/items,
            reference=OpenApiSchemaReference {
              ref=#/components/schemas/fly.dnsOption,
              name=fly.dnsOption,
              node={$ref: #/components/schemas/fly.dnsOption},
            },
            node={$ref: #/components/schemas/fly.dnsOption},
          },
          ref=#/components/schemas/fly.DNSConfig/properties/options,
          node={type: array, items: {$ref: #/components/schemas/fly.dnsOption}},
        },
      }, searches: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.DNSConfig/properties/searches,
        component=OpenApiSchema {
          name=searches,
          type=array,
          items=OpenApiComponentOrRef {
            ref=#/components/schemas/fly.DNSConfig/properties/searches/items,
            component=OpenApiSchema {
              name=items,
              type=string,
              ref=#/components/schemas/fly.DNSConfig/properties/searches/items,
              node={type: string},
            },
          },
          ref=#/components/schemas/fly.DNSConfig/properties/searches,
          node={type: array, items: {type: string}},
        },
      }, skip_registration: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.DNSConfig/properties/skip_registration,
        component=OpenApiSchema {
          name=skip_registration,
          type=boolean,
          ref=#/components/schemas/fly.DNSConfig/properties/skip_registration,
          node={type: boolean},
        },
      }},
      ref=#/components/schemas/fly.DNSConfig,
      node={type: object, properties: {dns_forward_rules: {type: array, items: {$ref: #/components/schemas/fly.dnsForwardRule}}, hostname: {type: string}, hostname_fqdn: {type: string}, nameservers: {type: array, items: {type: string}}, options: {type: array, items: {$ref: #/components/schemas/fly.dnsOption}}, searches: {type: array, items: {type: string}}, skip_registration: {type: boolean}}},
    }, fly.Duration: OpenApiSchema {
      name=fly.Duration,
      type=object,
      properties={time.Duration: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.Duration/properties/time.Duration,
        component=OpenApiSchema {
          name=time.Duration,
          type=integer,
          ref=#/components/schemas/fly.Duration/properties/time.Duration,
          node={type: integer, x-enum-varnames: [minDuration, maxDuration, Nanosecond, Microsecond, Millisecond, Second, Minute, Hour, minDuration, maxDuration, Nanosecond, Microsecond, Millisecond, Second, Minute, Hour, minDuration, maxDuration, Nanosecond, Microsecond, Millisecond, Second, Minute, Hour]},
          extensions={x-enum-varnames: [minDuration, maxDuration, Nanosecond, Microsecond, Millisecond, Second, Minute, Hour, minDuration, maxDuration, Nanosecond, Microsecond, Millisecond, Second, Minute, Hour, minDuration, maxDuration, Nanosecond, Microsecond, Millisecond, Second, Minute, Hour]},
        },
      }},
      ref=#/components/schemas/fly.Duration,
      node={type: object, properties: {time.Duration: {type: integer, x-enum-varnames: [minDuration, maxDuration, Nanosecond, Microsecond, Millisecond, Second, Minute, Hour, minDuration, maxDuration, Nanosecond, Microsecond, Millisecond, Second, Minute, Hour, minDuration, maxDuration, Nanosecond, Microsecond, Millisecond, Second, Minute, Hour]}}},
    }, fly.EnvFrom: OpenApiSchema {
      name=fly.EnvFrom,
      type=object,
      properties={env_var: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.EnvFrom/properties/env_var,
        component=OpenApiSchema {
          name=env_var,
          type=string,
          description=EnvVar is required and is the name of the environment variable that will be set from the
secret. It must be a valid environment variable name.,
          ref=#/components/schemas/fly.EnvFrom/properties/env_var,
          node={type: string, description: EnvVar is required and is the name of the environment variable that will be set from the
secret. It must be a valid environment variable name.},
        },
      }, field_ref: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.EnvFrom/properties/field_ref,
        component=OpenApiSchema {
          name=field_ref,
          type=string,
          enumValues={id, version, app_name, private_ip, region, image},
          description=FieldRef selects a field of the Machine: supports id, version, app_name, private_ip, region, image.,
          ref=#/components/schemas/fly.EnvFrom/properties/field_ref,
          node={type: string, description: FieldRef selects a field of the Machine: supports id, version, app_name, private_ip, region, image., enum: [id, version, app_name, private_ip, region, image]},
        },
      }},
      description=EnvVar defines an environment variable to be populated from a machine field, env_var,
      ref=#/components/schemas/fly.EnvFrom,
      node={type: object, properties: {env_var: {type: string, description: EnvVar is required and is the name of the environment variable that will be set from the
secret. It must be a valid environment variable name.}, field_ref: {type: string, description: FieldRef selects a field of the Machine: supports id, version, app_name, private_ip, region, image., enum: [id, version, app_name, private_ip, region, image]}}, description: EnvVar defines an environment variable to be populated from a machine field, env_var},
    }, fly.ExecHealthcheck: OpenApiSchema {
      name=fly.ExecHealthcheck,
      type=object,
      properties={command: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.ExecHealthcheck/properties/command,
        component=OpenApiSchema {
          name=command,
          type=array,
          items=OpenApiComponentOrRef {
            ref=#/components/schemas/fly.ExecHealthcheck/properties/command/items,
            component=OpenApiSchema {
              name=items,
              type=string,
              ref=#/components/schemas/fly.ExecHealthcheck/properties/command/items,
              node={type: string},
            },
          },
          description=The command to run to check the health of the container (e.g. ["cat", "/tmp/healthy"]),
          ref=#/components/schemas/fly.ExecHealthcheck/properties/command,
          node={type: array, description: The command to run to check the health of the container (e.g. ["cat", "/tmp/healthy"]), items: {type: string}},
        },
      }},
      ref=#/components/schemas/fly.ExecHealthcheck,
      node={type: object, properties: {command: {type: array, description: The command to run to check the health of the container (e.g. ["cat", "/tmp/healthy"]), items: {type: string}}}},
    }, fly.File: OpenApiSchema {
      name=fly.File,
      type=object,
      properties={guest_path: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.File/properties/guest_path,
        component=OpenApiSchema {
          name=guest_path,
          type=string,
          description=GuestPath is the path on the machine where the file will be written and must be an absolute path.
For example: /full/path/to/file.json,
          ref=#/components/schemas/fly.File/properties/guest_path,
          node={type: string, description: GuestPath is the path on the machine where the file will be written and must be an absolute path.
For example: /full/path/to/file.json},
        },
      }, mode: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.File/properties/mode,
        component=OpenApiSchema {
          name=mode,
          type=integer,
          description=Mode bits used to set permissions on this file as accepted by chmod(2).,
          ref=#/components/schemas/fly.File/properties/mode,
          node={type: integer, description: Mode bits used to set permissions on this file as accepted by chmod(2).},
        },
      }, raw_value: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.File/properties/raw_value,
        component=OpenApiSchema {
          name=raw_value,
          type=string,
          description=The base64 encoded string of the file contents.,
          ref=#/components/schemas/fly.File/properties/raw_value,
          node={type: string, description: The base64 encoded string of the file contents.},
        },
      }, secret_name: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.File/properties/secret_name,
        component=OpenApiSchema {
          name=secret_name,
          type=string,
          description=The name of the secret that contains the base64 encoded file contents.,
          ref=#/components/schemas/fly.File/properties/secret_name,
          node={type: string, description: The name of the secret that contains the base64 encoded file contents.},
        },
      }},
      description=A file that will be written to the Machine. One of RawValue or SecretName must be set.,
      ref=#/components/schemas/fly.File,
      node={type: object, properties: {guest_path: {type: string, description: GuestPath is the path on the machine where the file will be written and must be an absolute path.
For example: /full/path/to/file.json}, mode: {type: integer, description: Mode bits used to set permissions on this file as accepted by chmod(2).}, raw_value: {type: string, description: The base64 encoded string of the file contents.}, secret_name: {type: string, description: The name of the secret that contains the base64 encoded file contents.}}, description: A file that will be written to the Machine. One of RawValue or SecretName must be set.},
    }, fly.HTTPHealthcheck: OpenApiSchema {
      name=fly.HTTPHealthcheck,
      type=object,
      properties={headers: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.HTTPHealthcheck/properties/headers,
        component=OpenApiSchema {
          name=headers,
          type=array,
          items=OpenApiComponentOrRef {
            ref=#/components/schemas/fly.HTTPHealthcheck/properties/headers/items,
            reference=OpenApiSchemaReference {
              ref=#/components/schemas/fly.MachineHTTPHeader,
              name=fly.MachineHTTPHeader,
              node={$ref: #/components/schemas/fly.MachineHTTPHeader},
            },
            node={$ref: #/components/schemas/fly.MachineHTTPHeader},
          },
          description=Additional headers to send with the request,
          ref=#/components/schemas/fly.HTTPHealthcheck/properties/headers,
          node={type: array, description: Additional headers to send with the request, items: {$ref: #/components/schemas/fly.MachineHTTPHeader}},
        },
      }, method: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.HTTPHealthcheck/properties/method,
        component=OpenApiSchema {
          name=method,
          type=string,
          description=The HTTP method to use to when making the request,
          ref=#/components/schemas/fly.HTTPHealthcheck/properties/method,
          node={type: string, description: The HTTP method to use to when making the request},
        },
      }, path: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.HTTPHealthcheck/properties/path,
        component=OpenApiSchema {
          name=path,
          type=string,
          description=The path to send the request to,
          ref=#/components/schemas/fly.HTTPHealthcheck/properties/path,
          node={type: string, description: The path to send the request to},
        },
      }, port: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.HTTPHealthcheck/properties/port,
        component=OpenApiSchema {
          name=port,
          type=integer,
          description=The port to connect to, often the same as internal_port,
          ref=#/components/schemas/fly.HTTPHealthcheck/properties/port,
          node={type: integer, description: The port to connect to, often the same as internal_port},
        },
      }, scheme: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.HTTPHealthcheck/properties/scheme,
        component=OpenApiSchema {
          name=scheme,
          type=object,
          allOf=[OpenApiComponentOrRef {
            ref=#/components/schemas/fly.HTTPHealthcheck/properties/scheme/allOf/0,
            reference=OpenApiSchemaReference {
              ref=#/components/schemas/fly.ContainerHealthcheckScheme,
              name=fly.ContainerHealthcheckScheme,
              node={$ref: #/components/schemas/fly.ContainerHealthcheckScheme},
            },
            node={$ref: #/components/schemas/fly.ContainerHealthcheckScheme},
          }],
          description=Whether to use http or https,
          ref=#/components/schemas/fly.HTTPHealthcheck/properties/scheme,
          node={type: object, description: Whether to use http or https, allOf: [{$ref: #/components/schemas/fly.ContainerHealthcheckScheme}]},
        },
      }, tls_server_name: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.HTTPHealthcheck/properties/tls_server_name,
        component=OpenApiSchema {
          name=tls_server_name,
          type=string,
          description=If the protocol is https, the hostname to use for TLS certificate validation,
          ref=#/components/schemas/fly.HTTPHealthcheck/properties/tls_server_name,
          node={type: string, description: If the protocol is https, the hostname to use for TLS certificate validation},
        },
      }, tls_skip_verify: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.HTTPHealthcheck/properties/tls_skip_verify,
        component=OpenApiSchema {
          name=tls_skip_verify,
          type=boolean,
          description=If the protocol is https, whether or not to verify the TLS certificate,
          ref=#/components/schemas/fly.HTTPHealthcheck/properties/tls_skip_verify,
          node={type: boolean, description: If the protocol is https, whether or not to verify the TLS certificate},
        },
      }},
      ref=#/components/schemas/fly.HTTPHealthcheck,
      node={type: object, properties: {headers: {type: array, description: Additional headers to send with the request, items: {$ref: #/components/schemas/fly.MachineHTTPHeader}}, method: {type: string, description: The HTTP method to use to when making the request}, path: {type: string, description: The path to send the request to}, port: {type: integer, description: The port to connect to, often the same as internal_port}, scheme: {type: object, description: Whether to use http or https, allOf: [{$ref: #/components/schemas/fly.ContainerHealthcheckScheme}]}, tls_server_name: {type: string, description: If the protocol is https, the hostname to use for TLS certificate validation}, tls_skip_verify: {type: boolean, description: If the protocol is https, whether or not to verify the TLS certificate}}},
    }, fly.HTTPOptions: OpenApiSchema {
      name=fly.HTTPOptions,
      type=object,
      properties={compress: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.HTTPOptions/properties/compress,
        component=OpenApiSchema {
          name=compress,
          type=boolean,
          ref=#/components/schemas/fly.HTTPOptions/properties/compress,
          node={type: boolean},
        },
      }, h2_backend: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.HTTPOptions/properties/h2_backend,
        component=OpenApiSchema {
          name=h2_backend,
          type=boolean,
          ref=#/components/schemas/fly.HTTPOptions/properties/h2_backend,
          node={type: boolean},
        },
      }, headers_read_timeout: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.HTTPOptions/properties/headers_read_timeout,
        component=OpenApiSchema {
          name=headers_read_timeout,
          type=integer,
          ref=#/components/schemas/fly.HTTPOptions/properties/headers_read_timeout,
          node={type: integer},
        },
      }, idle_timeout: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.HTTPOptions/properties/idle_timeout,
        component=OpenApiSchema {
          name=idle_timeout,
          type=integer,
          ref=#/components/schemas/fly.HTTPOptions/properties/idle_timeout,
          node={type: integer},
        },
      }, response: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.HTTPOptions/properties/response,
        reference=OpenApiSchemaReference {
          ref=#/components/schemas/fly.HTTPResponseOptions,
          name=fly.HTTPResponseOptions,
          node={$ref: #/components/schemas/fly.HTTPResponseOptions},
        },
        node={$ref: #/components/schemas/fly.HTTPResponseOptions},
      }},
      ref=#/components/schemas/fly.HTTPOptions,
      node={type: object, properties: {compress: {type: boolean}, h2_backend: {type: boolean}, headers_read_timeout: {type: integer}, idle_timeout: {type: integer}, response: {$ref: #/components/schemas/fly.HTTPResponseOptions}}},
    }, fly.HTTPResponseOptions: OpenApiSchema {
      name=fly.HTTPResponseOptions,
      type=object,
      properties={headers: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.HTTPResponseOptions/properties/headers,
        component=OpenApiSchema {
          name=headers,
          type=object,
          additionalProperties=OpenApiAdditionalProperties {
            schema=OpenApiComponentOrRef {
              ref=#/components/schemas/fly.HTTPResponseOptions/properties/headers/additionalProperties,
              component=OpenApiSchema {
                name=additionalProperties,
                type=object,
                ref=#/components/schemas/fly.HTTPResponseOptions/properties/headers/additionalProperties,
                node={type: object},
              },
            },
          },
          ref=#/components/schemas/fly.HTTPResponseOptions/properties/headers,
          node={type: object, additionalProperties: {type: object}},
        },
      }, pristine: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.HTTPResponseOptions/properties/pristine,
        component=OpenApiSchema {
          name=pristine,
          type=boolean,
          ref=#/components/schemas/fly.HTTPResponseOptions/properties/pristine,
          node={type: boolean},
        },
      }},
      ref=#/components/schemas/fly.HTTPResponseOptions,
      node={type: object, properties: {headers: {type: object, additionalProperties: {type: object}}, pristine: {type: boolean}}},
    }, fly.MachineCheck: OpenApiSchema {
      name=fly.MachineCheck,
      type=object,
      properties={grace_period: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.MachineCheck/properties/grace_period,
        component=OpenApiSchema {
          name=grace_period,
          type=object,
          allOf=[OpenApiComponentOrRef {
            ref=#/components/schemas/fly.MachineCheck/properties/grace_period/allOf/0,
            reference=OpenApiSchemaReference {
              ref=#/components/schemas/fly.Duration,
              name=fly.Duration,
              node={$ref: #/components/schemas/fly.Duration},
            },
            node={$ref: #/components/schemas/fly.Duration},
          }],
          description=The time to wait after a VM starts before checking its health,
          ref=#/components/schemas/fly.MachineCheck/properties/grace_period,
          node={type: object, description: The time to wait after a VM starts before checking its health, allOf: [{$ref: #/components/schemas/fly.Duration}]},
        },
      }, headers: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.MachineCheck/properties/headers,
        component=OpenApiSchema {
          name=headers,
          type=array,
          items=OpenApiComponentOrRef {
            ref=#/components/schemas/fly.MachineCheck/properties/headers/items,
            reference=OpenApiSchemaReference {
              ref=#/components/schemas/fly.MachineHTTPHeader,
              name=fly.MachineHTTPHeader,
              node={$ref: #/components/schemas/fly.MachineHTTPHeader},
            },
            node={$ref: #/components/schemas/fly.MachineHTTPHeader},
          },
          ref=#/components/schemas/fly.MachineCheck/properties/headers,
          node={type: array, items: {$ref: #/components/schemas/fly.MachineHTTPHeader}},
        },
      }, interval: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.MachineCheck/properties/interval,
        component=OpenApiSchema {
          name=interval,
          type=object,
          allOf=[OpenApiComponentOrRef {
            ref=#/components/schemas/fly.MachineCheck/properties/interval/allOf/0,
            reference=OpenApiSchemaReference {
              ref=#/components/schemas/fly.Duration,
              name=fly.Duration,
              node={$ref: #/components/schemas/fly.Duration},
            },
            node={$ref: #/components/schemas/fly.Duration},
          }],
          description=The time between connectivity checks,
          ref=#/components/schemas/fly.MachineCheck/properties/interval,
          node={type: object, description: The time between connectivity checks, allOf: [{$ref: #/components/schemas/fly.Duration}]},
        },
      }, kind: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.MachineCheck/properties/kind,
        component=OpenApiSchema {
          name=kind,
          type=string,
          enumValues={informational, readiness},
          description=Kind of the check (informational, readiness),
          ref=#/components/schemas/fly.MachineCheck/properties/kind,
          node={type: string, description: Kind of the check (informational, readiness), enum: [informational, readiness]},
        },
      }, method: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.MachineCheck/properties/method,
        component=OpenApiSchema {
          name=method,
          type=string,
          description=For http checks, the HTTP method to use to when making the request,
          ref=#/components/schemas/fly.MachineCheck/properties/method,
          node={type: string, description: For http checks, the HTTP method to use to when making the request},
        },
      }, path: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.MachineCheck/properties/path,
        component=OpenApiSchema {
          name=path,
          type=string,
          description=For http checks, the path to send the request to,
          ref=#/components/schemas/fly.MachineCheck/properties/path,
          node={type: string, description: For http checks, the path to send the request to},
        },
      }, port: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.MachineCheck/properties/port,
        component=OpenApiSchema {
          name=port,
          type=integer,
          description=The port to connect to, often the same as internal_port,
          ref=#/components/schemas/fly.MachineCheck/properties/port,
          node={type: integer, description: The port to connect to, often the same as internal_port},
        },
      }, protocol: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.MachineCheck/properties/protocol,
        component=OpenApiSchema {
          name=protocol,
          type=string,
          description=For http checks, whether to use http or https,
          ref=#/components/schemas/fly.MachineCheck/properties/protocol,
          node={type: string, description: For http checks, whether to use http or https},
        },
      }, timeout: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.MachineCheck/properties/timeout,
        component=OpenApiSchema {
          name=timeout,
          type=object,
          allOf=[OpenApiComponentOrRef {
            ref=#/components/schemas/fly.MachineCheck/properties/timeout/allOf/0,
            reference=OpenApiSchemaReference {
              ref=#/components/schemas/fly.Duration,
              name=fly.Duration,
              node={$ref: #/components/schemas/fly.Duration},
            },
            node={$ref: #/components/schemas/fly.Duration},
          }],
          description=The maximum time a connection can take before being reported as failing its health check,
          ref=#/components/schemas/fly.MachineCheck/properties/timeout,
          node={type: object, description: The maximum time a connection can take before being reported as failing its health check, allOf: [{$ref: #/components/schemas/fly.Duration}]},
        },
      }, tls_server_name: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.MachineCheck/properties/tls_server_name,
        component=OpenApiSchema {
          name=tls_server_name,
          type=string,
          description=If the protocol is https, the hostname to use for TLS certificate validation,
          ref=#/components/schemas/fly.MachineCheck/properties/tls_server_name,
          node={type: string, description: If the protocol is https, the hostname to use for TLS certificate validation},
        },
      }, tls_skip_verify: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.MachineCheck/properties/tls_skip_verify,
        component=OpenApiSchema {
          name=tls_skip_verify,
          type=boolean,
          description=For http checks with https protocol, whether or not to verify the TLS certificate,
          ref=#/components/schemas/fly.MachineCheck/properties/tls_skip_verify,
          node={type: boolean, description: For http checks with https protocol, whether or not to verify the TLS certificate},
        },
      }, type: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.MachineCheck/properties/type,
        component=OpenApiSchema {
          name=type,
          type=string,
          description=tcp or http,
          ref=#/components/schemas/fly.MachineCheck/properties/type,
          node={type: string, description: tcp or http},
        },
      }},
      description=An optional object that defines one or more named checks. The key for each check is the check name.,
      ref=#/components/schemas/fly.MachineCheck,
      node={type: object, properties: {grace_period: {type: object, description: The time to wait after a VM starts before checking its health, allOf: [{$ref: #/components/schemas/fly.Duration}]}, headers: {type: array, items: {$ref: #/components/schemas/fly.MachineHTTPHeader}}, interval: {type: object, description: The time between connectivity checks, allOf: [{$ref: #/components/schemas/fly.Duration}]}, kind: {type: string, description: Kind of the check (informational, readiness), enum: [informational, readiness]}, method: {type: string, description: For http checks, the HTTP method to use to when making the request}, path: {type: string, description: For http checks, the path to send the request to}, port: {type: integer, description: The port to connect to, often the same as internal_port}, protocol: {type: string, description: For http checks, whether to use http or https}, timeout: {type: object, description: The maximum time a connection can take before being reported as failing its health check, allOf: [{$ref: #/components/schemas/fly.Duration}]}, tls_server_name: {type: string, description: If the protocol is https, the hostname to use for TLS certificate validation}, tls_skip_verify: {type: boolean, description: For http checks with https protocol, whether or not to verify the TLS certificate}, type: {type: string, description: tcp or http}}, description: An optional object that defines one or more named checks. The key for each check is the check name.},
    }, fly.MachineConfig: OpenApiSchema {
      name=fly.MachineConfig,
      type=object,
      properties={auto_destroy: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.MachineConfig/properties/auto_destroy,
        component=OpenApiSchema {
          name=auto_destroy,
          type=boolean,
          description=Optional boolean telling the Machine to destroy itself once it’s complete (default false),
          ref=#/components/schemas/fly.MachineConfig/properties/auto_destroy,
          node={type: boolean, description: Optional boolean telling the Machine to destroy itself once it’s complete (default false)},
        },
      }, checks: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.MachineConfig/properties/checks,
        component=OpenApiSchema {
          name=checks,
          type=object,
          additionalProperties=OpenApiAdditionalProperties {
            schema=OpenApiComponentOrRef {
              ref=#/components/schemas/fly.MachineConfig/properties/checks/additionalProperties,
              reference=OpenApiSchemaReference {
                ref=#/components/schemas/fly.MachineCheck,
                name=fly.MachineCheck,
                node={$ref: #/components/schemas/fly.MachineCheck},
              },
              node={$ref: #/components/schemas/fly.MachineCheck},
            },
          },
          ref=#/components/schemas/fly.MachineConfig/properties/checks,
          node={type: object, additionalProperties: {$ref: #/components/schemas/fly.MachineCheck}},
        },
      }, containers: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.MachineConfig/properties/containers,
        component=OpenApiSchema {
          name=containers,
          type=array,
          items=OpenApiComponentOrRef {
            ref=#/components/schemas/fly.MachineConfig/properties/containers/items,
            reference=OpenApiSchemaReference {
              ref=#/components/schemas/fly.ContainerConfig,
              name=fly.ContainerConfig,
              node={$ref: #/components/schemas/fly.ContainerConfig},
            },
            node={$ref: #/components/schemas/fly.ContainerConfig},
          },
          description=Containers are a list of containers that will run in the machine. Currently restricted to
only specific organizations.,
          ref=#/components/schemas/fly.MachineConfig/properties/containers,
          node={type: array, description: Containers are a list of containers that will run in the machine. Currently restricted to
only specific organizations., items: {$ref: #/components/schemas/fly.ContainerConfig}},
        },
      }, disable_machine_autostart: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.MachineConfig/properties/disable_machine_autostart,
        component=OpenApiSchema {
          name=disable_machine_autostart,
          type=boolean,
          description=Deprecated: use Service.Autostart instead,
          ref=#/components/schemas/fly.MachineConfig/properties/disable_machine_autostart,
          node={type: boolean, description: Deprecated: use Service.Autostart instead},
        },
      }, dns: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.MachineConfig/properties/dns,
        reference=OpenApiSchemaReference {
          ref=#/components/schemas/fly.DNSConfig,
          name=fly.DNSConfig,
          node={$ref: #/components/schemas/fly.DNSConfig},
        },
        node={$ref: #/components/schemas/fly.DNSConfig},
      }, env: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.MachineConfig/properties/env,
        component=OpenApiSchema {
          name=env,
          type=object,
          additionalProperties=OpenApiAdditionalProperties {
            schema=OpenApiComponentOrRef {
              ref=#/components/schemas/fly.MachineConfig/properties/env/additionalProperties,
              component=OpenApiSchema {
                name=additionalProperties,
                type=string,
                ref=#/components/schemas/fly.MachineConfig/properties/env/additionalProperties,
                node={type: string},
              },
            },
          },
          description=An object filled with key/value pairs to be set as environment variables,
          ref=#/components/schemas/fly.MachineConfig/properties/env,
          node={type: object, additionalProperties: {type: string}, description: An object filled with key/value pairs to be set as environment variables},
        },
      }, files: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.MachineConfig/properties/files,
        component=OpenApiSchema {
          name=files,
          type=array,
          items=OpenApiComponentOrRef {
            ref=#/components/schemas/fly.MachineConfig/properties/files/items,
            reference=OpenApiSchemaReference {
              ref=#/components/schemas/fly.File,
              name=fly.File,
              node={$ref: #/components/schemas/fly.File},
            },
            node={$ref: #/components/schemas/fly.File},
          },
          ref=#/components/schemas/fly.MachineConfig/properties/files,
          node={type: array, items: {$ref: #/components/schemas/fly.File}},
        },
      }, guest: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.MachineConfig/properties/guest,
        reference=OpenApiSchemaReference {
          ref=#/components/schemas/fly.MachineGuest,
          name=fly.MachineGuest,
          node={$ref: #/components/schemas/fly.MachineGuest},
        },
        node={$ref: #/components/schemas/fly.MachineGuest},
      }, image: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.MachineConfig/properties/image,
        component=OpenApiSchema {
          name=image,
          type=string,
          description=The docker image to run,
          ref=#/components/schemas/fly.MachineConfig/properties/image,
          node={type: string, description: The docker image to run},
        },
      }, init: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.MachineConfig/properties/init,
        reference=OpenApiSchemaReference {
          ref=#/components/schemas/fly.MachineInit,
          name=fly.MachineInit,
          node={$ref: #/components/schemas/fly.MachineInit},
        },
        node={$ref: #/components/schemas/fly.MachineInit},
      }, metadata: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.MachineConfig/properties/metadata,
        component=OpenApiSchema {
          name=metadata,
          type=object,
          additionalProperties=OpenApiAdditionalProperties {
            schema=OpenApiComponentOrRef {
              ref=#/components/schemas/fly.MachineConfig/properties/metadata/additionalProperties,
              component=OpenApiSchema {
                name=additionalProperties,
                type=string,
                ref=#/components/schemas/fly.MachineConfig/properties/metadata/additionalProperties,
                node={type: string},
              },
            },
          },
          ref=#/components/schemas/fly.MachineConfig/properties/metadata,
          node={type: object, additionalProperties: {type: string}},
        },
      }, metrics: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.MachineConfig/properties/metrics,
        reference=OpenApiSchemaReference {
          ref=#/components/schemas/fly.MachineMetrics,
          name=fly.MachineMetrics,
          node={$ref: #/components/schemas/fly.MachineMetrics},
        },
        node={$ref: #/components/schemas/fly.MachineMetrics},
      }, mounts: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.MachineConfig/properties/mounts,
        component=OpenApiSchema {
          name=mounts,
          type=array,
          items=OpenApiComponentOrRef {
            ref=#/components/schemas/fly.MachineConfig/properties/mounts/items,
            reference=OpenApiSchemaReference {
              ref=#/components/schemas/fly.MachineMount,
              name=fly.MachineMount,
              node={$ref: #/components/schemas/fly.MachineMount},
            },
            node={$ref: #/components/schemas/fly.MachineMount},
          },
          ref=#/components/schemas/fly.MachineConfig/properties/mounts,
          node={type: array, items: {$ref: #/components/schemas/fly.MachineMount}},
        },
      }, processes: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.MachineConfig/properties/processes,
        component=OpenApiSchema {
          name=processes,
          type=array,
          items=OpenApiComponentOrRef {
            ref=#/components/schemas/fly.MachineConfig/properties/processes/items,
            reference=OpenApiSchemaReference {
              ref=#/components/schemas/fly.MachineProcess,
              name=fly.MachineProcess,
              node={$ref: #/components/schemas/fly.MachineProcess},
            },
            node={$ref: #/components/schemas/fly.MachineProcess},
          },
          ref=#/components/schemas/fly.MachineConfig/properties/processes,
          node={type: array, items: {$ref: #/components/schemas/fly.MachineProcess}},
        },
      }, restart: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.MachineConfig/properties/restart,
        reference=OpenApiSchemaReference {
          ref=#/components/schemas/fly.MachineRestart,
          name=fly.MachineRestart,
          node={$ref: #/components/schemas/fly.MachineRestart},
        },
        node={$ref: #/components/schemas/fly.MachineRestart},
      }, schedule: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.MachineConfig/properties/schedule,
        component=OpenApiSchema {
          name=schedule,
          type=string,
          ref=#/components/schemas/fly.MachineConfig/properties/schedule,
          node={type: string},
        },
      }, services: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.MachineConfig/properties/services,
        component=OpenApiSchema {
          name=services,
          type=array,
          items=OpenApiComponentOrRef {
            ref=#/components/schemas/fly.MachineConfig/properties/services/items,
            reference=OpenApiSchemaReference {
              ref=#/components/schemas/fly.MachineService,
              name=fly.MachineService,
              node={$ref: #/components/schemas/fly.MachineService},
            },
            node={$ref: #/components/schemas/fly.MachineService},
          },
          ref=#/components/schemas/fly.MachineConfig/properties/services,
          node={type: array, items: {$ref: #/components/schemas/fly.MachineService}},
        },
      }, size: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.MachineConfig/properties/size,
        component=OpenApiSchema {
          name=size,
          type=string,
          description=Deprecated: use Guest instead,
          ref=#/components/schemas/fly.MachineConfig/properties/size,
          node={type: string, description: Deprecated: use Guest instead},
        },
      }, standbys: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.MachineConfig/properties/standbys,
        component=OpenApiSchema {
          name=standbys,
          type=array,
          items=OpenApiComponentOrRef {
            ref=#/components/schemas/fly.MachineConfig/properties/standbys/items,
            component=OpenApiSchema {
              name=items,
              type=string,
              ref=#/components/schemas/fly.MachineConfig/properties/standbys/items,
              node={type: string},
            },
          },
          description=Standbys enable a machine to be a standby for another. In the event of a hardware failure,
the standby machine will be started.,
          ref=#/components/schemas/fly.MachineConfig/properties/standbys,
          node={type: array, description: Standbys enable a machine to be a standby for another. In the event of a hardware failure,
the standby machine will be started., items: {type: string}},
        },
      }, statics: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.MachineConfig/properties/statics,
        component=OpenApiSchema {
          name=statics,
          type=array,
          items=OpenApiComponentOrRef {
            ref=#/components/schemas/fly.MachineConfig/properties/statics/items,
            reference=OpenApiSchemaReference {
              ref=#/components/schemas/fly.Static,
              name=fly.Static,
              node={$ref: #/components/schemas/fly.Static},
            },
            node={$ref: #/components/schemas/fly.Static},
          },
          ref=#/components/schemas/fly.MachineConfig/properties/statics,
          node={type: array, items: {$ref: #/components/schemas/fly.Static}},
        },
      }, stop_config: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.MachineConfig/properties/stop_config,
        reference=OpenApiSchemaReference {
          ref=#/components/schemas/fly.StopConfig,
          name=fly.StopConfig,
          node={$ref: #/components/schemas/fly.StopConfig},
        },
        node={$ref: #/components/schemas/fly.StopConfig},
      }, volumes: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.MachineConfig/properties/volumes,
        component=OpenApiSchema {
          name=volumes,
          type=array,
          items=OpenApiComponentOrRef {
            ref=#/components/schemas/fly.MachineConfig/properties/volumes/items,
            reference=OpenApiSchemaReference {
              ref=#/components/schemas/fly.VolumeConfig,
              name=fly.VolumeConfig,
              node={$ref: #/components/schemas/fly.VolumeConfig},
            },
            node={$ref: #/components/schemas/fly.VolumeConfig},
          },
          description=Volumes describe the set of volumes that can be attached to the machine. Used in conjuction
with containers,
          ref=#/components/schemas/fly.MachineConfig/properties/volumes,
          node={type: array, description: Volumes describe the set of volumes that can be attached to the machine. Used in conjuction
with containers, items: {$ref: #/components/schemas/fly.VolumeConfig}},
        },
      }},
      ref=#/components/schemas/fly.MachineConfig,
      node={type: object, properties: {auto_destroy: {type: boolean, description: Optional boolean telling the Machine to destroy itself once it’s complete (default false)}, checks: {type: object, additionalProperties: {$ref: #/components/schemas/fly.MachineCheck}}, containers: {type: array, description: Containers are a list of containers that will run in the machine. Currently restricted to
only specific organizations., items: {$ref: #/components/schemas/fly.ContainerConfig}}, disable_machine_autostart: {type: boolean, description: Deprecated: use Service.Autostart instead}, dns: {$ref: #/components/schemas/fly.DNSConfig}, env: {type: object, additionalProperties: {type: string}, description: An object filled with key/value pairs to be set as environment variables}, files: {type: array, items: {$ref: #/components/schemas/fly.File}}, guest: {$ref: #/components/schemas/fly.MachineGuest}, image: {type: string, description: The docker image to run}, init: {$ref: #/components/schemas/fly.MachineInit}, metadata: {type: object, additionalProperties: {type: string}}, metrics: {$ref: #/components/schemas/fly.MachineMetrics}, mounts: {type: array, items: {$ref: #/components/schemas/fly.MachineMount}}, processes: {type: array, items: {$ref: #/components/schemas/fly.MachineProcess}}, restart: {$ref: #/components/schemas/fly.MachineRestart}, schedule: {type: string}, services: {type: array, items: {$ref: #/components/schemas/fly.MachineService}}, size: {type: string, description: Deprecated: use Guest instead}, standbys: {type: array, description: Standbys enable a machine to be a standby for another. In the event of a hardware failure,
the standby machine will be started., items: {type: string}}, statics: {type: array, items: {$ref: #/components/schemas/fly.Static}}, stop_config: {$ref: #/components/schemas/fly.StopConfig}, volumes: {type: array, description: Volumes describe the set of volumes that can be attached to the machine. Used in conjuction
with containers, items: {$ref: #/components/schemas/fly.VolumeConfig}}}},
    }, fly.MachineGuest: OpenApiSchema {
      name=fly.MachineGuest,
      type=object,
      properties={cpu_kind: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.MachineGuest/properties/cpu_kind,
        component=OpenApiSchema {
          name=cpu_kind,
          type=string,
          ref=#/components/schemas/fly.MachineGuest/properties/cpu_kind,
          node={type: string},
        },
      }, cpus: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.MachineGuest/properties/cpus,
        component=OpenApiSchema {
          name=cpus,
          type=integer,
          ref=#/components/schemas/fly.MachineGuest/properties/cpus,
          node={type: integer},
        },
      }, gpu_kind: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.MachineGuest/properties/gpu_kind,
        component=OpenApiSchema {
          name=gpu_kind,
          type=string,
          ref=#/components/schemas/fly.MachineGuest/properties/gpu_kind,
          node={type: string},
        },
      }, gpus: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.MachineGuest/properties/gpus,
        component=OpenApiSchema {
          name=gpus,
          type=integer,
          ref=#/components/schemas/fly.MachineGuest/properties/gpus,
          node={type: integer},
        },
      }, host_dedication_id: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.MachineGuest/properties/host_dedication_id,
        component=OpenApiSchema {
          name=host_dedication_id,
          type=string,
          ref=#/components/schemas/fly.MachineGuest/properties/host_dedication_id,
          node={type: string},
        },
      }, kernel_args: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.MachineGuest/properties/kernel_args,
        component=OpenApiSchema {
          name=kernel_args,
          type=array,
          items=OpenApiComponentOrRef {
            ref=#/components/schemas/fly.MachineGuest/properties/kernel_args/items,
            component=OpenApiSchema {
              name=items,
              type=string,
              ref=#/components/schemas/fly.MachineGuest/properties/kernel_args/items,
              node={type: string},
            },
          },
          ref=#/components/schemas/fly.MachineGuest/properties/kernel_args,
          node={type: array, items: {type: string}},
        },
      }, memory_mb: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.MachineGuest/properties/memory_mb,
        component=OpenApiSchema {
          name=memory_mb,
          type=integer,
          ref=#/components/schemas/fly.MachineGuest/properties/memory_mb,
          node={type: integer},
        },
      }},
      ref=#/components/schemas/fly.MachineGuest,
      node={type: object, properties: {cpu_kind: {type: string}, cpus: {type: integer}, gpu_kind: {type: string}, gpus: {type: integer}, host_dedication_id: {type: string}, kernel_args: {type: array, items: {type: string}}, memory_mb: {type: integer}}},
    }, fly.MachineHTTPHeader: OpenApiSchema {
      name=fly.MachineHTTPHeader,
      type=object,
      properties={name: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.MachineHTTPHeader/properties/name,
        component=OpenApiSchema {
          name=name,
          type=string,
          description=The header name,
          ref=#/components/schemas/fly.MachineHTTPHeader/properties/name,
          node={type: string, description: The header name},
        },
      }, values: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.MachineHTTPHeader/properties/values,
        component=OpenApiSchema {
          name=values,
          type=array,
          items=OpenApiComponentOrRef {
            ref=#/components/schemas/fly.MachineHTTPHeader/properties/values/items,
            component=OpenApiSchema {
              name=items,
              type=string,
              ref=#/components/schemas/fly.MachineHTTPHeader/properties/values/items,
              node={type: string},
            },
          },
          description=The header value,
          ref=#/components/schemas/fly.MachineHTTPHeader/properties/values,
          node={type: array, description: The header value, items: {type: string}},
        },
      }},
      description=For http checks, an array of objects with string field Name and array of strings field Values. The key/value pairs specify header and header values that will get passed with the check call.,
      ref=#/components/schemas/fly.MachineHTTPHeader,
      node={type: object, properties: {name: {type: string, description: The header name}, values: {type: array, description: The header value, items: {type: string}}}, description: For http checks, an array of objects with string field Name and array of strings field Values. The key/value pairs specify header and header values that will get passed with the check call.},
    }, fly.MachineInit: OpenApiSchema {
      name=fly.MachineInit,
      type=object,
      properties={cmd: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.MachineInit/properties/cmd,
        component=OpenApiSchema {
          name=cmd,
          type=array,
          items=OpenApiComponentOrRef {
            ref=#/components/schemas/fly.MachineInit/properties/cmd/items,
            component=OpenApiSchema {
              name=items,
              type=string,
              ref=#/components/schemas/fly.MachineInit/properties/cmd/items,
              node={type: string},
            },
          },
          ref=#/components/schemas/fly.MachineInit/properties/cmd,
          node={type: array, items: {type: string}},
        },
      }, entrypoint: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.MachineInit/properties/entrypoint,
        component=OpenApiSchema {
          name=entrypoint,
          type=array,
          items=OpenApiComponentOrRef {
            ref=#/components/schemas/fly.MachineInit/properties/entrypoint/items,
            component=OpenApiSchema {
              name=items,
              type=string,
              ref=#/components/schemas/fly.MachineInit/properties/entrypoint/items,
              node={type: string},
            },
          },
          ref=#/components/schemas/fly.MachineInit/properties/entrypoint,
          node={type: array, items: {type: string}},
        },
      }, exec: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.MachineInit/properties/exec,
        component=OpenApiSchema {
          name=exec,
          type=array,
          items=OpenApiComponentOrRef {
            ref=#/components/schemas/fly.MachineInit/properties/exec/items,
            component=OpenApiSchema {
              name=items,
              type=string,
              ref=#/components/schemas/fly.MachineInit/properties/exec/items,
              node={type: string},
            },
          },
          ref=#/components/schemas/fly.MachineInit/properties/exec,
          node={type: array, items: {type: string}},
        },
      }, kernel_args: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.MachineInit/properties/kernel_args,
        component=OpenApiSchema {
          name=kernel_args,
          type=array,
          items=OpenApiComponentOrRef {
            ref=#/components/schemas/fly.MachineInit/properties/kernel_args/items,
            component=OpenApiSchema {
              name=items,
              type=string,
              ref=#/components/schemas/fly.MachineInit/properties/kernel_args/items,
              node={type: string},
            },
          },
          ref=#/components/schemas/fly.MachineInit/properties/kernel_args,
          node={type: array, items: {type: string}},
        },
      }, swap_size_mb: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.MachineInit/properties/swap_size_mb,
        component=OpenApiSchema {
          name=swap_size_mb,
          type=integer,
          ref=#/components/schemas/fly.MachineInit/properties/swap_size_mb,
          node={type: integer},
        },
      }, tty: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.MachineInit/properties/tty,
        component=OpenApiSchema {
          name=tty,
          type=boolean,
          ref=#/components/schemas/fly.MachineInit/properties/tty,
          node={type: boolean},
        },
      }},
      ref=#/components/schemas/fly.MachineInit,
      node={type: object, properties: {cmd: {type: array, items: {type: string}}, entrypoint: {type: array, items: {type: string}}, exec: {type: array, items: {type: string}}, kernel_args: {type: array, items: {type: string}}, swap_size_mb: {type: integer}, tty: {type: boolean}}},
    }, fly.MachineMetrics: OpenApiSchema {
      name=fly.MachineMetrics,
      type=object,
      properties={https: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.MachineMetrics/properties/https,
        component=OpenApiSchema {
          name=https,
          type=boolean,
          ref=#/components/schemas/fly.MachineMetrics/properties/https,
          node={type: boolean},
        },
      }, path: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.MachineMetrics/properties/path,
        component=OpenApiSchema {
          name=path,
          type=string,
          ref=#/components/schemas/fly.MachineMetrics/properties/path,
          node={type: string},
        },
      }, port: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.MachineMetrics/properties/port,
        component=OpenApiSchema {
          name=port,
          type=integer,
          ref=#/components/schemas/fly.MachineMetrics/properties/port,
          node={type: integer},
        },
      }},
      ref=#/components/schemas/fly.MachineMetrics,
      node={type: object, properties: {https: {type: boolean}, path: {type: string}, port: {type: integer}}},
    }, fly.MachineMount: OpenApiSchema {
      name=fly.MachineMount,
      type=object,
      properties={add_size_gb: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.MachineMount/properties/add_size_gb,
        component=OpenApiSchema {
          name=add_size_gb,
          type=integer,
          ref=#/components/schemas/fly.MachineMount/properties/add_size_gb,
          node={type: integer},
        },
      }, encrypted: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.MachineMount/properties/encrypted,
        component=OpenApiSchema {
          name=encrypted,
          type=boolean,
          ref=#/components/schemas/fly.MachineMount/properties/encrypted,
          node={type: boolean},
        },
      }, extend_threshold_percent: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.MachineMount/properties/extend_threshold_percent,
        component=OpenApiSchema {
          name=extend_threshold_percent,
          type=integer,
          ref=#/components/schemas/fly.MachineMount/properties/extend_threshold_percent,
          node={type: integer},
        },
      }, name: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.MachineMount/properties/name,
        component=OpenApiSchema {
          name=name,
          type=string,
          ref=#/components/schemas/fly.MachineMount/properties/name,
          node={type: string},
        },
      }, path: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.MachineMount/properties/path,
        component=OpenApiSchema {
          name=path,
          type=string,
          ref=#/components/schemas/fly.MachineMount/properties/path,
          node={type: string},
        },
      }, size_gb: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.MachineMount/properties/size_gb,
        component=OpenApiSchema {
          name=size_gb,
          type=integer,
          ref=#/components/schemas/fly.MachineMount/properties/size_gb,
          node={type: integer},
        },
      }, size_gb_limit: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.MachineMount/properties/size_gb_limit,
        component=OpenApiSchema {
          name=size_gb_limit,
          type=integer,
          ref=#/components/schemas/fly.MachineMount/properties/size_gb_limit,
          node={type: integer},
        },
      }, volume: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.MachineMount/properties/volume,
        component=OpenApiSchema {
          name=volume,
          type=string,
          ref=#/components/schemas/fly.MachineMount/properties/volume,
          node={type: string},
        },
      }},
      ref=#/components/schemas/fly.MachineMount,
      node={type: object, properties: {add_size_gb: {type: integer}, encrypted: {type: boolean}, extend_threshold_percent: {type: integer}, name: {type: string}, path: {type: string}, size_gb: {type: integer}, size_gb_limit: {type: integer}, volume: {type: string}}},
    }, fly.MachinePort: OpenApiSchema {
      name=fly.MachinePort,
      type=object,
      properties={end_port: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.MachinePort/properties/end_port,
        component=OpenApiSchema {
          name=end_port,
          type=integer,
          ref=#/components/schemas/fly.MachinePort/properties/end_port,
          node={type: integer},
        },
      }, force_https: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.MachinePort/properties/force_https,
        component=OpenApiSchema {
          name=force_https,
          type=boolean,
          ref=#/components/schemas/fly.MachinePort/properties/force_https,
          node={type: boolean},
        },
      }, handlers: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.MachinePort/properties/handlers,
        component=OpenApiSchema {
          name=handlers,
          type=array,
          items=OpenApiComponentOrRef {
            ref=#/components/schemas/fly.MachinePort/properties/handlers/items,
            component=OpenApiSchema {
              name=items,
              type=string,
              ref=#/components/schemas/fly.MachinePort/properties/handlers/items,
              node={type: string},
            },
          },
          ref=#/components/schemas/fly.MachinePort/properties/handlers,
          node={type: array, items: {type: string}},
        },
      }, http_options: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.MachinePort/properties/http_options,
        reference=OpenApiSchemaReference {
          ref=#/components/schemas/fly.HTTPOptions,
          name=fly.HTTPOptions,
          node={$ref: #/components/schemas/fly.HTTPOptions},
        },
        node={$ref: #/components/schemas/fly.HTTPOptions},
      }, port: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.MachinePort/properties/port,
        component=OpenApiSchema {
          name=port,
          type=integer,
          ref=#/components/schemas/fly.MachinePort/properties/port,
          node={type: integer},
        },
      }, proxy_proto_options: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.MachinePort/properties/proxy_proto_options,
        reference=OpenApiSchemaReference {
          ref=#/components/schemas/fly.ProxyProtoOptions,
          name=fly.ProxyProtoOptions,
          node={$ref: #/components/schemas/fly.ProxyProtoOptions},
        },
        node={$ref: #/components/schemas/fly.ProxyProtoOptions},
      }, start_port: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.MachinePort/properties/start_port,
        component=OpenApiSchema {
          name=start_port,
          type=integer,
          ref=#/components/schemas/fly.MachinePort/properties/start_port,
          node={type: integer},
        },
      }, tls_options: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.MachinePort/properties/tls_options,
        reference=OpenApiSchemaReference {
          ref=#/components/schemas/fly.TLSOptions,
          name=fly.TLSOptions,
          node={$ref: #/components/schemas/fly.TLSOptions},
        },
        node={$ref: #/components/schemas/fly.TLSOptions},
      }},
      ref=#/components/schemas/fly.MachinePort,
      node={type: object, properties: {end_port: {type: integer}, force_https: {type: boolean}, handlers: {type: array, items: {type: string}}, http_options: {$ref: #/components/schemas/fly.HTTPOptions}, port: {type: integer}, proxy_proto_options: {$ref: #/components/schemas/fly.ProxyProtoOptions}, start_port: {type: integer}, tls_options: {$ref: #/components/schemas/fly.TLSOptions}}},
    }, fly.MachineProcess: OpenApiSchema {
      name=fly.MachineProcess,
      type=object,
      properties={cmd: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.MachineProcess/properties/cmd,
        component=OpenApiSchema {
          name=cmd,
          type=array,
          items=OpenApiComponentOrRef {
            ref=#/components/schemas/fly.MachineProcess/properties/cmd/items,
            component=OpenApiSchema {
              name=items,
              type=string,
              ref=#/components/schemas/fly.MachineProcess/properties/cmd/items,
              node={type: string},
            },
          },
          ref=#/components/schemas/fly.MachineProcess/properties/cmd,
          node={type: array, items: {type: string}},
        },
      }, entrypoint: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.MachineProcess/properties/entrypoint,
        component=OpenApiSchema {
          name=entrypoint,
          type=array,
          items=OpenApiComponentOrRef {
            ref=#/components/schemas/fly.MachineProcess/properties/entrypoint/items,
            component=OpenApiSchema {
              name=items,
              type=string,
              ref=#/components/schemas/fly.MachineProcess/properties/entrypoint/items,
              node={type: string},
            },
          },
          ref=#/components/schemas/fly.MachineProcess/properties/entrypoint,
          node={type: array, items: {type: string}},
        },
      }, env: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.MachineProcess/properties/env,
        component=OpenApiSchema {
          name=env,
          type=object,
          additionalProperties=OpenApiAdditionalProperties {
            schema=OpenApiComponentOrRef {
              ref=#/components/schemas/fly.MachineProcess/properties/env/additionalProperties,
              component=OpenApiSchema {
                name=additionalProperties,
                type=string,
                ref=#/components/schemas/fly.MachineProcess/properties/env/additionalProperties,
                node={type: string},
              },
            },
          },
          ref=#/components/schemas/fly.MachineProcess/properties/env,
          node={type: object, additionalProperties: {type: string}},
        },
      }, env_from: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.MachineProcess/properties/env_from,
        component=OpenApiSchema {
          name=env_from,
          type=array,
          items=OpenApiComponentOrRef {
            ref=#/components/schemas/fly.MachineProcess/properties/env_from/items,
            reference=OpenApiSchemaReference {
              ref=#/components/schemas/fly.EnvFrom,
              name=fly.EnvFrom,
              node={$ref: #/components/schemas/fly.EnvFrom},
            },
            node={$ref: #/components/schemas/fly.EnvFrom},
          },
          description=EnvFrom can be provided to set environment variables from machine fields.,
          ref=#/components/schemas/fly.MachineProcess/properties/env_from,
          node={type: array, description: EnvFrom can be provided to set environment variables from machine fields., items: {$ref: #/components/schemas/fly.EnvFrom}},
        },
      }, exec: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.MachineProcess/properties/exec,
        component=OpenApiSchema {
          name=exec,
          type=array,
          items=OpenApiComponentOrRef {
            ref=#/components/schemas/fly.MachineProcess/properties/exec/items,
            component=OpenApiSchema {
              name=items,
              type=string,
              ref=#/components/schemas/fly.MachineProcess/properties/exec/items,
              node={type: string},
            },
          },
          ref=#/components/schemas/fly.MachineProcess/properties/exec,
          node={type: array, items: {type: string}},
        },
      }, ignore_app_secrets: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.MachineProcess/properties/ignore_app_secrets,
        component=OpenApiSchema {
          name=ignore_app_secrets,
          type=boolean,
          description=IgnoreAppSecrets can be set to true to ignore the secrets for the App the Machine belongs to
and only use the secrets provided at the process level. The default/legacy behavior is to use
the secrets provided at the App level.,
          ref=#/components/schemas/fly.MachineProcess/properties/ignore_app_secrets,
          node={type: boolean, description: IgnoreAppSecrets can be set to true to ignore the secrets for the App the Machine belongs to
and only use the secrets provided at the process level. The default/legacy behavior is to use
the secrets provided at the App level.},
        },
      }, secrets: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.MachineProcess/properties/secrets,
        component=OpenApiSchema {
          name=secrets,
          type=array,
          items=OpenApiComponentOrRef {
            ref=#/components/schemas/fly.MachineProcess/properties/secrets/items,
            reference=OpenApiSchemaReference {
              ref=#/components/schemas/fly.MachineSecret,
              name=fly.MachineSecret,
              node={$ref: #/components/schemas/fly.MachineSecret},
            },
            node={$ref: #/components/schemas/fly.MachineSecret},
          },
          description=Secrets can be provided at the process level to explicitly indicate which secrets should be
used for the process. If not provided, the secrets provided at the machine level will be used.,
          ref=#/components/schemas/fly.MachineProcess/properties/secrets,
          node={type: array, description: Secrets can be provided at the process level to explicitly indicate which secrets should be
used for the process. If not provided, the secrets provided at the machine level will be used., items: {$ref: #/components/schemas/fly.MachineSecret}},
        },
      }, user: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.MachineProcess/properties/user,
        component=OpenApiSchema {
          name=user,
          type=string,
          ref=#/components/schemas/fly.MachineProcess/properties/user,
          node={type: string},
        },
      }},
      ref=#/components/schemas/fly.MachineProcess,
      node={type: object, properties: {cmd: {type: array, items: {type: string}}, entrypoint: {type: array, items: {type: string}}, env: {type: object, additionalProperties: {type: string}}, env_from: {type: array, description: EnvFrom can be provided to set environment variables from machine fields., items: {$ref: #/components/schemas/fly.EnvFrom}}, exec: {type: array, items: {type: string}}, ignore_app_secrets: {type: boolean, description: IgnoreAppSecrets can be set to true to ignore the secrets for the App the Machine belongs to
and only use the secrets provided at the process level. The default/legacy behavior is to use
the secrets provided at the App level.}, secrets: {type: array, description: Secrets can be provided at the process level to explicitly indicate which secrets should be
used for the process. If not provided, the secrets provided at the machine level will be used., items: {$ref: #/components/schemas/fly.MachineSecret}}, user: {type: string}}},
    }, fly.MachineRestart: OpenApiSchema {
      name=fly.MachineRestart,
      type=object,
      properties={gpu_bid_price: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.MachineRestart/properties/gpu_bid_price,
        component=OpenApiSchema {
          name=gpu_bid_price,
          type=number,
          description=GPU bid price for spot Machines.,
          ref=#/components/schemas/fly.MachineRestart/properties/gpu_bid_price,
          node={type: number, description: GPU bid price for spot Machines.},
        },
      }, max_retries: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.MachineRestart/properties/max_retries,
        component=OpenApiSchema {
          name=max_retries,
          type=integer,
          description=When policy is on-failure, the maximum number of times to attempt to restart the Machine before letting it stop.,
          ref=#/components/schemas/fly.MachineRestart/properties/max_retries,
          node={type: integer, description: When policy is on-failure, the maximum number of times to attempt to restart the Machine before letting it stop.},
        },
      }, policy: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.MachineRestart/properties/policy,
        component=OpenApiSchema {
          name=policy,
          type=string,
          enumValues={no, always, on-failure, spot-price},
          description=* no - Never try to restart a Machine automatically when its main process exits, whether that’s on purpose or on a crash.
* always - Always restart a Machine automatically and never let it enter a stopped state, even when the main process exits cleanly.
* on-failure - Try up to MaxRetries times to automatically restart the Machine if it exits with a non-zero exit code. Default when no explicit policy is set, and for Machines with schedules.
* spot-price - Starts the Machine only when there is capacity and the spot price is less than or equal to the bid price.,
          ref=#/components/schemas/fly.MachineRestart/properties/policy,
          node={type: string, description: * no - Never try to restart a Machine automatically when its main process exits, whether that’s on purpose or on a crash.
* always - Always restart a Machine automatically and never let it enter a stopped state, even when the main process exits cleanly.
* on-failure - Try up to MaxRetries times to automatically restart the Machine if it exits with a non-zero exit code. Default when no explicit policy is set, and for Machines with schedules.
* spot-price - Starts the Machine only when there is capacity and the spot price is less than or equal to the bid price., enum: [no, always, on-failure, spot-price]},
        },
      }},
      description=The Machine restart policy defines whether and how flyd restarts a Machine after its main process exits. See https://fly.io/docs/machines/guides-examples/machine-restart-policy/.,
      ref=#/components/schemas/fly.MachineRestart,
      node={type: object, properties: {gpu_bid_price: {type: number, description: GPU bid price for spot Machines.}, max_retries: {type: integer, description: When policy is on-failure, the maximum number of times to attempt to restart the Machine before letting it stop.}, policy: {type: string, description: * no - Never try to restart a Machine automatically when its main process exits, whether that’s on purpose or on a crash.
* always - Always restart a Machine automatically and never let it enter a stopped state, even when the main process exits cleanly.
* on-failure - Try up to MaxRetries times to automatically restart the Machine if it exits with a non-zero exit code. Default when no explicit policy is set, and for Machines with schedules.
* spot-price - Starts the Machine only when there is capacity and the spot price is less than or equal to the bid price., enum: [no, always, on-failure, spot-price]}}, description: The Machine restart policy defines whether and how flyd restarts a Machine after its main process exits. See https://fly.io/docs/machines/guides-examples/machine-restart-policy/.},
    }, fly.MachineSecret: OpenApiSchema {
      name=fly.MachineSecret,
      type=object,
      properties={env_var: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.MachineSecret/properties/env_var,
        component=OpenApiSchema {
          name=env_var,
          type=string,
          description=EnvVar is required and is the name of the environment variable that will be set from the
secret. It must be a valid environment variable name.,
          ref=#/components/schemas/fly.MachineSecret/properties/env_var,
          node={type: string, description: EnvVar is required and is the name of the environment variable that will be set from the
secret. It must be a valid environment variable name.},
        },
      }, name: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.MachineSecret/properties/name,
        component=OpenApiSchema {
          name=name,
          type=string,
          description=Name is optional and when provided is used to reference a secret name where the EnvVar is
different from what was set as the secret name.,
          ref=#/components/schemas/fly.MachineSecret/properties/name,
          node={type: string, description: Name is optional and when provided is used to reference a secret name where the EnvVar is
different from what was set as the secret name.},
        },
      }},
      description=A Secret needing to be set in the environment of the Machine. env_var is required,
      ref=#/components/schemas/fly.MachineSecret,
      node={type: object, properties: {env_var: {type: string, description: EnvVar is required and is the name of the environment variable that will be set from the
secret. It must be a valid environment variable name.}, name: {type: string, description: Name is optional and when provided is used to reference a secret name where the EnvVar is
different from what was set as the secret name.}}, description: A Secret needing to be set in the environment of the Machine. env_var is required},
    }, fly.MachineService: OpenApiSchema {
      name=fly.MachineService,
      type=object,
      properties={autostart: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.MachineService/properties/autostart,
        component=OpenApiSchema {
          name=autostart,
          type=boolean,
          ref=#/components/schemas/fly.MachineService/properties/autostart,
          node={type: boolean},
        },
      }, autostop: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.MachineService/properties/autostop,
        component=OpenApiSchema {
          name=autostop,
          type=string,
          enumValues={off, stop, suspend},
          description=Accepts a string (new format) or a boolean (old format). For backward compatibility with older clients, the API continues to use booleans for "off" and "stop" in responses.
* "off" or false - Do not autostop the Machine.
* "stop" or true - Automatically stop the Machine.
* "suspend" - Automatically suspend the Machine, falling back to a full stop if this is not possible.,
          ref=#/components/schemas/fly.MachineService/properties/autostop,
          node={type: string, description: Accepts a string (new format) or a boolean (old format). For backward compatibility with older clients, the API continues to use booleans for "off" and "stop" in responses.
* "off" or false - Do not autostop the Machine.
* "stop" or true - Automatically stop the Machine.
* "suspend" - Automatically suspend the Machine, falling back to a full stop if this is not possible., enum: [off, stop, suspend]},
        },
      }, checks: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.MachineService/properties/checks,
        component=OpenApiSchema {
          name=checks,
          type=array,
          items=OpenApiComponentOrRef {
            ref=#/components/schemas/fly.MachineService/properties/checks/items,
            reference=OpenApiSchemaReference {
              ref=#/components/schemas/fly.MachineCheck,
              name=fly.MachineCheck,
              node={$ref: #/components/schemas/fly.MachineCheck},
            },
            node={$ref: #/components/schemas/fly.MachineCheck},
          },
          ref=#/components/schemas/fly.MachineService/properties/checks,
          node={type: array, items: {$ref: #/components/schemas/fly.MachineCheck}},
        },
      }, concurrency: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.MachineService/properties/concurrency,
        reference=OpenApiSchemaReference {
          ref=#/components/schemas/fly.MachineServiceConcurrency,
          name=fly.MachineServiceConcurrency,
          node={$ref: #/components/schemas/fly.MachineServiceConcurrency},
        },
        node={$ref: #/components/schemas/fly.MachineServiceConcurrency},
      }, force_instance_description: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.MachineService/properties/force_instance_description,
        component=OpenApiSchema {
          name=force_instance_description,
          type=string,
          ref=#/components/schemas/fly.MachineService/properties/force_instance_description,
          node={type: string},
        },
      }, force_instance_key: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.MachineService/properties/force_instance_key,
        component=OpenApiSchema {
          name=force_instance_key,
          type=string,
          ref=#/components/schemas/fly.MachineService/properties/force_instance_key,
          node={type: string},
        },
      }, internal_port: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.MachineService/properties/internal_port,
        component=OpenApiSchema {
          name=internal_port,
          type=integer,
          ref=#/components/schemas/fly.MachineService/properties/internal_port,
          node={type: integer},
        },
      }, min_machines_running: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.MachineService/properties/min_machines_running,
        component=OpenApiSchema {
          name=min_machines_running,
          type=integer,
          ref=#/components/schemas/fly.MachineService/properties/min_machines_running,
          node={type: integer},
        },
      }, ports: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.MachineService/properties/ports,
        component=OpenApiSchema {
          name=ports,
          type=array,
          items=OpenApiComponentOrRef {
            ref=#/components/schemas/fly.MachineService/properties/ports/items,
            reference=OpenApiSchemaReference {
              ref=#/components/schemas/fly.MachinePort,
              name=fly.MachinePort,
              node={$ref: #/components/schemas/fly.MachinePort},
            },
            node={$ref: #/components/schemas/fly.MachinePort},
          },
          ref=#/components/schemas/fly.MachineService/properties/ports,
          node={type: array, items: {$ref: #/components/schemas/fly.MachinePort}},
        },
      }, protocol: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.MachineService/properties/protocol,
        component=OpenApiSchema {
          name=protocol,
          type=string,
          ref=#/components/schemas/fly.MachineService/properties/protocol,
          node={type: string},
        },
      }},
      ref=#/components/schemas/fly.MachineService,
      node={type: object, properties: {autostart: {type: boolean}, autostop: {type: string, description: Accepts a string (new format) or a boolean (old format). For backward compatibility with older clients, the API continues to use booleans for "off" and "stop" in responses.
* "off" or false - Do not autostop the Machine.
* "stop" or true - Automatically stop the Machine.
* "suspend" - Automatically suspend the Machine, falling back to a full stop if this is not possible., enum: [off, stop, suspend]}, checks: {type: array, items: {$ref: #/components/schemas/fly.MachineCheck}}, concurrency: {$ref: #/components/schemas/fly.MachineServiceConcurrency}, force_instance_description: {type: string}, force_instance_key: {type: string}, internal_port: {type: integer}, min_machines_running: {type: integer}, ports: {type: array, items: {$ref: #/components/schemas/fly.MachinePort}}, protocol: {type: string}}},
    }, fly.MachineServiceConcurrency: OpenApiSchema {
      name=fly.MachineServiceConcurrency,
      type=object,
      properties={hard_limit: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.MachineServiceConcurrency/properties/hard_limit,
        component=OpenApiSchema {
          name=hard_limit,
          type=integer,
          ref=#/components/schemas/fly.MachineServiceConcurrency/properties/hard_limit,
          node={type: integer},
        },
      }, soft_limit: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.MachineServiceConcurrency/properties/soft_limit,
        component=OpenApiSchema {
          name=soft_limit,
          type=integer,
          ref=#/components/schemas/fly.MachineServiceConcurrency/properties/soft_limit,
          node={type: integer},
        },
      }, type: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.MachineServiceConcurrency/properties/type,
        component=OpenApiSchema {
          name=type,
          type=string,
          ref=#/components/schemas/fly.MachineServiceConcurrency/properties/type,
          node={type: string},
        },
      }},
      ref=#/components/schemas/fly.MachineServiceConcurrency,
      node={type: object, properties: {hard_limit: {type: integer}, soft_limit: {type: integer}, type: {type: string}}},
    }, fly.ProxyProtoOptions: OpenApiSchema {
      name=fly.ProxyProtoOptions,
      type=object,
      properties={version: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.ProxyProtoOptions/properties/version,
        component=OpenApiSchema {
          name=version,
          type=string,
          ref=#/components/schemas/fly.ProxyProtoOptions/properties/version,
          node={type: string},
        },
      }},
      ref=#/components/schemas/fly.ProxyProtoOptions,
      node={type: object, properties: {version: {type: string}}},
    }, fly.Static: OpenApiSchema {
      name=fly.Static,
      type=object,
      properties={guest_path: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.Static/properties/guest_path,
        component=OpenApiSchema {
          name=guest_path,
          type=string,
          ref=#/components/schemas/fly.Static/properties/guest_path,
          node={type: string},
        },
      }, index_document: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.Static/properties/index_document,
        component=OpenApiSchema {
          name=index_document,
          type=string,
          ref=#/components/schemas/fly.Static/properties/index_document,
          node={type: string},
        },
      }, tigris_bucket: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.Static/properties/tigris_bucket,
        component=OpenApiSchema {
          name=tigris_bucket,
          type=string,
          ref=#/components/schemas/fly.Static/properties/tigris_bucket,
          node={type: string},
        },
      }, url_prefix: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.Static/properties/url_prefix,
        component=OpenApiSchema {
          name=url_prefix,
          type=string,
          ref=#/components/schemas/fly.Static/properties/url_prefix,
          node={type: string},
        },
      }},
      required={guest_path, url_prefix},
      ref=#/components/schemas/fly.Static,
      node={required: [guest_path, url_prefix], type: object, properties: {guest_path: {type: string}, index_document: {type: string}, tigris_bucket: {type: string}, url_prefix: {type: string}}},
    }, fly.StopConfig: OpenApiSchema {
      name=fly.StopConfig,
      type=object,
      properties={signal: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.StopConfig/properties/signal,
        component=OpenApiSchema {
          name=signal,
          type=string,
          ref=#/components/schemas/fly.StopConfig/properties/signal,
          node={type: string},
        },
      }, timeout: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.StopConfig/properties/timeout,
        reference=OpenApiSchemaReference {
          ref=#/components/schemas/fly.Duration,
          name=fly.Duration,
          node={$ref: #/components/schemas/fly.Duration},
        },
        node={$ref: #/components/schemas/fly.Duration},
      }},
      ref=#/components/schemas/fly.StopConfig,
      node={type: object, properties: {signal: {type: string}, timeout: {$ref: #/components/schemas/fly.Duration}}},
    }, fly.TCPHealthcheck: OpenApiSchema {
      name=fly.TCPHealthcheck,
      type=object,
      properties={port: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.TCPHealthcheck/properties/port,
        component=OpenApiSchema {
          name=port,
          type=integer,
          description=The port to connect to, often the same as internal_port,
          ref=#/components/schemas/fly.TCPHealthcheck/properties/port,
          node={type: integer, description: The port to connect to, often the same as internal_port},
        },
      }},
      ref=#/components/schemas/fly.TCPHealthcheck,
      node={type: object, properties: {port: {type: integer, description: The port to connect to, often the same as internal_port}}},
    }, fly.TLSOptions: OpenApiSchema {
      name=fly.TLSOptions,
      type=object,
      properties={alpn: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.TLSOptions/properties/alpn,
        component=OpenApiSchema {
          name=alpn,
          type=array,
          items=OpenApiComponentOrRef {
            ref=#/components/schemas/fly.TLSOptions/properties/alpn/items,
            component=OpenApiSchema {
              name=items,
              type=string,
              ref=#/components/schemas/fly.TLSOptions/properties/alpn/items,
              node={type: string},
            },
          },
          ref=#/components/schemas/fly.TLSOptions/properties/alpn,
          node={type: array, items: {type: string}},
        },
      }, default_self_signed: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.TLSOptions/properties/default_self_signed,
        component=OpenApiSchema {
          name=default_self_signed,
          type=boolean,
          ref=#/components/schemas/fly.TLSOptions/properties/default_self_signed,
          node={type: boolean},
        },
      }, versions: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.TLSOptions/properties/versions,
        component=OpenApiSchema {
          name=versions,
          type=array,
          items=OpenApiComponentOrRef {
            ref=#/components/schemas/fly.TLSOptions/properties/versions/items,
            component=OpenApiSchema {
              name=items,
              type=string,
              ref=#/components/schemas/fly.TLSOptions/properties/versions/items,
              node={type: string},
            },
          },
          ref=#/components/schemas/fly.TLSOptions/properties/versions,
          node={type: array, items: {type: string}},
        },
      }},
      ref=#/components/schemas/fly.TLSOptions,
      node={type: object, properties: {alpn: {type: array, items: {type: string}}, default_self_signed: {type: boolean}, versions: {type: array, items: {type: string}}}},
    }, fly.TempDirVolume: OpenApiSchema {
      name=fly.TempDirVolume,
      type=object,
      properties={size_mb: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.TempDirVolume/properties/size_mb,
        component=OpenApiSchema {
          name=size_mb,
          type=integer,
          description=The size limit of the temp dir, only applicable when using disk backed storage.,
          ref=#/components/schemas/fly.TempDirVolume/properties/size_mb,
          node={type: integer, description: The size limit of the temp dir, only applicable when using disk backed storage.},
        },
      }, storage_type: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.TempDirVolume/properties/storage_type,
        component=OpenApiSchema {
          name=storage_type,
          type=string,
          description=The type of storage used to back the temp dir. Either disk or memory.,
          ref=#/components/schemas/fly.TempDirVolume/properties/storage_type,
          node={type: string, description: The type of storage used to back the temp dir. Either disk or memory.},
        },
      }},
      ref=#/components/schemas/fly.TempDirVolume,
      node={type: object, properties: {size_mb: {type: integer, description: The size limit of the temp dir, only applicable when using disk backed storage.}, storage_type: {type: string, description: The type of storage used to back the temp dir. Either disk or memory.}}},
    }, fly.UnhealthyPolicy: OpenApiSchema {
      name=fly.UnhealthyPolicy,
      type=string,
      enumValues={stop},
      ref=#/components/schemas/fly.UnhealthyPolicy,
      node={type: string, enum: [stop], x-enum-varnames: [UnhealthyPolicyStop]},
      extensions={x-enum-varnames: [UnhealthyPolicyStop]},
    }, fly.VolumeConfig: OpenApiSchema {
      name=fly.VolumeConfig,
      type=object,
      properties={name: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.VolumeConfig/properties/name,
        component=OpenApiSchema {
          name=name,
          type=string,
          description=The name of the volume. A volume must have a unique name within an app,
          ref=#/components/schemas/fly.VolumeConfig/properties/name,
          node={type: string, description: The name of the volume. A volume must have a unique name within an app},
        },
      }, temp_dir: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.VolumeConfig/properties/temp_dir,
        reference=OpenApiSchemaReference {
          ref=#/components/schemas/fly.TempDirVolume,
          name=fly.TempDirVolume,
          node={$ref: #/components/schemas/fly.TempDirVolume},
        },
        node={$ref: #/components/schemas/fly.TempDirVolume},
      }},
      ref=#/components/schemas/fly.VolumeConfig,
      node={type: object, properties: {name: {type: string, description: The name of the volume. A volume must have a unique name within an app}, temp_dir: {$ref: #/components/schemas/fly.TempDirVolume}}},
    }, fly.dnsForwardRule: OpenApiSchema {
      name=fly.dnsForwardRule,
      type=object,
      properties={addr: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.dnsForwardRule/properties/addr,
        component=OpenApiSchema {
          name=addr,
          type=string,
          ref=#/components/schemas/fly.dnsForwardRule/properties/addr,
          node={type: string},
        },
      }, basename: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.dnsForwardRule/properties/basename,
        component=OpenApiSchema {
          name=basename,
          type=string,
          ref=#/components/schemas/fly.dnsForwardRule/properties/basename,
          node={type: string},
        },
      }},
      ref=#/components/schemas/fly.dnsForwardRule,
      node={type: object, properties: {addr: {type: string}, basename: {type: string}}},
    }, fly.dnsOption: OpenApiSchema {
      name=fly.dnsOption,
      type=object,
      properties={name: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.dnsOption/properties/name,
        component=OpenApiSchema {
          name=name,
          type=string,
          ref=#/components/schemas/fly.dnsOption/properties/name,
          node={type: string},
        },
      }, value: OpenApiComponentOrRef {
        ref=#/components/schemas/fly.dnsOption/properties/value,
        component=OpenApiSchema {
          name=value,
          type=string,
          ref=#/components/schemas/fly.dnsOption/properties/value,
          node={type: string},
        },
      }},
      ref=#/components/schemas/fly.dnsOption,
      node={type: object, properties: {name: {type: string}, value: {type: string}}},
    }, flydv1.ExecResponse: OpenApiSchema {
      name=flydv1.ExecResponse,
      type=object,
      properties={exit_code: OpenApiComponentOrRef {
        ref=#/components/schemas/flydv1.ExecResponse/properties/exit_code,
        component=OpenApiSchema {
          name=exit_code,
          type=integer,
          ref=#/components/schemas/flydv1.ExecResponse/properties/exit_code,
          node={type: integer},
        },
      }, exit_signal: OpenApiComponentOrRef {
        ref=#/components/schemas/flydv1.ExecResponse/properties/exit_signal,
        component=OpenApiSchema {
          name=exit_signal,
          type=integer,
          ref=#/components/schemas/flydv1.ExecResponse/properties/exit_signal,
          node={type: integer},
        },
      }, stderr: OpenApiComponentOrRef {
        ref=#/components/schemas/flydv1.ExecResponse/properties/stderr,
        component=OpenApiSchema {
          name=stderr,
          type=string,
          ref=#/components/schemas/flydv1.ExecResponse/properties/stderr,
          node={type: string},
        },
      }, stdout: OpenApiComponentOrRef {
        ref=#/components/schemas/flydv1.ExecResponse/properties/stdout,
        component=OpenApiSchema {
          name=stdout,
          type=string,
          ref=#/components/schemas/flydv1.ExecResponse/properties/stdout,
          node={type: string},
        },
      }},
      ref=#/components/schemas/flydv1.ExecResponse,
      node={type: object, properties: {exit_code: {type: integer}, exit_signal: {type: integer}, stderr: {type: string}, stdout: {type: string}}},
    }, main.statusCode: OpenApiSchema {
      name=main.statusCode,
      type=string,
      enumValues={unknown, insufficient_capacity},
      ref=#/components/schemas/main.statusCode,
      node={type: string, enum: [unknown, insufficient_capacity], x-enum-varnames: [unknown, capacityErr]},
      extensions={x-enum-varnames: [unknown, capacityErr]},
    }},
    responses={},
    parameters={},
    requestBodies={},
    headers={},
    securitySchemes={},
    paths={},
    ref=#/components,
    node={schemas: {App: {type: object, properties: {id: {type: string}, name: {type: string}, organization: {$ref: #/components/schemas/Organization}, status: {type: string}}}, CheckStatus: {type: object, properties: {name: {type: string}, output: {type: string}, status: {type: string}, updated_at: {type: string}}}, CreateAppRequest: {type: object, properties: {app_name: {type: string}, enable_subdomains: {type: boolean}, network: {type: string}, org_slug: {type: string}}}, CreateLeaseRequest: {type: object, properties: {description: {type: string}, ttl: {type: integer, description: seconds lease will be valid}}}, CreateMachineRequest: {type: object, properties: {config: {type: object, description: An object defining the Machine configuration, allOf: [{$ref: #/components/schemas/fly.MachineConfig}]}, lease_ttl: {type: integer}, lsvd: {type: boolean}, name: {type: string, description: Unique name for this Machine. If omitted, one is generated for you}, region: {type: string, description: The target region. Omitting this param launches in the same region as your WireGuard peer connection (somewhere near you).}, skip_launch: {type: boolean}, skip_service_registration: {type: boolean}}}, CreateOIDCTokenRequest: {type: object, properties: {aud: {type: string, example: https://fly.io/org-slug}, aws_principal_tags: {type: boolean}}, description: Optional parameters}, CreateSecretRequest: {type: object, properties: {value: {type: array, items: {type: integer}}}}, CreateVolumeRequest: {type: object, properties: {compute: {$ref: #/components/schemas/fly.MachineGuest}, compute_image: {type: string}, encrypted: {type: boolean}, fstype: {type: string}, name: {type: string}, region: {type: string}, require_unique_zone: {type: boolean}, size_gb: {type: integer}, snapshot_id: {type: string, description: restore from snapshot}, snapshot_retention: {type: integer}, source_volume_id: {type: string, description: fork from remote volume}, unique_zone_app_wide: {type: boolean}}}, ErrorResponse: {type: object, properties: {details: {type: object, description: Deprecated}, error: {type: string}, status: {$ref: #/components/schemas/main.statusCode}}}, ExtendVolumeRequest: {type: object, properties: {size_gb: {type: integer}}}, ExtendVolumeResponse: {type: object, properties: {needs_restart: {type: boolean}, volume: {$ref: #/components/schemas/Volume}}}, ImageRef: {type: object, properties: {digest: {type: string}, labels: {type: object, additionalProperties: {type: string}}, registry: {type: string}, repository: {type: string}, tag: {type: string}}}, Lease: {type: object, properties: {description: {type: string, description: Description or reason for the Lease.}, expires_at: {type: integer, description: ExpiresAt is the unix timestamp in UTC to denote when the Lease will no longer be valid.}, nonce: {type: string, description: Nonce is the unique ID autogenerated and associated with the Lease.}, owner: {type: string, description: Owner is the user identifier which acquired the Lease.}, version: {type: string, description: Machine version}}}, ListApp: {type: object, properties: {id: {type: string}, machine_count: {type: integer}, name: {type: string}, network: {type: object}}}, ListAppsResponse: {type: object, properties: {apps: {type: array, items: {$ref: #/components/schemas/ListApp}}, total_apps: {type: integer}}}, ListSecret: {type: object, properties: {label: {type: string}, publickey: {type: array, items: {type: integer}}, type: {type: string}}}, ListenSocket: {type: object, properties: {address: {type: string}, proto: {type: string}}}, Machine: {type: object, properties: {checks: {type: array, items: {$ref: #/components/schemas/CheckStatus}}, config: {$ref: #/components/schemas/fly.MachineConfig}, created_at: {type: string}, events: {type: array, items: {$ref: #/components/schemas/MachineEvent}}, host_status: {type: string, enum: [ok, unknown, unreachable]}, id: {type: string}, image_ref: {$ref: #/components/schemas/ImageRef}, incomplete_config: {$ref: #/components/schemas/fly.MachineConfig}, instance_id: {type: string, description: InstanceID is unique for each version of the machine}, name: {type: string}, nonce: {type: string, description: Nonce is only every returned on machine creation if a lease_duration was provided.}, private_ip: {type: string, description: PrivateIP is the internal 6PN address of the machine.}, region: {type: string}, state: {type: string}, updated_at: {type: string}}}, MachineEvent: {type: object, properties: {id: {type: string}, request: {type: object}, source: {type: string}, status: {type: string}, timestamp: {type: integer}, type: {type: string}}}, MachineExecRequest: {type: object, properties: {cmd: {type: string, description: Deprecated: use Command instead}, command: {type: array, items: {type: string}}, container: {type: string}, stdin: {type: string}, timeout: {type: integer}}}, MachineVersion: {type: object, properties: {user_config: {$ref: #/components/schemas/fly.MachineConfig}, version: {type: string}}}, Organization: {type: object, properties: {name: {type: string}, slug: {type: string}}}, ProcessStat: {type: object, properties: {command: {type: string}, cpu: {type: integer}, directory: {type: string}, listen_sockets: {type: array, items: {$ref: #/components/schemas/ListenSocket}}, pid: {type: integer}, rss: {type: integer}, rtime: {type: integer}, stime: {type: integer}}}, SignalRequest: {type: object, properties: {signal: {type: string, enum: [SIGABRT, SIGALRM, SIGFPE, SIGHUP, SIGILL, SIGINT, SIGKILL, SIGPIPE, SIGQUIT, SIGSEGV, SIGTERM, SIGTRAP, SIGUSR1]}}}, StopRequest: {type: object, properties: {signal: {type: string}, timeout: {$ref: #/components/schemas/fly.Duration}}}, UpdateMachineRequest: {type: object, properties: {config: {type: object, description: An object defining the Machine configuration, allOf: [{$ref: #/components/schemas/fly.MachineConfig}]}, current_version: {type: string}, lease_ttl: {type: integer}, lsvd: {type: boolean}, name: {type: string, description: Unique name for this Machine. If omitted, one is generated for you}, region: {type: string, description: The target region. Omitting this param launches in the same region as your WireGuard peer connection (somewhere near you).}, skip_launch: {type: boolean}, skip_service_registration: {type: boolean}}}, UpdateVolumeRequest: {type: object, properties: {auto_backup_enabled: {type: boolean}, snapshot_retention: {type: integer}}}, Volume: {type: object, properties: {attached_alloc_id: {type: string}, attached_machine_id: {type: string}, auto_backup_enabled: {type: boolean}, block_size: {type: integer}, blocks: {type: integer}, blocks_avail: {type: integer}, blocks_free: {type: integer}, created_at: {type: string}, encrypted: {type: boolean}, fstype: {type: string}, host_status: {type: string, enum: [ok, unknown, unreachable]}, id: {type: string}, name: {type: string}, region: {type: string}, size_gb: {type: integer}, snapshot_retention: {type: integer}, state: {type: string}, zone: {type: string}}}, VolumeSnapshot: {type: object, properties: {created_at: {type: string}, digest: {type: string}, id: {type: string}, retention_days: {type: integer}, size: {type: integer}, status: {type: string}}}, fly.ContainerConfig: {type: object, properties: {cmd: {type: array, description: CmdOverride is used to override the default command of the image., items: {type: string}}, depends_on: {type: array, description: DependsOn can be used to define dependencies between containers. The container will only be
started after all of its dependent conditions have been satisfied., items: {$ref: #/components/schemas/fly.ContainerDependency}}, entrypoint: {type: array, description: EntrypointOverride is used to override the default entrypoint of the image., items: {type: string}}, env: {type: object, additionalProperties: {type: string}, description: ExtraEnv is used to add additional environment variables to the container.}, env_from: {type: array, description: EnvFrom can be provided to set environment variables from machine fields., items: {$ref: #/components/schemas/fly.EnvFrom}}, exec: {type: array, description: Image Config overrides - these fields are used to override the image configuration.
If not provided, the image configuration will be used.
ExecOverride is used to override the default command of the image., items: {type: string}}, files: {type: array, description: Files are files that will be written to the container file system., items: {$ref: #/components/schemas/fly.File}}, healthchecks: {type: array, description: Healthchecks determine the health of your containers. Healthchecks can use HTTP, TCP or an Exec command., items: {$ref: #/components/schemas/fly.ContainerHealthcheck}}, image: {type: string, description: Image is the docker image to run.}, mounts: {type: array, description: Set of mounts added to the container. These must reference a volume in the machine config via its name., items: {$ref: #/components/schemas/fly.ContainerMount}}, name: {type: string, description: Name is used to identify the container in the machine.}, restart: {type: object, description: Restart is used to define the restart policy for the container. NOTE: spot-price is not
supported for containers., allOf: [{$ref: #/components/schemas/fly.MachineRestart}]}, secrets: {type: array, description: Secrets can be provided at the process level to explicitly indicate which secrets should be
used for the process. If not provided, the secrets provided at the machine level will be used., items: {$ref: #/components/schemas/fly.MachineSecret}}, stop: {type: object, description: Stop is used to define the signal and timeout for stopping the container., allOf: [{$ref: #/components/schemas/fly.StopConfig}]}, user: {type: string, description: UserOverride is used to override the default user of the image.}}}, fly.ContainerDependency: {type: object, properties: {condition: {type: object, allOf: [{$ref: #/components/schemas/fly.ContainerDependencyCondition}]}, name: {type: string}}}, fly.ContainerDependencyCondition: {type: string, enum: [exited_successfully, healthy, started], x-enum-varnames: [ExitedSuccessfully, Healthy, Started]}, fly.ContainerHealthcheck: {type: object, properties: {exec: {$ref: #/components/schemas/fly.ExecHealthcheck}, failure_threshold: {type: integer, description: The number of times the check must fail before considering the container unhealthy.}, grace_period: {type: integer, description: The time in seconds to wait after a container starts before checking its health.}, http: {$ref: #/components/schemas/fly.HTTPHealthcheck}, interval: {type: integer, description: The time in seconds between executing the defined check.}, kind: {type: object, description: Kind of healthcheck (readiness, liveness), allOf: [{$ref: #/components/schemas/fly.ContainerHealthcheckKind}]}, name: {type: string, description: The name of the check. Must be unique within the container.}, success_threshold: {type: integer, description: The number of times the check must succeeed before considering the container healthy.}, tcp: {$ref: #/components/schemas/fly.TCPHealthcheck}, timeout: {type: integer, description: The time in seconds to wait for the check to complete.}, unhealthy: {type: object, description: Unhealthy policy that determines what action to take if a container is deemed unhealthy, allOf: [{$ref: #/components/schemas/fly.UnhealthyPolicy}]}}}, fly.ContainerHealthcheckKind: {type: string, enum: [readiness, liveness], x-enum-varnames: [Readiness, Liveness]}, fly.ContainerHealthcheckScheme: {type: string, enum: [http, https], x-enum-varnames: [HTTP, HTTPS]}, fly.ContainerMount: {type: object, properties: {name: {type: string, description: The name of the volume. Must exist in the volumes field in the machine configuration}, path: {type: string, description: The path to mount the volume within the container}}}, fly.DNSConfig: {type: object, properties: {dns_forward_rules: {type: array, items: {$ref: #/components/schemas/fly.dnsForwardRule}}, hostname: {type: string}, hostname_fqdn: {type: string}, nameservers: {type: array, items: {type: string}}, options: {type: array, items: {$ref: #/components/schemas/fly.dnsOption}}, searches: {type: array, items: {type: string}}, skip_registration: {type: boolean}}}, fly.Duration: {type: object, properties: {time.Duration: {type: integer, x-enum-varnames: [minDuration, maxDuration, Nanosecond, Microsecond, Millisecond, Second, Minute, Hour, minDuration, maxDuration, Nanosecond, Microsecond, Millisecond, Second, Minute, Hour, minDuration, maxDuration, Nanosecond, Microsecond, Millisecond, Second, Minute, Hour]}}}, fly.EnvFrom: {type: object, properties: {env_var: {type: string, description: EnvVar is required and is the name of the environment variable that will be set from the
secret. It must be a valid environment variable name.}, field_ref: {type: string, description: FieldRef selects a field of the Machine: supports id, version, app_name, private_ip, region, image., enum: [id, version, app_name, private_ip, region, image]}}, description: EnvVar defines an environment variable to be populated from a machine field, env_var}, fly.ExecHealthcheck: {type: object, properties: {command: {type: array, description: The command to run to check the health of the container (e.g. ["cat", "/tmp/healthy"]), items: {type: string}}}}, fly.File: {type: object, properties: {guest_path: {type: string, description: GuestPath is the path on the machine where the file will be written and must be an absolute path.
For example: /full/path/to/file.json}, mode: {type: integer, description: Mode bits used to set permissions on this file as accepted by chmod(2).}, raw_value: {type: string, description: The base64 encoded string of the file contents.}, secret_name: {type: string, description: The name of the secret that contains the base64 encoded file contents.}}, description: A file that will be written to the Machine. One of RawValue or SecretName must be set.}, fly.HTTPHealthcheck: {type: object, properties: {headers: {type: array, description: Additional headers to send with the request, items: {$ref: #/components/schemas/fly.MachineHTTPHeader}}, method: {type: string, description: The HTTP method to use to when making the request}, path: {type: string, description: The path to send the request to}, port: {type: integer, description: The port to connect to, often the same as internal_port}, scheme: {type: object, description: Whether to use http or https, allOf: [{$ref: #/components/schemas/fly.ContainerHealthcheckScheme}]}, tls_server_name: {type: string, description: If the protocol is https, the hostname to use for TLS certificate validation}, tls_skip_verify: {type: boolean, description: If the protocol is https, whether or not to verify the TLS certificate}}}, fly.HTTPOptions: {type: object, properties: {compress: {type: boolean}, h2_backend: {type: boolean}, headers_read_timeout: {type: integer}, idle_timeout: {type: integer}, response: {$ref: #/components/schemas/fly.HTTPResponseOptions}}}, fly.HTTPResponseOptions: {type: object, properties: {headers: {type: object, additionalProperties: {type: object}}, pristine: {type: boolean}}}, fly.MachineCheck: {type: object, properties: {grace_period: {type: object, description: The time to wait after a VM starts before checking its health, allOf: [{$ref: #/components/schemas/fly.Duration}]}, headers: {type: array, items: {$ref: #/components/schemas/fly.MachineHTTPHeader}}, interval: {type: object, description: The time between connectivity checks, allOf: [{$ref: #/components/schemas/fly.Duration}]}, kind: {type: string, description: Kind of the check (informational, readiness), enum: [informational, readiness]}, method: {type: string, description: For http checks, the HTTP method to use to when making the request}, path: {type: string, description: For http checks, the path to send the request to}, port: {type: integer, description: The port to connect to, often the same as internal_port}, protocol: {type: string, description: For http checks, whether to use http or https}, timeout: {type: object, description: The maximum time a connection can take before being reported as failing its health check, allOf: [{$ref: #/components/schemas/fly.Duration}]}, tls_server_name: {type: string, description: If the protocol is https, the hostname to use for TLS certificate validation}, tls_skip_verify: {type: boolean, description: For http checks with https protocol, whether or not to verify the TLS certificate}, type: {type: string, description: tcp or http}}, description: An optional object that defines one or more named checks. The key for each check is the check name.}, fly.MachineConfig: {type: object, properties: {auto_destroy: {type: boolean, description: Optional boolean telling the Machine to destroy itself once it’s complete (default false)}, checks: {type: object, additionalProperties: {$ref: #/components/schemas/fly.MachineCheck}}, containers: {type: array, description: Containers are a list of containers that will run in the machine. Currently restricted to
only specific organizations., items: {$ref: #/components/schemas/fly.ContainerConfig}}, disable_machine_autostart: {type: boolean, description: Deprecated: use Service.Autostart instead}, dns: {$ref: #/components/schemas/fly.DNSConfig}, env: {type: object, additionalProperties: {type: string}, description: An object filled with key/value pairs to be set as environment variables}, files: {type: array, items: {$ref: #/components/schemas/fly.File}}, guest: {$ref: #/components/schemas/fly.MachineGuest}, image: {type: string, description: The docker image to run}, init: {$ref: #/components/schemas/fly.MachineInit}, metadata: {type: object, additionalProperties: {type: string}}, metrics: {$ref: #/components/schemas/fly.MachineMetrics}, mounts: {type: array, items: {$ref: #/components/schemas/fly.MachineMount}}, processes: {type: array, items: {$ref: #/components/schemas/fly.MachineProcess}}, restart: {$ref: #/components/schemas/fly.MachineRestart}, schedule: {type: string}, services: {type: array, items: {$ref: #/components/schemas/fly.MachineService}}, size: {type: string, description: Deprecated: use Guest instead}, standbys: {type: array, description: Standbys enable a machine to be a standby for another. In the event of a hardware failure,
the standby machine will be started., items: {type: string}}, statics: {type: array, items: {$ref: #/components/schemas/fly.Static}}, stop_config: {$ref: #/components/schemas/fly.StopConfig}, volumes: {type: array, description: Volumes describe the set of volumes that can be attached to the machine. Used in conjuction
with containers, items: {$ref: #/components/schemas/fly.VolumeConfig}}}}, fly.MachineGuest: {type: object, properties: {cpu_kind: {type: string}, cpus: {type: integer}, gpu_kind: {type: string}, gpus: {type: integer}, host_dedication_id: {type: string}, kernel_args: {type: array, items: {type: string}}, memory_mb: {type: integer}}}, fly.MachineHTTPHeader: {type: object, properties: {name: {type: string, description: The header name}, values: {type: array, description: The header value, items: {type: string}}}, description: For http checks, an array of objects with string field Name and array of strings field Values. The key/value pairs specify header and header values that will get passed with the check call.}, fly.MachineInit: {type: object, properties: {cmd: {type: array, items: {type: string}}, entrypoint: {type: array, items: {type: string}}, exec: {type: array, items: {type: string}}, kernel_args: {type: array, items: {type: string}}, swap_size_mb: {type: integer}, tty: {type: boolean}}}, fly.MachineMetrics: {type: object, properties: {https: {type: boolean}, path: {type: string}, port: {type: integer}}}, fly.MachineMount: {type: object, properties: {add_size_gb: {type: integer}, encrypted: {type: boolean}, extend_threshold_percent: {type: integer}, name: {type: string}, path: {type: string}, size_gb: {type: integer}, size_gb_limit: {type: integer}, volume: {type: string}}}, fly.MachinePort: {type: object, properties: {end_port: {type: integer}, force_https: {type: boolean}, handlers: {type: array, items: {type: string}}, http_options: {$ref: #/components/schemas/fly.HTTPOptions}, port: {type: integer}, proxy_proto_options: {$ref: #/components/schemas/fly.ProxyProtoOptions}, start_port: {type: integer}, tls_options: {$ref: #/components/schemas/fly.TLSOptions}}}, fly.MachineProcess: {type: object, properties: {cmd: {type: array, items: {type: string}}, entrypoint: {type: array, items: {type: string}}, env: {type: object, additionalProperties: {type: string}}, env_from: {type: array, description: EnvFrom can be provided to set environment variables from machine fields., items: {$ref: #/components/schemas/fly.EnvFrom}}, exec: {type: array, items: {type: string}}, ignore_app_secrets: {type: boolean, description: IgnoreAppSecrets can be set to true to ignore the secrets for the App the Machine belongs to
and only use the secrets provided at the process level. The default/legacy behavior is to use
the secrets provided at the App level.}, secrets: {type: array, description: Secrets can be provided at the process level to explicitly indicate which secrets should be
used for the process. If not provided, the secrets provided at the machine level will be used., items: {$ref: #/components/schemas/fly.MachineSecret}}, user: {type: string}}}, fly.MachineRestart: {type: object, properties: {gpu_bid_price: {type: number, description: GPU bid price for spot Machines.}, max_retries: {type: integer, description: When policy is on-failure, the maximum number of times to attempt to restart the Machine before letting it stop.}, policy: {type: string, description: * no - Never try to restart a Machine automatically when its main process exits, whether that’s on purpose or on a crash.
* always - Always restart a Machine automatically and never let it enter a stopped state, even when the main process exits cleanly.
* on-failure - Try up to MaxRetries times to automatically restart the Machine if it exits with a non-zero exit code. Default when no explicit policy is set, and for Machines with schedules.
* spot-price - Starts the Machine only when there is capacity and the spot price is less than or equal to the bid price., enum: [no, always, on-failure, spot-price]}}, description: The Machine restart policy defines whether and how flyd restarts a Machine after its main process exits. See https://fly.io/docs/machines/guides-examples/machine-restart-policy/.}, fly.MachineSecret: {type: object, properties: {env_var: {type: string, description: EnvVar is required and is the name of the environment variable that will be set from the
secret. It must be a valid environment variable name.}, name: {type: string, description: Name is optional and when provided is used to reference a secret name where the EnvVar is
different from what was set as the secret name.}}, description: A Secret needing to be set in the environment of the Machine. env_var is required}, fly.MachineService: {type: object, properties: {autostart: {type: boolean}, autostop: {type: string, description: Accepts a string (new format) or a boolean (old format). For backward compatibility with older clients, the API continues to use booleans for "off" and "stop" in responses.
* "off" or false - Do not autostop the Machine.
* "stop" or true - Automatically stop the Machine.
* "suspend" - Automatically suspend the Machine, falling back to a full stop if this is not possible., enum: [off, stop, suspend]}, checks: {type: array, items: {$ref: #/components/schemas/fly.MachineCheck}}, concurrency: {$ref: #/components/schemas/fly.MachineServiceConcurrency}, force_instance_description: {type: string}, force_instance_key: {type: string}, internal_port: {type: integer}, min_machines_running: {type: integer}, ports: {type: array, items: {$ref: #/components/schemas/fly.MachinePort}}, protocol: {type: string}}}, fly.MachineServiceConcurrency: {type: object, properties: {hard_limit: {type: integer}, soft_limit: {type: integer}, type: {type: string}}}, fly.ProxyProtoOptions: {type: object, properties: {version: {type: string}}}, fly.Static: {required: [guest_path, url_prefix], type: object, properties: {guest_path: {type: string}, index_document: {type: string}, tigris_bucket: {type: string}, url_prefix: {type: string}}}, fly.StopConfig: {type: object, properties: {signal: {type: string}, timeout: {$ref: #/components/schemas/fly.Duration}}}, fly.TCPHealthcheck: {type: object, properties: {port: {type: integer, description: The port to connect to, often the same as internal_port}}}, fly.TLSOptions: {type: object, properties: {alpn: {type: array, items: {type: string}}, default_self_signed: {type: boolean}, versions: {type: array, items: {type: string}}}}, fly.TempDirVolume: {type: object, properties: {size_mb: {type: integer, description: The size limit of the temp dir, only applicable when using disk backed storage.}, storage_type: {type: string, description: The type of storage used to back the temp dir. Either disk or memory.}}}, fly.UnhealthyPolicy: {type: string, enum: [stop], x-enum-varnames: [UnhealthyPolicyStop]}, fly.VolumeConfig: {type: object, properties: {name: {type: string, description: The name of the volume. A volume must have a unique name within an app}, temp_dir: {$ref: #/components/schemas/fly.TempDirVolume}}}, fly.dnsForwardRule: {type: object, properties: {addr: {type: string}, basename: {type: string}}}, fly.dnsOption: {type: object, properties: {name: {type: string}, value: {type: string}}}, flydv1.ExecResponse: {type: object, properties: {exit_code: {type: integer}, exit_signal: {type: integer}, stderr: {type: string}, stdout: {type: string}}}, main.statusCode: {type: string, enum: [unknown, insufficient_capacity], x-enum-varnames: [unknown, capacityErr]}}},
  },
  securityRequirements=[],
  externalDocs=OpenApiExternalDocs {
    url=https://fly.io/docs/machines/working-with-machines/,
    ref=#/externalDocs,
    node={url: https://fly.io/docs/machines/working-with-machines/},
  },
  tags=[OpenApiTag {
    name=Apps,
    description=This site hosts documentation generated from the Fly.io Machines API OpenAPI specification. Visit our complete [Machines API docs](https://fly.io/docs/machines/api/apps-resource/) for details about using the Apps resource.,
    ref=#/tags/0,
    node={name: Apps, description: This site hosts documentation generated from the Fly.io Machines API OpenAPI specification. Visit our complete [Machines API docs](https://fly.io/docs/machines/api/apps-resource/) for details about using the Apps resource.},
  }, OpenApiTag {
    name=Machines,
    description=This site hosts documentation generated from the Fly.io Machines API OpenAPI specification. Visit our complete [Machines API docs](https://fly.io/docs/machines/api/machines-resource/) for details about using the Machines resource.,
    ref=#/tags/1,
    node={name: Machines, description: This site hosts documentation generated from the Fly.io Machines API OpenAPI specification. Visit our complete [Machines API docs](https://fly.io/docs/machines/api/machines-resource/) for details about using the Machines resource.},
  }, OpenApiTag {
    name=Volumes,
    description=This site hosts documentation generated from the Fly.io Machines API OpenAPI specification. Visit our complete [Machines API docs](https://fly.io/docs/machines/api/volumes-resource/) for details about using the Volumes resource.,
    ref=#/tags/2,
    node={name: Volumes, description: This site hosts documentation generated from the Fly.io Machines API OpenAPI specification. Visit our complete [Machines API docs](https://fly.io/docs/machines/api/volumes-resource/) for details about using the Volumes resource.},
  }],
  ref=#,
  node={openapi: 3.0.1, info: {title: Machines API, description: This site hosts documentation generated from the Fly.io Machines API OpenAPI specification. Visit our complete [Machines API docs](https://fly.io/docs/machines/api/) for how to get started, more information about each endpoint, parameter descriptions, and examples., contact: {}, license: {name: Apache 2.0, url: http://www.apache.org/licenses/LICENSE-2.0.html}, version: 1.0}, externalDocs: {url: https://fly.io/docs/machines/working-with-machines/}, servers: [{url: https://api.machines.dev/v1}], tags: [{name: Apps, description: This site hosts documentation generated from the Fly.io Machines API OpenAPI specification. Visit our complete [Machines API docs](https://fly.io/docs/machines/api/apps-resource/) for details about using the Apps resource.}, {name: Machines, description: This site hosts documentation generated from the Fly.io Machines API OpenAPI specification. Visit our complete [Machines API docs](https://fly.io/docs/machines/api/machines-resource/) for details about using the Machines resource.}, {name: Volumes, description: This site hosts documentation generated from the Fly.io Machines API OpenAPI specification. Visit our complete [Machines API docs](https://fly.io/docs/machines/api/volumes-resource/) for details about using the Volumes resource.}], paths: {/apps: {get: {tags: [Apps], summary: List Apps, description: List all apps with the ability to filter by organization slug.
, operationId: Apps_list, parameters: [{name: org_slug, in: query, description: The org slug, or 'personal', to filter apps, required: true, schema: {type: string}}], responses: {200: {description: OK, content: {application/json: {schema: {$ref: #/components/schemas/ListAppsResponse}}}}}}, post: {tags: [Apps], summary: Create App, description: Create an app with the specified details in the request body.
, operationId: Apps_create, requestBody: {description: App body, content: {application/json: {schema: {$ref: #/components/schemas/CreateAppRequest}}}, required: true}, responses: {201: {description: Created, content: {}}, 400: {description: Bad Request, content: {application/json: {schema: {$ref: #/components/schemas/ErrorResponse}}}}}, x-codegen-request-body-name: request}}, /apps/{app_name}: {get: {tags: [Apps], summary: Get App, description: Retrieve details about a specific app by its name.
, operationId: Apps_show, parameters: [{name: app_name, in: path, description: Fly App Name, required: true, schema: {type: string}}], responses: {200: {description: OK, content: {application/json: {schema: {$ref: #/components/schemas/App}}}}}}, delete: {tags: [Apps], summary: Destroy App, description: Delete an app by its name.
, operationId: Apps_delete, parameters: [{name: app_name, in: path, description: Fly App Name, required: true, schema: {type: string}}], responses: {202: {description: Accepted, content: {}}}}}, /apps/{app_name}/machines: {get: {tags: [Machines], summary: List Machines, description: List all Machines associated with a specific app, with optional filters for including deleted Machines and filtering by region.
, operationId: Machines_list, parameters: [{name: app_name, in: path, description: Fly App Name, required: true, schema: {type: string}}, {name: include_deleted, in: query, description: Include deleted machines, schema: {type: boolean}}, {name: region, in: query, description: Region filter, schema: {type: string}}, {name: state, in: query, description: comma separated list of states to filter (created, started, stopped, suspended), schema: {type: string}}, {name: summary, in: query, description: Only return summary info about machines (omit config, checks, events, host_status, nonce, etc.), schema: {type: boolean}}], responses: {200: {description: OK, content: {application/json: {schema: {type: array, items: {$ref: #/components/schemas/Machine}}}}}}}, post: {tags: [Machines], summary: Create Machine, description: Create a Machine within a specific app using the details provided in the request body.

**Important**: This request can fail, and you’re responsible for handling that failure. If you ask for a large Machine, or a Machine in a region we happen to be at capacity for, you might need to retry the request, or to fall back to another region. If you’re working directly with the Machines API, you’re taking some responsibility for your own orchestration!
, operationId: Machines_create, parameters: [{name: app_name, in: path, description: Fly App Name, required: true, schema: {type: string}}], requestBody: {description: Create machine request, content: {application/json: {schema: {$ref: #/components/schemas/CreateMachineRequest}}}, required: true}, responses: {200: {description: OK, content: {application/json: {schema: {$ref: #/components/schemas/Machine}}}}}, x-codegen-request-body-name: request}}, /apps/{app_name}/machines/{machine_id}: {get: {tags: [Machines], summary: Get Machine, description: Get details of a specific Machine within an app by the Machine ID.
, operationId: Machines_show, parameters: [{name: app_name, in: path, description: Fly App Name, required: true, schema: {type: string}}, {name: machine_id, in: path, description: Machine ID, required: true, schema: {type: string}}], responses: {200: {description: OK, content: {application/json: {schema: {$ref: #/components/schemas/Machine}}}}}}, post: {tags: [Machines], summary: Update Machine, description: Update a Machine's configuration using the details provided in the request body.
, operationId: Machines_update, parameters: [{name: app_name, in: path, description: Fly App Name, required: true, schema: {type: string}}, {name: machine_id, in: path, description: Machine ID, required: true, schema: {type: string}}], requestBody: {description: Request body, content: {application/json: {schema: {$ref: #/components/schemas/UpdateMachineRequest}}}, required: true}, responses: {200: {description: OK, content: {application/json: {schema: {$ref: #/components/schemas/Machine}}}}, 400: {description: Bad Request, content: {application/json: {schema: {$ref: #/components/schemas/ErrorResponse}}}}}, x-codegen-request-body-name: request}, delete: {tags: [Machines], summary: Destroy Machine, description: Delete a specific Machine within an app by Machine ID, with an optional force parameter to force kill the Machine if it's running.
, operationId: Machines_delete, parameters: [{name: app_name, in: path, description: Fly App Name, required: true, schema: {type: string}}, {name: machine_id, in: path, description: Machine ID, required: true, schema: {type: string}}, {name: force, in: query, description: Force kill the machine if it's running, schema: {type: boolean}}], responses: {200: {description: OK, content: {}}}}}, /apps/{app_name}/machines/{machine_id}/cordon: {post: {tags: [Machines], summary: Cordon Machine, description: “Cordoning” a Machine refers to disabling its services, so the Fly Proxy won’t route requests to it. In flyctl this is used by blue/green deployments; one set of Machines is started up with services disabled, and when they are all healthy, the services are enabled on the new Machines and disabled on the old ones.
, operationId: Machines_cordon, parameters: [{name: app_name, in: path, description: Fly App Name, required: true, schema: {type: string}}, {name: machine_id, in: path, description: Machine ID, required: true, schema: {type: string}}], responses: {200: {description: OK, content: {}}}}}, /apps/{app_name}/machines/{machine_id}/events: {get: {tags: [Machines], summary: List Events, description: List all events associated with a specific Machine within an app.
, operationId: Machines_list_events, parameters: [{name: app_name, in: path, description: Fly App Name, required: true, schema: {type: string}}, {name: machine_id, in: path, description: Machine ID, required: true, schema: {type: string}}], responses: {200: {description: OK, content: {application/json: {schema: {type: array, items: {$ref: #/components/schemas/MachineEvent}}}}}}}}, /apps/{app_name}/machines/{machine_id}/exec: {post: {tags: [Machines], summary: Execute Command, description: Execute a command on a specific Machine and return the raw command output bytes.
, operationId: Machines_exec, parameters: [{name: app_name, in: path, description: Fly App Name, required: true, schema: {type: string}}, {name: machine_id, in: path, description: Machine ID, required: true, schema: {type: string}}], requestBody: {description: Request body, content: {application/json: {schema: {$ref: #/components/schemas/MachineExecRequest}}}, required: true}, responses: {200: {description: stdout, stderr, exit code, and exit signal are returned, content: {application/octet-stream: {schema: {$ref: #/components/schemas/flydv1.ExecResponse}}, application/json: {schema: {$ref: #/components/schemas/flydv1.ExecResponse}}}}, 400: {description: Bad Request, content: {application/octet-stream: {schema: {$ref: #/components/schemas/ErrorResponse}}, application/json: {schema: {$ref: #/components/schemas/ErrorResponse}}}}}, x-codegen-request-body-name: request}}, /apps/{app_name}/machines/{machine_id}/lease: {get: {tags: [Machines], summary: Get Lease, description: Retrieve the current lease of a specific Machine within an app. Machine leases can be used to obtain an exclusive lock on modifying a Machine.
, operationId: Machines_show_lease, parameters: [{name: app_name, in: path, description: Fly App Name, required: true, schema: {type: string}}, {name: machine_id, in: path, description: Machine ID, required: true, schema: {type: string}}], responses: {200: {description: OK, content: {application/json: {schema: {$ref: #/components/schemas/Lease}}}}}}, post: {tags: [Machines], summary: Create Lease, description: Create a lease for a specific Machine within an app using the details provided in the request body. Machine leases can be used to obtain an exclusive lock on modifying a Machine.
, operationId: Machines_create_lease, parameters: [{name: app_name, in: path, description: Fly App Name, required: true, schema: {type: string}}, {name: machine_id, in: path, description: Machine ID, required: true, schema: {type: string}}, {name: fly-machine-lease-nonce, in: header, description: Existing lease nonce to refresh by ttl, empty or non-existent to create a new lease, schema: {type: string}}], requestBody: {description: Request body, content: {application/json: {schema: {$ref: #/components/schemas/CreateLeaseRequest}}}, required: true}, responses: {200: {description: OK, content: {application/json: {schema: {$ref: #/components/schemas/Lease}}}}}, x-codegen-request-body-name: request}, delete: {tags: [Machines], summary: Release Lease, description: Release the lease of a specific Machine within an app. Machine leases can be used to obtain an exclusive lock on modifying a Machine.
, operationId: Machines_release_lease, parameters: [{name: app_name, in: path, description: Fly App Name, required: true, schema: {type: string}}, {name: machine_id, in: path, description: Machine ID, required: true, schema: {type: string}}, {name: fly-machine-lease-nonce, in: header, description: Existing lease nonce, required: true, schema: {type: string}}], responses: {200: {description: OK, content: {}}}}}, /apps/{app_name}/machines/{machine_id}/metadata: {get: {tags: [Machines], summary: Get Metadata, description: Retrieve metadata for a specific Machine within an app.
, operationId: Machines_show_metadata, parameters: [{name: app_name, in: path, description: Fly App Name, required: true, schema: {type: string}}, {name: machine_id, in: path, description: Machine ID, required: true, schema: {type: string}}], responses: {200: {description: OK, content: {application/json: {schema: {type: object, additionalProperties: {type: string}}}}}}}}, /apps/{app_name}/machines/{machine_id}/metadata/{key}: {post: {tags: [Machines], summary: Update Metadata, description: Update metadata for a specific machine within an app by providing a metadata key.
, operationId: Machines_update_metadata, parameters: [{name: app_name, in: path, description: Fly App Name, required: true, schema: {type: string}}, {name: machine_id, in: path, description: Machine ID, required: true, schema: {type: string}}, {name: key, in: path, description: Metadata Key, required: true, schema: {type: string}}], responses: {204: {description: No Content, content: {}}, 400: {description: Bad Request, content: {application/json: {schema: {$ref: #/components/schemas/ErrorResponse}}}}}}, delete: {tags: [Machines], summary: Delete Metadata, description: Delete metadata for a specific Machine within an app by providing a metadata key.
, operationId: Machines_delete_metadata, parameters: [{name: app_name, in: path, description: Fly App Name, required: true, schema: {type: string}}, {name: machine_id, in: path, description: Machine ID, required: true, schema: {type: string}}, {name: key, in: path, description: Metadata Key, required: true, schema: {type: string}}], responses: {204: {description: No Content, content: {}}}}}, /apps/{app_name}/machines/{machine_id}/ps: {get: {tags: [Machines], summary: List Processes, description: List all processes running on a specific Machine within an app, with optional sorting parameters.
, operationId: Machines_list_processes, parameters: [{name: app_name, in: path, description: Fly App Name, required: true, schema: {type: string}}, {name: machine_id, in: path, description: Machine ID, required: true, schema: {type: string}}, {name: sort_by, in: query, description: Sort by, schema: {type: string}}, {name: order, in: query, description: Order, schema: {type: string}}], responses: {200: {description: OK, content: {application/json: {schema: {type: array, items: {$ref: #/components/schemas/ProcessStat}}}}}, 400: {description: Bad Request, content: {application/json: {schema: {$ref: #/components/schemas/ErrorResponse}}}}}}}, /apps/{app_name}/machines/{machine_id}/restart: {post: {tags: [Machines], summary: Restart Machine, description: Restart a specific Machine within an app, with an optional timeout parameter.
, operationId: Machines_restart, parameters: [{name: app_name, in: path, description: Fly App Name, required: true, schema: {type: string}}, {name: machine_id, in: path, description: Machine ID, required: true, schema: {type: string}}, {name: timeout, in: query, description: Restart timeout as a Go duration string or number of seconds, schema: {type: string}}, {name: signal, in: query, description: Unix signal name, schema: {type: string}}], responses: {200: {description: OK, content: {}}, 400: {description: Bad Request, content: {application/json: {schema: {$ref: #/components/schemas/ErrorResponse}}}}}}}, /apps/{app_name}/machines/{machine_id}/signal: {post: {tags: [Machines], summary: Signal Machine, description: Send a signal to a specific Machine within an app using the details provided in the request body.
, operationId: Machines_signal, parameters: [{name: app_name, in: path, description: Fly App Name, required: true, schema: {type: string}}, {name: machine_id, in: path, description: Machine ID, required: true, schema: {type: string}}], requestBody: {description: Request body, content: {application/json: {schema: {$ref: #/components/schemas/SignalRequest}}}, required: true}, responses: {200: {description: OK, content: {}}, 400: {description: Bad Request, content: {application/json: {schema: {$ref: #/components/schemas/ErrorResponse}}}}}, x-codegen-request-body-name: request}}, /apps/{app_name}/machines/{machine_id}/start: {post: {tags: [Machines], summary: Start Machine, description: Start a specific Machine within an app.
, operationId: Machines_start, parameters: [{name: app_name, in: path, description: Fly App Name, required: true, schema: {type: string}}, {name: machine_id, in: path, description: Machine ID, required: true, schema: {type: string}}], responses: {200: {description: OK, content: {}}}}}, /apps/{app_name}/machines/{machine_id}/stop: {post: {tags: [Machines], summary: Stop Machine, description: Stop a specific Machine within an app, with an optional request body to specify signal and timeout.
, operationId: Machines_stop, parameters: [{name: app_name, in: path, description: Fly App Name, required: true, schema: {type: string}}, {name: machine_id, in: path, description: Machine ID, required: true, schema: {type: string}}], requestBody: {description: Optional request body, content: {application/json: {schema: {$ref: #/components/schemas/StopRequest}}}, required: false}, responses: {200: {description: OK, content: {}}, 400: {description: Bad Request, content: {application/json: {schema: {$ref: #/components/schemas/ErrorResponse}}}}}, x-codegen-request-body-name: request}}, /apps/{app_name}/machines/{machine_id}/suspend: {post: {tags: [Machines], summary: Suspend Machine, description: Suspend a specific Machine within an app. The next start operation will attempt (but is not guaranteed) to resume the Machine from a snapshot taken at suspension time, rather than performing a cold boot.
, operationId: Machines_suspend, parameters: [{name: app_name, in: path, description: Fly App Name, required: true, schema: {type: string}}, {name: machine_id, in: path, description: Machine ID, required: true, schema: {type: string}}], responses: {200: {description: OK, content: {}}}}}, /apps/{app_name}/machines/{machine_id}/uncordon: {post: {tags: [Machines], summary: Uncordon Machine, description: “Cordoning” a Machine refers to disabling its services, so the Fly Proxy won’t route requests to it. In flyctl this is used by blue/green deployments; one set of Machines is started up with services disabled, and when they are all healthy, the services are enabled on the new Machines and disabled on the old ones.
, operationId: Machines_uncordon, parameters: [{name: app_name, in: path, description: Fly App Name, required: true, schema: {type: string}}, {name: machine_id, in: path, description: Machine ID, required: true, schema: {type: string}}], responses: {200: {description: OK, content: {}}}}}, /apps/{app_name}/machines/{machine_id}/versions: {get: {tags: [Machines], summary: List Versions, description: List all versions of the configuration for a specific Machine within an app.
, operationId: Machines_list_versions, parameters: [{name: app_name, in: path, description: Fly App Name, required: true, schema: {type: string}}, {name: machine_id, in: path, description: Machine ID, required: true, schema: {type: string}}], responses: {200: {description: OK, content: {application/json: {schema: {type: array, items: {$ref: #/components/schemas/MachineVersion}}}}}}}}, /apps/{app_name}/machines/{machine_id}/wait: {get: {tags: [Machines], summary: Wait for State, description: Wait for a Machine to reach a specific state. Specify the desired state with the state parameter. See the [Machine states table](https://fly.io/docs/machines/working-with-machines/#machine-states) for a list of possible states. The default for this parameter is `started`.

This request will block for up to 60 seconds. Set a shorter timeout with the timeout parameter.
, operationId: Machines_wait, parameters: [{name: app_name, in: path, description: Fly App Name, required: true, schema: {type: string}}, {name: machine_id, in: path, description: Machine ID, required: true, schema: {type: string}}, {name: instance_id, in: query, description: 26-character Machine version ID, schema: {type: string}}, {name: timeout, in: query, description: wait timeout. default 60s, schema: {type: integer}}, {name: state, in: query, description: desired state, schema: {type: string, enum: [started, stopped, suspended, destroyed]}}], responses: {200: {description: OK, content: {}}, 400: {description: Bad Request, content: {application/json: {schema: {$ref: #/components/schemas/ErrorResponse}}}}}}}, /apps/{app_name}/secrets: {get: {tags: [Secrets], summary: List App secrets, operationId: Secrets_list, parameters: [{name: app_name, in: path, description: Fly App Name, required: true, schema: {type: string}}], responses: {200: {description: OK, content: {application/json: {schema: {type: array, items: {$ref: #/components/schemas/ListSecret}}}}}}}}, /apps/{app_name}/secrets/{secret_label}: {delete: {tags: [Secrets], summary: Destroy Secret, operationId: Secret_delete, parameters: [{name: app_name, in: path, description: Fly App Name, required: true, schema: {type: string}}, {name: secret_label, in: path, description: App Secret Label, required: true, schema: {type: string}}], responses: {200: {description: OK, content: {}}}}}, /apps/{app_name}/secrets/{secret_label}/type/{secret_type}: {post: {tags: [Secrets], summary: Create Secret, operationId: Secret_create, parameters: [{name: app_name, in: path, description: Fly App Name, required: true, schema: {type: string}}, {name: secret_label, in: path, description: App Secret Label, required: true, schema: {type: string}}, {name: secret_type, in: path, description: App Secret Type, required: true, schema: {type: string}}], requestBody: {description: secret body, content: {application/json: {schema: {$ref: #/components/schemas/CreateSecretRequest}}}, required: true}, responses: {201: {description: Created, content: {}}, 400: {description: Bad Request, content: {application/json: {schema: {$ref: #/components/schemas/ErrorResponse}}}}}, x-codegen-request-body-name: request}}, /apps/{app_name}/secrets/{secret_label}/type/{secret_type}/generate: {post: {tags: [Secrets], summary: Generate Secret, operationId: Secret_generate, parameters: [{name: app_name, in: path, description: Fly App Name, required: true, schema: {type: string}}, {name: secret_label, in: path, description: App Secret Label, required: true, schema: {type: string}}, {name: secret_type, in: path, description: App Secret Type, required: true, schema: {type: string}}], responses: {201: {description: Created, content: {}}, 400: {description: Bad Request, content: {application/json: {schema: {$ref: #/components/schemas/ErrorResponse}}}}}}}, /apps/{app_name}/volumes: {get: {tags: [Volumes], summary: List Volumes, description: List all volumes associated with a specific app.
, operationId: Volumes_list, parameters: [{name: app_name, in: path, description: Fly App Name, required: true, schema: {type: string}}, {name: summary, in: query, description: Only return summary info about volumes (omit blocks, block size, etc), schema: {type: boolean}}], responses: {200: {description: OK, content: {application/json: {schema: {type: array, items: {$ref: #/components/schemas/Volume}}}}}}}, post: {tags: [Volumes], summary: Create Volume, description: Create a volume for a specific app using the details provided in the request body.
, operationId: Volumes_create, parameters: [{name: app_name, in: path, description: Fly App Name, required: true, schema: {type: string}}], requestBody: {description: Request body, content: {application/json: {schema: {$ref: #/components/schemas/CreateVolumeRequest}}}, required: true}, responses: {200: {description: OK, content: {application/json: {schema: {$ref: #/components/schemas/Volume}}}}}, x-codegen-request-body-name: request}}, /apps/{app_name}/volumes/{volume_id}: {get: {tags: [Volumes], summary: Get Volume, description: Retrieve details about a specific volume by its ID within an app.
, operationId: Volumes_get_by_id, parameters: [{name: app_name, in: path, description: Fly App Name, required: true, schema: {type: string}}, {name: volume_id, in: path, description: Volume ID, required: true, schema: {type: string}}], responses: {200: {description: OK, content: {application/json: {schema: {$ref: #/components/schemas/Volume}}}}}}, put: {tags: [Volumes], summary: Update Volume, description: Update a volume's configuration using the details provided in the request body.
, operationId: Volumes_update, parameters: [{name: app_name, in: path, description: Fly App Name, required: true, schema: {type: string}}, {name: volume_id, in: path, description: Volume ID, required: true, schema: {type: string}}], requestBody: {description: Request body, content: {application/json: {schema: {$ref: #/components/schemas/UpdateVolumeRequest}}}, required: true}, responses: {200: {description: OK, content: {application/json: {schema: {$ref: #/components/schemas/Volume}}}}, 400: {description: Bad Request, content: {application/json: {schema: {$ref: #/components/schemas/ErrorResponse}}}}}, x-codegen-request-body-name: request}, delete: {tags: [Volumes], summary: Destroy Volume, description: Delete a specific volume within an app by volume ID.
, operationId: Volume_delete, parameters: [{name: app_name, in: path, description: Fly App Name, required: true, schema: {type: string}}, {name: volume_id, in: path, description: Volume ID, required: true, schema: {type: string}}], responses: {200: {description: OK, content: {application/json: {schema: {$ref: #/components/schemas/Volume}}}}}}}, /apps/{app_name}/volumes/{volume_id}/extend: {put: {tags: [Volumes], summary: Extend Volume, description: Extend a volume's size within an app using the details provided in the request body.
, operationId: Volumes_extend, parameters: [{name: app_name, in: path, description: Fly App Name, required: true, schema: {type: string}}, {name: volume_id, in: path, description: Volume ID, required: true, schema: {type: string}}], requestBody: {description: Request body, content: {application/json: {schema: {$ref: #/components/schemas/ExtendVolumeRequest}}}, required: true}, responses: {200: {description: OK, content: {application/json: {schema: {$ref: #/components/schemas/ExtendVolumeResponse}}}}}, x-codegen-request-body-name: request}}, /apps/{app_name}/volumes/{volume_id}/snapshots: {get: {tags: [Volumes], summary: List Snapshots, description: List all snapshots for a specific volume within an app.
, operationId: Volumes_list_snapshots, parameters: [{name: app_name, in: path, description: Fly App Name, required: true, schema: {type: string}}, {name: volume_id, in: path, description: Volume ID, required: true, schema: {type: string}}], responses: {200: {description: OK, content: {application/json: {schema: {type: array, items: {$ref: #/components/schemas/VolumeSnapshot}}}}}}}, post: {tags: [Volumes], summary: Create Snapshot, description: Create a snapshot for a specific volume within an app.
, operationId: createVolumeSnapshot, parameters: [{name: app_name, in: path, description: Fly App Name, required: true, schema: {type: string}}, {name: volume_id, in: path, description: Volume ID, required: true, schema: {type: string}}], responses: {200: {description: OK, content: {}}}}}, /tokens/kms: {post: {tags: [Tokens], summary: Request a Petsem token for accessing KMS, description: This site hosts documentation generated from the Fly.io Machines API OpenAPI specification. Visit our complete [Machines API docs](https://fly.io/docs/machines/api/apps-resource/) for details about using the Apps resource., operationId: Tokens_request_Kms, responses: {200: {description: KMS token, content: {application/json: {schema: {type: string}}}}}}}, /tokens/oidc: {post: {tags: [Tokens], summary: Request an OIDC token, description: Request an Open ID Connect token for your machine. Customize the audience claim with the `aud` parameter. This returns a JWT token. Learn more about [using OpenID Connect](/docs/reference/openid-connect/) on Fly.io.
, operationId: Tokens_request_OIDC, requestBody: {description: Optional request body, content: {application/json: {schema: {$ref: #/components/schemas/CreateOIDCTokenRequest}}}, required: true}, responses: {200: {description: OIDC token, content: {application/json: {schema: {type: string}}}}, 400: {description: Bad Request, content: {application/json: {schema: {$ref: #/components/schemas/ErrorResponse}}}}}, x-codegen-request-body-name: request}}}, components: {schemas: {App: {type: object, properties: {id: {type: string}, name: {type: string}, organization: {$ref: #/components/schemas/Organization}, status: {type: string}}}, CheckStatus: {type: object, properties: {name: {type: string}, output: {type: string}, status: {type: string}, updated_at: {type: string}}}, CreateAppRequest: {type: object, properties: {app_name: {type: string}, enable_subdomains: {type: boolean}, network: {type: string}, org_slug: {type: string}}}, CreateLeaseRequest: {type: object, properties: {description: {type: string}, ttl: {type: integer, description: seconds lease will be valid}}}, CreateMachineRequest: {type: object, properties: {config: {type: object, description: An object defining the Machine configuration, allOf: [{$ref: #/components/schemas/fly.MachineConfig}]}, lease_ttl: {type: integer}, lsvd: {type: boolean}, name: {type: string, description: Unique name for this Machine. If omitted, one is generated for you}, region: {type: string, description: The target region. Omitting this param launches in the same region as your WireGuard peer connection (somewhere near you).}, skip_launch: {type: boolean}, skip_service_registration: {type: boolean}}}, CreateOIDCTokenRequest: {type: object, properties: {aud: {type: string, example: https://fly.io/org-slug}, aws_principal_tags: {type: boolean}}, description: Optional parameters}, CreateSecretRequest: {type: object, properties: {value: {type: array, items: {type: integer}}}}, CreateVolumeRequest: {type: object, properties: {compute: {$ref: #/components/schemas/fly.MachineGuest}, compute_image: {type: string}, encrypted: {type: boolean}, fstype: {type: string}, name: {type: string}, region: {type: string}, require_unique_zone: {type: boolean}, size_gb: {type: integer}, snapshot_id: {type: string, description: restore from snapshot}, snapshot_retention: {type: integer}, source_volume_id: {type: string, description: fork from remote volume}, unique_zone_app_wide: {type: boolean}}}, ErrorResponse: {type: object, properties: {details: {type: object, description: Deprecated}, error: {type: string}, status: {$ref: #/components/schemas/main.statusCode}}}, ExtendVolumeRequest: {type: object, properties: {size_gb: {type: integer}}}, ExtendVolumeResponse: {type: object, properties: {needs_restart: {type: boolean}, volume: {$ref: #/components/schemas/Volume}}}, ImageRef: {type: object, properties: {digest: {type: string}, labels: {type: object, additionalProperties: {type: string}}, registry: {type: string}, repository: {type: string}, tag: {type: string}}}, Lease: {type: object, properties: {description: {type: string, description: Description or reason for the Lease.}, expires_at: {type: integer, description: ExpiresAt is the unix timestamp in UTC to denote when the Lease will no longer be valid.}, nonce: {type: string, description: Nonce is the unique ID autogenerated and associated with the Lease.}, owner: {type: string, description: Owner is the user identifier which acquired the Lease.}, version: {type: string, description: Machine version}}}, ListApp: {type: object, properties: {id: {type: string}, machine_count: {type: integer}, name: {type: string}, network: {type: object}}}, ListAppsResponse: {type: object, properties: {apps: {type: array, items: {$ref: #/components/schemas/ListApp}}, total_apps: {type: integer}}}, ListSecret: {type: object, properties: {label: {type: string}, publickey: {type: array, items: {type: integer}}, type: {type: string}}}, ListenSocket: {type: object, properties: {address: {type: string}, proto: {type: string}}}, Machine: {type: object, properties: {checks: {type: array, items: {$ref: #/components/schemas/CheckStatus}}, config: {$ref: #/components/schemas/fly.MachineConfig}, created_at: {type: string}, events: {type: array, items: {$ref: #/components/schemas/MachineEvent}}, host_status: {type: string, enum: [ok, unknown, unreachable]}, id: {type: string}, image_ref: {$ref: #/components/schemas/ImageRef}, incomplete_config: {$ref: #/components/schemas/fly.MachineConfig}, instance_id: {type: string, description: InstanceID is unique for each version of the machine}, name: {type: string}, nonce: {type: string, description: Nonce is only every returned on machine creation if a lease_duration was provided.}, private_ip: {type: string, description: PrivateIP is the internal 6PN address of the machine.}, region: {type: string}, state: {type: string}, updated_at: {type: string}}}, MachineEvent: {type: object, properties: {id: {type: string}, request: {type: object}, source: {type: string}, status: {type: string}, timestamp: {type: integer}, type: {type: string}}}, MachineExecRequest: {type: object, properties: {cmd: {type: string, description: Deprecated: use Command instead}, command: {type: array, items: {type: string}}, container: {type: string}, stdin: {type: string}, timeout: {type: integer}}}, MachineVersion: {type: object, properties: {user_config: {$ref: #/components/schemas/fly.MachineConfig}, version: {type: string}}}, Organization: {type: object, properties: {name: {type: string}, slug: {type: string}}}, ProcessStat: {type: object, properties: {command: {type: string}, cpu: {type: integer}, directory: {type: string}, listen_sockets: {type: array, items: {$ref: #/components/schemas/ListenSocket}}, pid: {type: integer}, rss: {type: integer}, rtime: {type: integer}, stime: {type: integer}}}, SignalRequest: {type: object, properties: {signal: {type: string, enum: [SIGABRT, SIGALRM, SIGFPE, SIGHUP, SIGILL, SIGINT, SIGKILL, SIGPIPE, SIGQUIT, SIGSEGV, SIGTERM, SIGTRAP, SIGUSR1]}}}, StopRequest: {type: object, properties: {signal: {type: string}, timeout: {$ref: #/components/schemas/fly.Duration}}}, UpdateMachineRequest: {type: object, properties: {config: {type: object, description: An object defining the Machine configuration, allOf: [{$ref: #/components/schemas/fly.MachineConfig}]}, current_version: {type: string}, lease_ttl: {type: integer}, lsvd: {type: boolean}, name: {type: string, description: Unique name for this Machine. If omitted, one is generated for you}, region: {type: string, description: The target region. Omitting this param launches in the same region as your WireGuard peer connection (somewhere near you).}, skip_launch: {type: boolean}, skip_service_registration: {type: boolean}}}, UpdateVolumeRequest: {type: object, properties: {auto_backup_enabled: {type: boolean}, snapshot_retention: {type: integer}}}, Volume: {type: object, properties: {attached_alloc_id: {type: string}, attached_machine_id: {type: string}, auto_backup_enabled: {type: boolean}, block_size: {type: integer}, blocks: {type: integer}, blocks_avail: {type: integer}, blocks_free: {type: integer}, created_at: {type: string}, encrypted: {type: boolean}, fstype: {type: string}, host_status: {type: string, enum: [ok, unknown, unreachable]}, id: {type: string}, name: {type: string}, region: {type: string}, size_gb: {type: integer}, snapshot_retention: {type: integer}, state: {type: string}, zone: {type: string}}}, VolumeSnapshot: {type: object, properties: {created_at: {type: string}, digest: {type: string}, id: {type: string}, retention_days: {type: integer}, size: {type: integer}, status: {type: string}}}, fly.ContainerConfig: {type: object, properties: {cmd: {type: array, description: CmdOverride is used to override the default command of the image., items: {type: string}}, depends_on: {type: array, description: DependsOn can be used to define dependencies between containers. The container will only be
started after all of its dependent conditions have been satisfied., items: {$ref: #/components/schemas/fly.ContainerDependency}}, entrypoint: {type: array, description: EntrypointOverride is used to override the default entrypoint of the image., items: {type: string}}, env: {type: object, additionalProperties: {type: string}, description: ExtraEnv is used to add additional environment variables to the container.}, env_from: {type: array, description: EnvFrom can be provided to set environment variables from machine fields., items: {$ref: #/components/schemas/fly.EnvFrom}}, exec: {type: array, description: Image Config overrides - these fields are used to override the image configuration.
If not provided, the image configuration will be used.
ExecOverride is used to override the default command of the image., items: {type: string}}, files: {type: array, description: Files are files that will be written to the container file system., items: {$ref: #/components/schemas/fly.File}}, healthchecks: {type: array, description: Healthchecks determine the health of your containers. Healthchecks can use HTTP, TCP or an Exec command., items: {$ref: #/components/schemas/fly.ContainerHealthcheck}}, image: {type: string, description: Image is the docker image to run.}, mounts: {type: array, description: Set of mounts added to the container. These must reference a volume in the machine config via its name., items: {$ref: #/components/schemas/fly.ContainerMount}}, name: {type: string, description: Name is used to identify the container in the machine.}, restart: {type: object, description: Restart is used to define the restart policy for the container. NOTE: spot-price is not
supported for containers., allOf: [{$ref: #/components/schemas/fly.MachineRestart}]}, secrets: {type: array, description: Secrets can be provided at the process level to explicitly indicate which secrets should be
used for the process. If not provided, the secrets provided at the machine level will be used., items: {$ref: #/components/schemas/fly.MachineSecret}}, stop: {type: object, description: Stop is used to define the signal and timeout for stopping the container., allOf: [{$ref: #/components/schemas/fly.StopConfig}]}, user: {type: string, description: UserOverride is used to override the default user of the image.}}}, fly.ContainerDependency: {type: object, properties: {condition: {type: object, allOf: [{$ref: #/components/schemas/fly.ContainerDependencyCondition}]}, name: {type: string}}}, fly.ContainerDependencyCondition: {type: string, enum: [exited_successfully, healthy, started], x-enum-varnames: [ExitedSuccessfully, Healthy, Started]}, fly.ContainerHealthcheck: {type: object, properties: {exec: {$ref: #/components/schemas/fly.ExecHealthcheck}, failure_threshold: {type: integer, description: The number of times the check must fail before considering the container unhealthy.}, grace_period: {type: integer, description: The time in seconds to wait after a container starts before checking its health.}, http: {$ref: #/components/schemas/fly.HTTPHealthcheck}, interval: {type: integer, description: The time in seconds between executing the defined check.}, kind: {type: object, description: Kind of healthcheck (readiness, liveness), allOf: [{$ref: #/components/schemas/fly.ContainerHealthcheckKind}]}, name: {type: string, description: The name of the check. Must be unique within the container.}, success_threshold: {type: integer, description: The number of times the check must succeeed before considering the container healthy.}, tcp: {$ref: #/components/schemas/fly.TCPHealthcheck}, timeout: {type: integer, description: The time in seconds to wait for the check to complete.}, unhealthy: {type: object, description: Unhealthy policy that determines what action to take if a container is deemed unhealthy, allOf: [{$ref: #/components/schemas/fly.UnhealthyPolicy}]}}}, fly.ContainerHealthcheckKind: {type: string, enum: [readiness, liveness], x-enum-varnames: [Readiness, Liveness]}, fly.ContainerHealthcheckScheme: {type: string, enum: [http, https], x-enum-varnames: [HTTP, HTTPS]}, fly.ContainerMount: {type: object, properties: {name: {type: string, description: The name of the volume. Must exist in the volumes field in the machine configuration}, path: {type: string, description: The path to mount the volume within the container}}}, fly.DNSConfig: {type: object, properties: {dns_forward_rules: {type: array, items: {$ref: #/components/schemas/fly.dnsForwardRule}}, hostname: {type: string}, hostname_fqdn: {type: string}, nameservers: {type: array, items: {type: string}}, options: {type: array, items: {$ref: #/components/schemas/fly.dnsOption}}, searches: {type: array, items: {type: string}}, skip_registration: {type: boolean}}}, fly.Duration: {type: object, properties: {time.Duration: {type: integer, x-enum-varnames: [minDuration, maxDuration, Nanosecond, Microsecond, Millisecond, Second, Minute, Hour, minDuration, maxDuration, Nanosecond, Microsecond, Millisecond, Second, Minute, Hour, minDuration, maxDuration, Nanosecond, Microsecond, Millisecond, Second, Minute, Hour]}}}, fly.EnvFrom: {type: object, properties: {env_var: {type: string, description: EnvVar is required and is the name of the environment variable that will be set from the
secret. It must be a valid environment variable name.}, field_ref: {type: string, description: FieldRef selects a field of the Machine: supports id, version, app_name, private_ip, region, image., enum: [id, version, app_name, private_ip, region, image]}}, description: EnvVar defines an environment variable to be populated from a machine field, env_var}, fly.ExecHealthcheck: {type: object, properties: {command: {type: array, description: The command to run to check the health of the container (e.g. ["cat", "/tmp/healthy"]), items: {type: string}}}}, fly.File: {type: object, properties: {guest_path: {type: string, description: GuestPath is the path on the machine where the file will be written and must be an absolute path.
For example: /full/path/to/file.json}, mode: {type: integer, description: Mode bits used to set permissions on this file as accepted by chmod(2).}, raw_value: {type: string, description: The base64 encoded string of the file contents.}, secret_name: {type: string, description: The name of the secret that contains the base64 encoded file contents.}}, description: A file that will be written to the Machine. One of RawValue or SecretName must be set.}, fly.HTTPHealthcheck: {type: object, properties: {headers: {type: array, description: Additional headers to send with the request, items: {$ref: #/components/schemas/fly.MachineHTTPHeader}}, method: {type: string, description: The HTTP method to use to when making the request}, path: {type: string, description: The path to send the request to}, port: {type: integer, description: The port to connect to, often the same as internal_port}, scheme: {type: object, description: Whether to use http or https, allOf: [{$ref: #/components/schemas/fly.ContainerHealthcheckScheme}]}, tls_server_name: {type: string, description: If the protocol is https, the hostname to use for TLS certificate validation}, tls_skip_verify: {type: boolean, description: If the protocol is https, whether or not to verify the TLS certificate}}}, fly.HTTPOptions: {type: object, properties: {compress: {type: boolean}, h2_backend: {type: boolean}, headers_read_timeout: {type: integer}, idle_timeout: {type: integer}, response: {$ref: #/components/schemas/fly.HTTPResponseOptions}}}, fly.HTTPResponseOptions: {type: object, properties: {headers: {type: object, additionalProperties: {type: object}}, pristine: {type: boolean}}}, fly.MachineCheck: {type: object, properties: {grace_period: {type: object, description: The time to wait after a VM starts before checking its health, allOf: [{$ref: #/components/schemas/fly.Duration}]}, headers: {type: array, items: {$ref: #/components/schemas/fly.MachineHTTPHeader}}, interval: {type: object, description: The time between connectivity checks, allOf: [{$ref: #/components/schemas/fly.Duration}]}, kind: {type: string, description: Kind of the check (informational, readiness), enum: [informational, readiness]}, method: {type: string, description: For http checks, the HTTP method to use to when making the request}, path: {type: string, description: For http checks, the path to send the request to}, port: {type: integer, description: The port to connect to, often the same as internal_port}, protocol: {type: string, description: For http checks, whether to use http or https}, timeout: {type: object, description: The maximum time a connection can take before being reported as failing its health check, allOf: [{$ref: #/components/schemas/fly.Duration}]}, tls_server_name: {type: string, description: If the protocol is https, the hostname to use for TLS certificate validation}, tls_skip_verify: {type: boolean, description: For http checks with https protocol, whether or not to verify the TLS certificate}, type: {type: string, description: tcp or http}}, description: An optional object that defines one or more named checks. The key for each check is the check name.}, fly.MachineConfig: {type: object, properties: {auto_destroy: {type: boolean, description: Optional boolean telling the Machine to destroy itself once it’s complete (default false)}, checks: {type: object, additionalProperties: {$ref: #/components/schemas/fly.MachineCheck}}, containers: {type: array, description: Containers are a list of containers that will run in the machine. Currently restricted to
only specific organizations., items: {$ref: #/components/schemas/fly.ContainerConfig}}, disable_machine_autostart: {type: boolean, description: Deprecated: use Service.Autostart instead}, dns: {$ref: #/components/schemas/fly.DNSConfig}, env: {type: object, additionalProperties: {type: string}, description: An object filled with key/value pairs to be set as environment variables}, files: {type: array, items: {$ref: #/components/schemas/fly.File}}, guest: {$ref: #/components/schemas/fly.MachineGuest}, image: {type: string, description: The docker image to run}, init: {$ref: #/components/schemas/fly.MachineInit}, metadata: {type: object, additionalProperties: {type: string}}, metrics: {$ref: #/components/schemas/fly.MachineMetrics}, mounts: {type: array, items: {$ref: #/components/schemas/fly.MachineMount}}, processes: {type: array, items: {$ref: #/components/schemas/fly.MachineProcess}}, restart: {$ref: #/components/schemas/fly.MachineRestart}, schedule: {type: string}, services: {type: array, items: {$ref: #/components/schemas/fly.MachineService}}, size: {type: string, description: Deprecated: use Guest instead}, standbys: {type: array, description: Standbys enable a machine to be a standby for another. In the event of a hardware failure,
the standby machine will be started., items: {type: string}}, statics: {type: array, items: {$ref: #/components/schemas/fly.Static}}, stop_config: {$ref: #/components/schemas/fly.StopConfig}, volumes: {type: array, description: Volumes describe the set of volumes that can be attached to the machine. Used in conjuction
with containers, items: {$ref: #/components/schemas/fly.VolumeConfig}}}}, fly.MachineGuest: {type: object, properties: {cpu_kind: {type: string}, cpus: {type: integer}, gpu_kind: {type: string}, gpus: {type: integer}, host_dedication_id: {type: string}, kernel_args: {type: array, items: {type: string}}, memory_mb: {type: integer}}}, fly.MachineHTTPHeader: {type: object, properties: {name: {type: string, description: The header name}, values: {type: array, description: The header value, items: {type: string}}}, description: For http checks, an array of objects with string field Name and array of strings field Values. The key/value pairs specify header and header values that will get passed with the check call.}, fly.MachineInit: {type: object, properties: {cmd: {type: array, items: {type: string}}, entrypoint: {type: array, items: {type: string}}, exec: {type: array, items: {type: string}}, kernel_args: {type: array, items: {type: string}}, swap_size_mb: {type: integer}, tty: {type: boolean}}}, fly.MachineMetrics: {type: object, properties: {https: {type: boolean}, path: {type: string}, port: {type: integer}}}, fly.MachineMount: {type: object, properties: {add_size_gb: {type: integer}, encrypted: {type: boolean}, extend_threshold_percent: {type: integer}, name: {type: string}, path: {type: string}, size_gb: {type: integer}, size_gb_limit: {type: integer}, volume: {type: string}}}, fly.MachinePort: {type: object, properties: {end_port: {type: integer}, force_https: {type: boolean}, handlers: {type: array, items: {type: string}}, http_options: {$ref: #/components/schemas/fly.HTTPOptions}, port: {type: integer}, proxy_proto_options: {$ref: #/components/schemas/fly.ProxyProtoOptions}, start_port: {type: integer}, tls_options: {$ref: #/components/schemas/fly.TLSOptions}}}, fly.MachineProcess: {type: object, properties: {cmd: {type: array, items: {type: string}}, entrypoint: {type: array, items: {type: string}}, env: {type: object, additionalProperties: {type: string}}, env_from: {type: array, description: EnvFrom can be provided to set environment variables from machine fields., items: {$ref: #/components/schemas/fly.EnvFrom}}, exec: {type: array, items: {type: string}}, ignore_app_secrets: {type: boolean, description: IgnoreAppSecrets can be set to true to ignore the secrets for the App the Machine belongs to
and only use the secrets provided at the process level. The default/legacy behavior is to use
the secrets provided at the App level.}, secrets: {type: array, description: Secrets can be provided at the process level to explicitly indicate which secrets should be
used for the process. If not provided, the secrets provided at the machine level will be used., items: {$ref: #/components/schemas/fly.MachineSecret}}, user: {type: string}}}, fly.MachineRestart: {type: object, properties: {gpu_bid_price: {type: number, description: GPU bid price for spot Machines.}, max_retries: {type: integer, description: When policy is on-failure, the maximum number of times to attempt to restart the Machine before letting it stop.}, policy: {type: string, description: * no - Never try to restart a Machine automatically when its main process exits, whether that’s on purpose or on a crash.
* always - Always restart a Machine automatically and never let it enter a stopped state, even when the main process exits cleanly.
* on-failure - Try up to MaxRetries times to automatically restart the Machine if it exits with a non-zero exit code. Default when no explicit policy is set, and for Machines with schedules.
* spot-price - Starts the Machine only when there is capacity and the spot price is less than or equal to the bid price., enum: [no, always, on-failure, spot-price]}}, description: The Machine restart policy defines whether and how flyd restarts a Machine after its main process exits. See https://fly.io/docs/machines/guides-examples/machine-restart-policy/.}, fly.MachineSecret: {type: object, properties: {env_var: {type: string, description: EnvVar is required and is the name of the environment variable that will be set from the
secret. It must be a valid environment variable name.}, name: {type: string, description: Name is optional and when provided is used to reference a secret name where the EnvVar is
different from what was set as the secret name.}}, description: A Secret needing to be set in the environment of the Machine. env_var is required}, fly.MachineService: {type: object, properties: {autostart: {type: boolean}, autostop: {type: string, description: Accepts a string (new format) or a boolean (old format). For backward compatibility with older clients, the API continues to use booleans for "off" and "stop" in responses.
* "off" or false - Do not autostop the Machine.
* "stop" or true - Automatically stop the Machine.
* "suspend" - Automatically suspend the Machine, falling back to a full stop if this is not possible., enum: [off, stop, suspend]}, checks: {type: array, items: {$ref: #/components/schemas/fly.MachineCheck}}, concurrency: {$ref: #/components/schemas/fly.MachineServiceConcurrency}, force_instance_description: {type: string}, force_instance_key: {type: string}, internal_port: {type: integer}, min_machines_running: {type: integer}, ports: {type: array, items: {$ref: #/components/schemas/fly.MachinePort}}, protocol: {type: string}}}, fly.MachineServiceConcurrency: {type: object, properties: {hard_limit: {type: integer}, soft_limit: {type: integer}, type: {type: string}}}, fly.ProxyProtoOptions: {type: object, properties: {version: {type: string}}}, fly.Static: {required: [guest_path, url_prefix], type: object, properties: {guest_path: {type: string}, index_document: {type: string}, tigris_bucket: {type: string}, url_prefix: {type: string}}}, fly.StopConfig: {type: object, properties: {signal: {type: string}, timeout: {$ref: #/components/schemas/fly.Duration}}}, fly.TCPHealthcheck: {type: object, properties: {port: {type: integer, description: The port to connect to, often the same as internal_port}}}, fly.TLSOptions: {type: object, properties: {alpn: {type: array, items: {type: string}}, default_self_signed: {type: boolean}, versions: {type: array, items: {type: string}}}}, fly.TempDirVolume: {type: object, properties: {size_mb: {type: integer, description: The size limit of the temp dir, only applicable when using disk backed storage.}, storage_type: {type: string, description: The type of storage used to back the temp dir. Either disk or memory.}}}, fly.UnhealthyPolicy: {type: string, enum: [stop], x-enum-varnames: [UnhealthyPolicyStop]}, fly.VolumeConfig: {type: object, properties: {name: {type: string, description: The name of the volume. A volume must have a unique name within an app}, temp_dir: {$ref: #/components/schemas/fly.TempDirVolume}}}, fly.dnsForwardRule: {type: object, properties: {addr: {type: string}, basename: {type: string}}}, fly.dnsOption: {type: object, properties: {name: {type: string}, value: {type: string}}}, flydv1.ExecResponse: {type: object, properties: {exit_code: {type: integer}, exit_signal: {type: integer}, stderr: {type: string}, stdout: {type: string}}}, main.statusCode: {type: string, enum: [unknown, insufficient_capacity], x-enum-varnames: [unknown, capacityErr]}}}, x-original-swagger-version: 2.0},
  extensions={x-original-swagger-version: 2.0},
}