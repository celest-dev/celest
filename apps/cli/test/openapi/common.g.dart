// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'common.dart';

// **************************************************************************
// JsonLiteralGenerator
// **************************************************************************

final _$petstoreV2JsonJsonLiteral = {
  'swagger': '2.0',
  'info': {
    'version': '1.0.0',
    'title': 'Swagger Petstore',
    'license': {'name': 'MIT'}
  },
  'host': 'petstore.swagger.io',
  'basePath': '/v1',
  'schemes': ['http'],
  'consumes': ['application/json'],
  'produces': ['application/json'],
  'paths': {
    '/pets': {
      'get': {
        'summary': 'List all pets',
        'operationId': 'listPets',
        'tags': ['pets'],
        'parameters': [
          {
            'name': 'limit',
            'in': 'query',
            'description': 'How many items to return at one time (max 100)',
            'required': false,
            'type': 'integer',
            'format': 'int32'
          }
        ],
        'responses': {
          '200': {
            'description': 'An paged array of pets',
            'headers': {
              'x-next': {
                'type': 'string',
                'description': 'A link to the next page of responses'
              }
            },
            'schema': {r'$ref': '#/definitions/Pets'}
          },
          'default': {
            'description': 'unexpected error',
            'schema': {r'$ref': '#/definitions/Error'}
          }
        }
      },
      'post': {
        'summary': 'Create a pet',
        'operationId': 'createPets',
        'tags': ['pets'],
        'responses': {
          '201': {'description': 'Null response'},
          'default': {
            'description': 'unexpected error',
            'schema': {r'$ref': '#/definitions/Error'}
          }
        }
      }
    },
    '/pets/{petId}': {
      'get': {
        'summary': 'Info for a specific pet',
        'operationId': 'showPetById',
        'tags': ['pets'],
        'parameters': [
          {
            'name': 'petId',
            'in': 'path',
            'required': true,
            'description': 'The id of the pet to retrieve',
            'type': 'string'
          }
        ],
        'responses': {
          '200': {
            'description': 'Expected response to a valid request',
            'schema': {r'$ref': '#/definitions/Pets'}
          },
          'default': {
            'description': 'unexpected error',
            'schema': {r'$ref': '#/definitions/Error'}
          }
        }
      }
    }
  },
  'definitions': {
    'Pet': {
      'required': ['id', 'name'],
      'properties': {
        'id': {'type': 'integer', 'format': 'int64'},
        'name': {'type': 'string'},
        'tag': {'type': 'string'}
      }
    },
    'Pets': {
      'type': 'array',
      'items': {r'$ref': '#/definitions/Pet'}
    },
    'Error': {
      'required': ['code', 'message'],
      'properties': {
        'code': {'type': 'integer', 'format': 'int32'},
        'message': {'type': 'string'}
      }
    }
  }
};

final _$petstoreV3JsonJsonLiteral = {
  'openapi': '3.0',
  'info': {
    'version': '1.0.0',
    'title': 'OpenAPI Petstore',
    'license': {'name': 'MIT'}
  },
  'servers': [
    {
      'url': 'https://petstore.openapis.org/v1',
      'description': 'Development server'
    }
  ],
  'paths': {
    '/pets': {
      'get': {
        'summary': 'List all pets',
        'operationId': 'listPets',
        'tags': ['pets'],
        'parameters': [
          {
            'name': 'limit',
            'in': 'query',
            'description': 'How many items to return at one time (max 100)',
            'required': false,
            'schema': {'type': 'integer', 'format': 'int32'}
          }
        ],
        'responses': {
          '200': {
            'description': 'An paged array of pets',
            'headers': {
              'x-next': {
                'schema': {'type': 'string'},
                'description': 'A link to the next page of responses'
              }
            },
            'content': {
              'application/json': {
                'schema': {r'$ref': '#/components/schemas/Pets'}
              }
            }
          },
          'default': {
            'description': 'unexpected error',
            'content': {
              'application/json': {
                'schema': {r'$ref': '#/components/schemas/Error'}
              }
            }
          }
        }
      },
      'post': {
        'summary': 'Create a pet',
        'operationId': 'createPets',
        'tags': ['pets'],
        'responses': {
          '201': {'description': 'Null response'},
          'default': {
            'description': 'unexpected error',
            'content': {
              'application/json': {
                'schema': {r'$ref': '#/components/schemas/Error'}
              }
            }
          }
        }
      }
    },
    '/pets/{petId}': {
      'get': {
        'summary': 'Info for a specific pet',
        'operationId': 'showPetById',
        'tags': ['pets'],
        'parameters': [
          {
            'name': 'petId',
            'in': 'path',
            'required': true,
            'description': 'The id of the pet to retrieve',
            'schema': {'type': 'string'}
          }
        ],
        'responses': {
          '200': {
            'description': 'Expected response to a valid request',
            'content': {
              'application/json': {
                'schema': {r'$ref': '#/components/schemas/Pets'}
              }
            }
          },
          'default': {
            'description': 'unexpected error',
            'content': {
              'application/json': {
                'schema': {r'$ref': '#/components/schemas/Error'}
              }
            }
          }
        }
      }
    }
  },
  'components': {
    'schemas': {
      'Pet': {
        'required': ['id', 'name'],
        'properties': {
          'id': {'type': 'integer', 'format': 'int64'},
          'name': {'type': 'string'},
          'tag': {'type': 'string'}
        }
      },
      'Pets': {
        'type': 'array',
        'items': {r'$ref': '#/components/schemas/Pet'}
      },
      'Error': {
        'required': ['code', 'message'],
        'properties': {
          'code': {'type': 'integer', 'format': 'int32'},
          'message': {'type': 'string'}
        }
      }
    }
  }
};
