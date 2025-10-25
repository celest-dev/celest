OpenApiDocument {
  version=3.0.0,
  info=OpenApiInfo {
    title=Bookstore,
    description=A simple Bookstore API example.,
    apiVersion=1.0.0,
    ref=#/info,
    node={title: Bookstore, description: A simple Bookstore API example., version: 1.0.0},
  },
  servers=[OpenApiServer {
    url=https://generated-bookstore.appspot.com/,
    variables={},
    ref=#/servers/0,
    node={url: https://generated-bookstore.appspot.com/},
  }],
  paths={/shelves: OpenApiComponentOrRef {
    ref=#/paths//shelves,
    component=OpenApiPathItem {
      operations={get: OpenApiOperation {
        type=get,
        tags=[],
        description=Return all shelves in the bookstore.,
        operationId=listShelves,
        parameters=[],
        responses={200: OpenApiComponentOrRef {
          ref=#/paths//shelves/get/responses/200,
          component=OpenApiResponse {
            description=List of shelves in the bookstore.,
            content={application/json: OpenApiMediaType {
              schema=OpenApiComponentOrRef {
                ref=#/paths//shelves/get/responses/200/content/application/json/schema,
                reference=OpenApiSchemaReference {
                  ref=#/components/schemas/listShelvesResponse,
                  name=listShelvesResponse,
                  node={$ref: #/components/schemas/listShelvesResponse},
                },
                node={$ref: #/components/schemas/listShelvesResponse},
              },
              encoding={},
              ref=#/paths//shelves/get/responses/200/content/application/json,
              node={schema: {$ref: #/components/schemas/listShelvesResponse}},
            }},
            ref=#/paths//shelves/get/responses/200,
            node={description: List of shelves in the bookstore., content: {application/json: {schema: {$ref: #/components/schemas/listShelvesResponse}}}},
          },
        }},
      }, post: OpenApiOperation {
        type=post,
        tags=[],
        description=Create a new shelf in the bookstore.,
        operationId=createShelf,
        parameters=[],
        requestBody=OpenApiComponentOrRef {
          ref=#/paths//shelves/post/requestBody,
          component=OpenApiRequestBody {
            content={application/json: OpenApiMediaType {
              schema=OpenApiComponentOrRef {
                ref=#/paths//shelves/post/requestBody/content/application/json/schema,
                reference=OpenApiSchemaReference {
                  ref=#/components/schemas/shelf,
                  name=shelf,
                  node={$ref: #/components/schemas/shelf},
                },
                node={$ref: #/components/schemas/shelf},
              },
              encoding={},
              ref=#/paths//shelves/post/requestBody/content/application/json,
              node={schema: {$ref: #/components/schemas/shelf}},
            }},
            description=A shelf resource to create.,
            required=true,
            ref=#/paths//shelves/post/requestBody,
            node={description: A shelf resource to create., content: {application/json: {schema: {$ref: #/components/schemas/shelf}}}, required: true},
          },
        },
        responses={200: OpenApiComponentOrRef {
          ref=#/paths//shelves/post/responses/200,
          component=OpenApiResponse {
            description=A newly created shelf resource.,
            content={application/json: OpenApiMediaType {
              schema=OpenApiComponentOrRef {
                ref=#/paths//shelves/post/responses/200/content/application/json/schema,
                reference=OpenApiSchemaReference {
                  ref=#/components/schemas/shelf,
                  name=shelf,
                  node={$ref: #/components/schemas/shelf},
                },
                node={$ref: #/components/schemas/shelf},
              },
              encoding={},
              ref=#/paths//shelves/post/responses/200/content/application/json,
              node={schema: {$ref: #/components/schemas/shelf}},
            }},
            ref=#/paths//shelves/post/responses/200,
            node={description: A newly created shelf resource., content: {application/json: {schema: {$ref: #/components/schemas/shelf}}}},
          },
        }},
      }, delete: OpenApiOperation {
        type=delete,
        tags=[],
        description=Delete all shelves.,
        operationId=deleteShelves,
        parameters=[],
        responses={},
        defaultResponse=OpenApiComponentOrRef {
          ref=#/paths//shelves/delete/responses/default,
          component=OpenApiResponse {
            description=An empty response body.,
            ref=#/paths//shelves/delete/responses/default,
            node={description: An empty response body.},
          },
        },
      }},
      parameters=[],
      ref=#/paths//shelves,
      node={get: {description: Return all shelves in the bookstore., operationId: listShelves, responses: {200: {description: List of shelves in the bookstore., content: {application/json: {schema: {$ref: #/components/schemas/listShelvesResponse}}}}}}, post: {description: Create a new shelf in the bookstore., operationId: createShelf, requestBody: {description: A shelf resource to create., content: {application/json: {schema: {$ref: #/components/schemas/shelf}}}, required: true}, responses: {200: {description: A newly created shelf resource., content: {application/json: {schema: {$ref: #/components/schemas/shelf}}}}}}, delete: {description: Delete all shelves., operationId: deleteShelves, responses: {default: {description: An empty response body.}}}},
    },
  }, /shelves/{shelf}: OpenApiComponentOrRef {
    ref=#/paths//shelves/{shelf},
    component=OpenApiPathItem {
      operations={get: OpenApiOperation {
        type=get,
        tags=[],
        description=Get a single shelf resource with the given ID.,
        operationId=getShelf,
        parameters=[OpenApiComponentOrRef {
          ref=#/paths//shelves/{shelf}/get/parameters/0,
          component=OpenApiParameter {
            name=shelf,
            location=path,
            description=ID of the shelf to get.,
            required=true,
            schema=OpenApiComponentOrRef {
              ref=#/paths//shelves/{shelf}/get/parameters/0/schema,
              component=OpenApiSchema {
                type=integer,
                format=int64,
                ref=#/paths//shelves/{shelf}/get/parameters/0/schema,
                node={type: integer, format: int64},
              },
            },
            ref=#/paths//shelves/{shelf}/get/parameters/0,
            node={name: shelf, in: path, description: ID of the shelf to get., required: true, schema: {type: integer, format: int64}},
          },
        }],
        responses={200: OpenApiComponentOrRef {
          ref=#/paths//shelves/{shelf}/get/responses/200,
          component=OpenApiResponse {
            description=A shelf resource.,
            content={application/json: OpenApiMediaType {
              schema=OpenApiComponentOrRef {
                ref=#/paths//shelves/{shelf}/get/responses/200/content/application/json/schema,
                reference=OpenApiSchemaReference {
                  ref=#/components/schemas/shelf,
                  name=shelf,
                  node={$ref: #/components/schemas/shelf},
                },
                node={$ref: #/components/schemas/shelf},
              },
              encoding={},
              ref=#/paths//shelves/{shelf}/get/responses/200/content/application/json,
              node={schema: {$ref: #/components/schemas/shelf}},
            }},
            ref=#/paths//shelves/{shelf}/get/responses/200,
            node={description: A shelf resource., content: {application/json: {schema: {$ref: #/components/schemas/shelf}}}},
          },
        }},
        defaultResponse=OpenApiComponentOrRef {
          ref=#/paths//shelves/{shelf}/get/responses/default,
          component=OpenApiResponse {
            description=unexpected error,
            content={application/json: OpenApiMediaType {
              schema=OpenApiComponentOrRef {
                ref=#/paths//shelves/{shelf}/get/responses/default/content/application/json/schema,
                reference=OpenApiSchemaReference {
                  ref=#/components/schemas/error,
                  name=error,
                  node={$ref: #/components/schemas/error},
                },
                node={$ref: #/components/schemas/error},
              },
              encoding={},
              ref=#/paths//shelves/{shelf}/get/responses/default/content/application/json,
              node={schema: {$ref: #/components/schemas/error}},
            }},
            ref=#/paths//shelves/{shelf}/get/responses/default,
            node={description: unexpected error, content: {application/json: {schema: {$ref: #/components/schemas/error}}}},
          },
        },
      }, delete: OpenApiOperation {
        type=delete,
        tags=[],
        description=Delete a single shelf with the given ID.,
        operationId=deleteShelf,
        parameters=[OpenApiComponentOrRef {
          ref=#/paths//shelves/{shelf}/delete/parameters/0,
          component=OpenApiParameter {
            name=shelf,
            location=path,
            description=ID of the shelf to delete.,
            required=true,
            schema=OpenApiComponentOrRef {
              ref=#/paths//shelves/{shelf}/delete/parameters/0/schema,
              component=OpenApiSchema {
                type=integer,
                format=int64,
                ref=#/paths//shelves/{shelf}/delete/parameters/0/schema,
                node={type: integer, format: int64},
              },
            },
            ref=#/paths//shelves/{shelf}/delete/parameters/0,
            node={name: shelf, in: path, description: ID of the shelf to delete., required: true, schema: {type: integer, format: int64}},
          },
        }],
        responses={},
        defaultResponse=OpenApiComponentOrRef {
          ref=#/paths//shelves/{shelf}/delete/responses/default,
          component=OpenApiResponse {
            description=An empty response body.,
            ref=#/paths//shelves/{shelf}/delete/responses/default,
            node={description: An empty response body.},
          },
        },
      }},
      parameters=[],
      ref=#/paths//shelves/{shelf},
      node={get: {description: Get a single shelf resource with the given ID., operationId: getShelf, parameters: [{name: shelf, in: path, description: ID of the shelf to get., required: true, schema: {type: integer, format: int64}}], responses: {default: {description: unexpected error, content: {application/json: {schema: {$ref: #/components/schemas/error}}}}, 200: {description: A shelf resource., content: {application/json: {schema: {$ref: #/components/schemas/shelf}}}}}}, delete: {description: Delete a single shelf with the given ID., operationId: deleteShelf, parameters: [{name: shelf, in: path, description: ID of the shelf to delete., required: true, schema: {type: integer, format: int64}}], responses: {default: {description: An empty response body.}}}},
    },
  }, /shelves/{shelf}/books: OpenApiComponentOrRef {
    ref=#/paths//shelves/{shelf}/books,
    component=OpenApiPathItem {
      operations={get: OpenApiOperation {
        type=get,
        tags=[],
        description=Return all books in a shelf with the given ID.,
        operationId=listBooks,
        parameters=[OpenApiComponentOrRef {
          ref=#/paths//shelves/{shelf}/books/get/parameters/0,
          component=OpenApiParameter {
            name=shelf,
            location=path,
            description=ID of the shelf whose books should be returned.,
            required=true,
            schema=OpenApiComponentOrRef {
              ref=#/paths//shelves/{shelf}/books/get/parameters/0/schema,
              component=OpenApiSchema {
                type=integer,
                format=int64,
                ref=#/paths//shelves/{shelf}/books/get/parameters/0/schema,
                node={type: integer, format: int64},
              },
            },
            ref=#/paths//shelves/{shelf}/books/get/parameters/0,
            node={name: shelf, in: path, description: ID of the shelf whose books should be returned., required: true, schema: {type: integer, format: int64}},
          },
        }],
        responses={200: OpenApiComponentOrRef {
          ref=#/paths//shelves/{shelf}/books/get/responses/200,
          component=OpenApiResponse {
            description=List of books on the specified shelf.,
            content={application/json: OpenApiMediaType {
              schema=OpenApiComponentOrRef {
                ref=#/paths//shelves/{shelf}/books/get/responses/200/content/application/json/schema,
                reference=OpenApiSchemaReference {
                  ref=#/components/schemas/listBooksResponse,
                  name=listBooksResponse,
                  node={$ref: #/components/schemas/listBooksResponse},
                },
                node={$ref: #/components/schemas/listBooksResponse},
              },
              encoding={},
              ref=#/paths//shelves/{shelf}/books/get/responses/200/content/application/json,
              node={schema: {$ref: #/components/schemas/listBooksResponse}},
            }},
            ref=#/paths//shelves/{shelf}/books/get/responses/200,
            node={description: List of books on the specified shelf., content: {application/json: {schema: {$ref: #/components/schemas/listBooksResponse}}}},
          },
        }},
        defaultResponse=OpenApiComponentOrRef {
          ref=#/paths//shelves/{shelf}/books/get/responses/default,
          component=OpenApiResponse {
            description=unexpected error,
            content={application/json: OpenApiMediaType {
              schema=OpenApiComponentOrRef {
                ref=#/paths//shelves/{shelf}/books/get/responses/default/content/application/json/schema,
                reference=OpenApiSchemaReference {
                  ref=#/components/schemas/error,
                  name=error,
                  node={$ref: #/components/schemas/error},
                },
                node={$ref: #/components/schemas/error},
              },
              encoding={},
              ref=#/paths//shelves/{shelf}/books/get/responses/default/content/application/json,
              node={schema: {$ref: #/components/schemas/error}},
            }},
            ref=#/paths//shelves/{shelf}/books/get/responses/default,
            node={description: unexpected error, content: {application/json: {schema: {$ref: #/components/schemas/error}}}},
          },
        },
      }, post: OpenApiOperation {
        type=post,
        tags=[],
        description=Create a new book on the shelf.,
        operationId=createBook,
        parameters=[OpenApiComponentOrRef {
          ref=#/paths//shelves/{shelf}/books/post/parameters/0,
          component=OpenApiParameter {
            name=shelf,
            location=path,
            description=ID of the shelf where the book should be created.,
            required=true,
            schema=OpenApiComponentOrRef {
              ref=#/paths//shelves/{shelf}/books/post/parameters/0/schema,
              component=OpenApiSchema {
                type=integer,
                format=int64,
                ref=#/paths//shelves/{shelf}/books/post/parameters/0/schema,
                node={type: integer, format: int64},
              },
            },
            ref=#/paths//shelves/{shelf}/books/post/parameters/0,
            node={name: shelf, in: path, description: ID of the shelf where the book should be created., required: true, schema: {type: integer, format: int64}},
          },
        }],
        requestBody=OpenApiComponentOrRef {
          ref=#/paths//shelves/{shelf}/books/post/requestBody,
          component=OpenApiRequestBody {
            content={application/json: OpenApiMediaType {
              schema=OpenApiComponentOrRef {
                ref=#/paths//shelves/{shelf}/books/post/requestBody/content/application/json/schema,
                reference=OpenApiSchemaReference {
                  ref=#/components/schemas/book,
                  name=book,
                  node={$ref: #/components/schemas/book},
                },
                node={$ref: #/components/schemas/book},
              },
              encoding={},
              ref=#/paths//shelves/{shelf}/books/post/requestBody/content/application/json,
              node={schema: {$ref: #/components/schemas/book}},
            }},
            description=Book to create.,
            required=true,
            ref=#/paths//shelves/{shelf}/books/post/requestBody,
            node={description: Book to create., content: {application/json: {schema: {$ref: #/components/schemas/book}}}, required: true},
          },
        },
        responses={200: OpenApiComponentOrRef {
          ref=#/paths//shelves/{shelf}/books/post/responses/200,
          component=OpenApiResponse {
            description=A newly created book resource.,
            content={application/json: OpenApiMediaType {
              schema=OpenApiComponentOrRef {
                ref=#/paths//shelves/{shelf}/books/post/responses/200/content/application/json/schema,
                reference=OpenApiSchemaReference {
                  ref=#/components/schemas/book,
                  name=book,
                  node={$ref: #/components/schemas/book},
                },
                node={$ref: #/components/schemas/book},
              },
              encoding={},
              ref=#/paths//shelves/{shelf}/books/post/responses/200/content/application/json,
              node={schema: {$ref: #/components/schemas/book}},
            }},
            ref=#/paths//shelves/{shelf}/books/post/responses/200,
            node={description: A newly created book resource., content: {application/json: {schema: {$ref: #/components/schemas/book}}}},
          },
        }},
        defaultResponse=OpenApiComponentOrRef {
          ref=#/paths//shelves/{shelf}/books/post/responses/default,
          component=OpenApiResponse {
            description=unexpected error,
            content={application/json: OpenApiMediaType {
              schema=OpenApiComponentOrRef {
                ref=#/paths//shelves/{shelf}/books/post/responses/default/content/application/json/schema,
                reference=OpenApiSchemaReference {
                  ref=#/components/schemas/error,
                  name=error,
                  node={$ref: #/components/schemas/error},
                },
                node={$ref: #/components/schemas/error},
              },
              encoding={},
              ref=#/paths//shelves/{shelf}/books/post/responses/default/content/application/json,
              node={schema: {$ref: #/components/schemas/error}},
            }},
            ref=#/paths//shelves/{shelf}/books/post/responses/default,
            node={description: unexpected error, content: {application/json: {schema: {$ref: #/components/schemas/error}}}},
          },
        },
      }},
      parameters=[],
      ref=#/paths//shelves/{shelf}/books,
      node={get: {description: Return all books in a shelf with the given ID., operationId: listBooks, parameters: [{name: shelf, in: path, description: ID of the shelf whose books should be returned., required: true, schema: {type: integer, format: int64}}], responses: {default: {description: unexpected error, content: {application/json: {schema: {$ref: #/components/schemas/error}}}}, 200: {description: List of books on the specified shelf., content: {application/json: {schema: {$ref: #/components/schemas/listBooksResponse}}}}}}, post: {description: Create a new book on the shelf., operationId: createBook, parameters: [{name: shelf, in: path, description: ID of the shelf where the book should be created., required: true, schema: {type: integer, format: int64}}], requestBody: {description: Book to create., content: {application/json: {schema: {$ref: #/components/schemas/book}}}, required: true}, responses: {default: {description: unexpected error, content: {application/json: {schema: {$ref: #/components/schemas/error}}}}, 200: {description: A newly created book resource., content: {application/json: {schema: {$ref: #/components/schemas/book}}}}}}},
    },
  }, /shelves/{shelf}/books/{book}: OpenApiComponentOrRef {
    ref=#/paths//shelves/{shelf}/books/{book},
    component=OpenApiPathItem {
      operations={get: OpenApiOperation {
        type=get,
        tags=[],
        description=Get a single book with a given ID from a shelf.,
        operationId=getBook,
        parameters=[OpenApiComponentOrRef {
          ref=#/paths//shelves/{shelf}/books/{book}/get/parameters/0,
          component=OpenApiParameter {
            name=shelf,
            location=path,
            description=ID of the shelf from which to get the book.,
            required=true,
            schema=OpenApiComponentOrRef {
              ref=#/paths//shelves/{shelf}/books/{book}/get/parameters/0/schema,
              component=OpenApiSchema {
                type=integer,
                format=int64,
                ref=#/paths//shelves/{shelf}/books/{book}/get/parameters/0/schema,
                node={type: integer, format: int64},
              },
            },
            ref=#/paths//shelves/{shelf}/books/{book}/get/parameters/0,
            node={name: shelf, in: path, description: ID of the shelf from which to get the book., required: true, schema: {type: integer, format: int64}},
          },
        }, OpenApiComponentOrRef {
          ref=#/paths//shelves/{shelf}/books/{book}/get/parameters/1,
          component=OpenApiParameter {
            name=book,
            location=path,
            description=ID of the book to get from the shelf.,
            required=true,
            schema=OpenApiComponentOrRef {
              ref=#/paths//shelves/{shelf}/books/{book}/get/parameters/1/schema,
              component=OpenApiSchema {
                type=integer,
                format=int64,
                ref=#/paths//shelves/{shelf}/books/{book}/get/parameters/1/schema,
                node={type: integer, format: int64},
              },
            },
            ref=#/paths//shelves/{shelf}/books/{book}/get/parameters/1,
            node={name: book, in: path, description: ID of the book to get from the shelf., required: true, schema: {type: integer, format: int64}},
          },
        }],
        responses={200: OpenApiComponentOrRef {
          ref=#/paths//shelves/{shelf}/books/{book}/get/responses/200,
          component=OpenApiResponse {
            description=A book resource.,
            content={application/json: OpenApiMediaType {
              schema=OpenApiComponentOrRef {
                ref=#/paths//shelves/{shelf}/books/{book}/get/responses/200/content/application/json/schema,
                reference=OpenApiSchemaReference {
                  ref=#/components/schemas/book,
                  name=book,
                  node={$ref: #/components/schemas/book},
                },
                node={$ref: #/components/schemas/book},
              },
              encoding={},
              ref=#/paths//shelves/{shelf}/books/{book}/get/responses/200/content/application/json,
              node={schema: {$ref: #/components/schemas/book}},
            }},
            ref=#/paths//shelves/{shelf}/books/{book}/get/responses/200,
            node={description: A book resource., content: {application/json: {schema: {$ref: #/components/schemas/book}}}},
          },
        }},
        defaultResponse=OpenApiComponentOrRef {
          ref=#/paths//shelves/{shelf}/books/{book}/get/responses/default,
          component=OpenApiResponse {
            description=unexpected error,
            content={application/json: OpenApiMediaType {
              schema=OpenApiComponentOrRef {
                ref=#/paths//shelves/{shelf}/books/{book}/get/responses/default/content/application/json/schema,
                reference=OpenApiSchemaReference {
                  ref=#/components/schemas/error,
                  name=error,
                  node={$ref: #/components/schemas/error},
                },
                node={$ref: #/components/schemas/error},
              },
              encoding={},
              ref=#/paths//shelves/{shelf}/books/{book}/get/responses/default/content/application/json,
              node={schema: {$ref: #/components/schemas/error}},
            }},
            ref=#/paths//shelves/{shelf}/books/{book}/get/responses/default,
            node={description: unexpected error, content: {application/json: {schema: {$ref: #/components/schemas/error}}}},
          },
        },
      }, delete: OpenApiOperation {
        type=delete,
        tags=[],
        description=Delete a single book with a given ID from a shelf.,
        operationId=deleteBook,
        parameters=[OpenApiComponentOrRef {
          ref=#/paths//shelves/{shelf}/books/{book}/delete/parameters/0,
          component=OpenApiParameter {
            name=shelf,
            location=path,
            description=ID of the shelf from which to delete the book.,
            required=true,
            schema=OpenApiComponentOrRef {
              ref=#/paths//shelves/{shelf}/books/{book}/delete/parameters/0/schema,
              component=OpenApiSchema {
                type=integer,
                format=int64,
                ref=#/paths//shelves/{shelf}/books/{book}/delete/parameters/0/schema,
                node={type: integer, format: int64},
              },
            },
            ref=#/paths//shelves/{shelf}/books/{book}/delete/parameters/0,
            node={name: shelf, in: path, description: ID of the shelf from which to delete the book., required: true, schema: {type: integer, format: int64}},
          },
        }, OpenApiComponentOrRef {
          ref=#/paths//shelves/{shelf}/books/{book}/delete/parameters/1,
          component=OpenApiParameter {
            name=book,
            location=path,
            description=ID of the book to delete from the shelf.,
            required=true,
            schema=OpenApiComponentOrRef {
              ref=#/paths//shelves/{shelf}/books/{book}/delete/parameters/1/schema,
              component=OpenApiSchema {
                type=integer,
                format=int64,
                ref=#/paths//shelves/{shelf}/books/{book}/delete/parameters/1/schema,
                node={type: integer, format: int64},
              },
            },
            ref=#/paths//shelves/{shelf}/books/{book}/delete/parameters/1,
            node={name: book, in: path, description: ID of the book to delete from the shelf., required: true, schema: {type: integer, format: int64}},
          },
        }],
        responses={},
        defaultResponse=OpenApiComponentOrRef {
          ref=#/paths//shelves/{shelf}/books/{book}/delete/responses/default,
          component=OpenApiResponse {
            description=An empty response body.,
            ref=#/paths//shelves/{shelf}/books/{book}/delete/responses/default,
            node={description: An empty response body.},
          },
        },
      }},
      parameters=[],
      ref=#/paths//shelves/{shelf}/books/{book},
      node={get: {description: Get a single book with a given ID from a shelf., operationId: getBook, parameters: [{name: shelf, in: path, description: ID of the shelf from which to get the book., required: true, schema: {type: integer, format: int64}}, {name: book, in: path, description: ID of the book to get from the shelf., required: true, schema: {type: integer, format: int64}}], responses: {default: {description: unexpected error, content: {application/json: {schema: {$ref: #/components/schemas/error}}}}, 200: {description: A book resource., content: {application/json: {schema: {$ref: #/components/schemas/book}}}}}}, delete: {description: Delete a single book with a given ID from a shelf., operationId: deleteBook, parameters: [{name: shelf, in: path, description: ID of the shelf from which to delete the book., required: true, schema: {type: integer, format: int64}}, {name: book, in: path, description: ID of the book to delete from the shelf., required: true, schema: {type: integer, format: int64}}], responses: {default: {description: An empty response body.}}}},
    },
  }},
  components=OpenApiComponents {
    schemas={book: OpenApiSchema {
      name=book,
      type=object,
      properties={author: OpenApiComponentOrRef {
        ref=#/components/schemas/book/properties/author,
        component=OpenApiSchema {
          name=author,
          type=string,
          ref=#/components/schemas/book/properties/author,
          node={type: string},
        },
      }, name: OpenApiComponentOrRef {
        ref=#/components/schemas/book/properties/name,
        component=OpenApiSchema {
          name=name,
          type=string,
          ref=#/components/schemas/book/properties/name,
          node={type: string},
        },
      }, title: OpenApiComponentOrRef {
        ref=#/components/schemas/book/properties/title,
        component=OpenApiSchema {
          name=title,
          type=string,
          ref=#/components/schemas/book/properties/title,
          node={type: string},
        },
      }},
      required={name, author, title},
      ref=#/components/schemas/book,
      node={required: [name, author, title], type: object, properties: {author: {type: string}, name: {type: string}, title: {type: string}}},
    }, listBooksResponse: OpenApiSchema {
      name=listBooksResponse,
      type=object,
      properties={books: OpenApiComponentOrRef {
        ref=#/components/schemas/listBooksResponse/properties/books,
        component=OpenApiSchema {
          name=books,
          type=array,
          items=OpenApiComponentOrRef {
            ref=#/components/schemas/listBooksResponse/properties/books/items,
            reference=OpenApiSchemaReference {
              ref=#/components/schemas/book,
              name=book,
              node={$ref: #/components/schemas/book},
            },
            node={$ref: #/components/schemas/book},
          },
          ref=#/components/schemas/listBooksResponse/properties/books,
          node={type: array, items: {$ref: #/components/schemas/book}},
        },
      }},
      required={books},
      ref=#/components/schemas/listBooksResponse,
      node={required: [books], type: object, properties: {books: {type: array, items: {$ref: #/components/schemas/book}}}},
    }, listShelvesResponse: OpenApiSchema {
      name=listShelvesResponse,
      type=object,
      properties={shelves: OpenApiComponentOrRef {
        ref=#/components/schemas/listShelvesResponse/properties/shelves,
        component=OpenApiSchema {
          name=shelves,
          type=array,
          items=OpenApiComponentOrRef {
            ref=#/components/schemas/listShelvesResponse/properties/shelves/items,
            reference=OpenApiSchemaReference {
              ref=#/components/schemas/shelf,
              name=shelf,
              node={$ref: #/components/schemas/shelf},
            },
            node={$ref: #/components/schemas/shelf},
          },
          ref=#/components/schemas/listShelvesResponse/properties/shelves,
          node={type: array, items: {$ref: #/components/schemas/shelf}},
        },
      }},
      ref=#/components/schemas/listShelvesResponse,
      node={type: object, properties: {shelves: {type: array, items: {$ref: #/components/schemas/shelf}}}},
    }, shelf: OpenApiSchema {
      name=shelf,
      type=object,
      properties={name: OpenApiComponentOrRef {
        ref=#/components/schemas/shelf/properties/name,
        component=OpenApiSchema {
          name=name,
          type=string,
          ref=#/components/schemas/shelf/properties/name,
          node={type: string},
        },
      }, theme: OpenApiComponentOrRef {
        ref=#/components/schemas/shelf/properties/theme,
        component=OpenApiSchema {
          name=theme,
          type=string,
          ref=#/components/schemas/shelf/properties/theme,
          node={type: string},
        },
      }},
      required={name, theme},
      ref=#/components/schemas/shelf,
      node={required: [name, theme], type: object, properties: {name: {type: string}, theme: {type: string}}},
    }, error: OpenApiSchema {
      name=error,
      type=object,
      properties={code: OpenApiComponentOrRef {
        ref=#/components/schemas/error/properties/code,
        component=OpenApiSchema {
          name=code,
          type=integer,
          format=int32,
          ref=#/components/schemas/error/properties/code,
          node={type: integer, format: int32},
        },
      }, message: OpenApiComponentOrRef {
        ref=#/components/schemas/error/properties/message,
        component=OpenApiSchema {
          name=message,
          type=string,
          ref=#/components/schemas/error/properties/message,
          node={type: string},
        },
      }},
      required={code, message},
      ref=#/components/schemas/error,
      node={required: [code, message], type: object, properties: {code: {type: integer, format: int32}, message: {type: string}}},
    }},
    responses={},
    parameters={},
    requestBodies={},
    headers={},
    securitySchemes={api_key: OpenApiSecurityScheme {
      type=apiKey,
      name=key,
      location=query,
      ref=#/components/securitySchemes/api_key,
      node={type: apiKey, name: key, in: query},
    }},
    paths={},
    ref=#/components,
    node={schemas: {book: {required: [name, author, title], type: object, properties: {author: {type: string}, name: {type: string}, title: {type: string}}}, listBooksResponse: {required: [books], type: object, properties: {books: {type: array, items: {$ref: #/components/schemas/book}}}}, listShelvesResponse: {type: object, properties: {shelves: {type: array, items: {$ref: #/components/schemas/shelf}}}}, shelf: {required: [name, theme], type: object, properties: {name: {type: string}, theme: {type: string}}}, error: {required: [code, message], type: object, properties: {code: {type: integer, format: int32}, message: {type: string}}}}, securitySchemes: {api_key: {type: apiKey, name: key, in: query}}},
  },
  securityRequirements=[OpenApiSecurityRequirement {
    schemes={api_key: []},
    ref=#/security/0,
    node={api_key: []},
  }],
  tags=[],
  ref=#,
  node={openapi: 3.0.0, info: {title: Bookstore, description: A simple Bookstore API example., version: 1.0.0}, servers: [{url: https://generated-bookstore.appspot.com/}], paths: {/shelves: {get: {description: Return all shelves in the bookstore., operationId: listShelves, responses: {200: {description: List of shelves in the bookstore., content: {application/json: {schema: {$ref: #/components/schemas/listShelvesResponse}}}}}}, post: {description: Create a new shelf in the bookstore., operationId: createShelf, requestBody: {description: A shelf resource to create., content: {application/json: {schema: {$ref: #/components/schemas/shelf}}}, required: true}, responses: {200: {description: A newly created shelf resource., content: {application/json: {schema: {$ref: #/components/schemas/shelf}}}}}}, delete: {description: Delete all shelves., operationId: deleteShelves, responses: {default: {description: An empty response body.}}}}, /shelves/{shelf}: {get: {description: Get a single shelf resource with the given ID., operationId: getShelf, parameters: [{name: shelf, in: path, description: ID of the shelf to get., required: true, schema: {type: integer, format: int64}}], responses: {default: {description: unexpected error, content: {application/json: {schema: {$ref: #/components/schemas/error}}}}, 200: {description: A shelf resource., content: {application/json: {schema: {$ref: #/components/schemas/shelf}}}}}}, delete: {description: Delete a single shelf with the given ID., operationId: deleteShelf, parameters: [{name: shelf, in: path, description: ID of the shelf to delete., required: true, schema: {type: integer, format: int64}}], responses: {default: {description: An empty response body.}}}}, /shelves/{shelf}/books: {get: {description: Return all books in a shelf with the given ID., operationId: listBooks, parameters: [{name: shelf, in: path, description: ID of the shelf whose books should be returned., required: true, schema: {type: integer, format: int64}}], responses: {default: {description: unexpected error, content: {application/json: {schema: {$ref: #/components/schemas/error}}}}, 200: {description: List of books on the specified shelf., content: {application/json: {schema: {$ref: #/components/schemas/listBooksResponse}}}}}}, post: {description: Create a new book on the shelf., operationId: createBook, parameters: [{name: shelf, in: path, description: ID of the shelf where the book should be created., required: true, schema: {type: integer, format: int64}}], requestBody: {description: Book to create., content: {application/json: {schema: {$ref: #/components/schemas/book}}}, required: true}, responses: {default: {description: unexpected error, content: {application/json: {schema: {$ref: #/components/schemas/error}}}}, 200: {description: A newly created book resource., content: {application/json: {schema: {$ref: #/components/schemas/book}}}}}}}, /shelves/{shelf}/books/{book}: {get: {description: Get a single book with a given ID from a shelf., operationId: getBook, parameters: [{name: shelf, in: path, description: ID of the shelf from which to get the book., required: true, schema: {type: integer, format: int64}}, {name: book, in: path, description: ID of the book to get from the shelf., required: true, schema: {type: integer, format: int64}}], responses: {default: {description: unexpected error, content: {application/json: {schema: {$ref: #/components/schemas/error}}}}, 200: {description: A book resource., content: {application/json: {schema: {$ref: #/components/schemas/book}}}}}}, delete: {description: Delete a single book with a given ID from a shelf., operationId: deleteBook, parameters: [{name: shelf, in: path, description: ID of the shelf from which to delete the book., required: true, schema: {type: integer, format: int64}}, {name: book, in: path, description: ID of the book to delete from the shelf., required: true, schema: {type: integer, format: int64}}], responses: {default: {description: An empty response body.}}}}}, components: {schemas: {book: {required: [name, author, title], type: object, properties: {author: {type: string}, name: {type: string}, title: {type: string}}}, listBooksResponse: {required: [books], type: object, properties: {books: {type: array, items: {$ref: #/components/schemas/book}}}}, listShelvesResponse: {type: object, properties: {shelves: {type: array, items: {$ref: #/components/schemas/shelf}}}}, shelf: {required: [name, theme], type: object, properties: {name: {type: string}, theme: {type: string}}}, error: {required: [code, message], type: object, properties: {code: {type: integer, format: int32}, message: {type: string}}}}, securitySchemes: {api_key: {type: apiKey, name: key, in: query}}}, security: [{api_key: []}]},
}