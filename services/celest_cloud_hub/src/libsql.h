#ifndef LIBSQL_H
#define LIBSQL_H

#include <stdbool.h>
#include <stddef.h>
#include <stdint.h>

typedef struct libsql_error_t libsql_error_t;

typedef enum {
    LIBSQL_CYPHER_DEFAULT = 0,
    LIBSQL_CYPHER_AES256,
} libsql_cypher_t;

typedef enum {
    LIBSQL_TYPE_INTEGER = 1,
    LIBSQL_TYPE_REAL = 2,
    LIBSQL_TYPE_TEXT = 3,
    LIBSQL_TYPE_BLOB = 4,
    LIBSQL_TYPE_NULL = 5,
} libsql_type_t;

typedef enum {
    LIBSQL_TRACING_LEVEL_ERROR = 1,
    LIBSQL_TRACING_LEVEL_WARN,
    LIBSQL_TRACING_LEVEL_INFO,
    LIBSQL_TRACING_LEVEL_DEBUG,
    LIBSQL_TRACING_LEVEL_TRACE,
} libsql_tracing_level_t;

typedef struct {
    const char *message;
    const char *target;
    const char *file;
    uint64_t timestamp;
    size_t line;
    libsql_tracing_level_t level;
} libsql_log_t;

typedef struct {
    libsql_error_t *err;
    void *inner;
} libsql_database_t;

typedef struct {
    libsql_error_t *err;
    void *inner;
} libsql_connection_t;

typedef struct {
    libsql_error_t *err;
    void *inner;
} libsql_statement_t;

typedef struct {
    libsql_error_t *err;
    void *inner;
} libsql_transaction_t;

typedef struct {
    libsql_error_t *err;
    void *inner;
} libsql_rows_t;

typedef struct {
    libsql_error_t *err;
    void *inner;
} libsql_row_t;

typedef struct {
    libsql_error_t *err;
} libsql_batch_t;

typedef struct {
    const void *ptr;
    size_t len;
} libsql_slice_t;

typedef union {
    int64_t integer;
    double real;
    libsql_slice_t text;
    libsql_slice_t blob;
} libsql_value_union_t;

typedef struct {
    libsql_value_union_t value;
    libsql_type_t type;
} libsql_value_t;

typedef struct {
    libsql_error_t *err;
    libsql_value_t ok;
} libsql_result_value_t;

typedef struct {
    libsql_error_t *err;
    uint64_t frame_no;
    uint64_t frames_synced;
} libsql_sync_t;

typedef struct {
    libsql_error_t *err;
} libsql_bind_t;

typedef struct {
    libsql_error_t *err;
    uint64_t rows_changed;
} libsql_execute_t;

typedef struct {
    libsql_error_t *err;
    int64_t last_inserted_rowid;
    uint64_t total_changes;
} libsql_connection_info_t;

/**
 * Database description.
 */
typedef struct {
    /** The url to the primary database */
    const char *url;
    /** Path to the database file or `:memory:` */
    const char *path;
    /** Auth token to access the primary */
    const char *auth_token;
    /** Encryption key to encrypt and decrypt the database in `path` */
    const char *encryption_key;
    /** Interval to periodicaly sync with primary */
    uint64_t sync_interval;
    /** Cypher to be used with `encryption_key` */
    libsql_cypher_t cypher;
    /** If set, disable `read_your_writes`. To mantain consistency. */
    bool disable_read_your_writes;
    /** Enable Webpki connector */
    bool webpki;
    /** Offline writes */
    bool synced;
    /** Safety assert */
    bool disable_safety_assert;
    /** Provide a namespace through a header. */
    const char *namespace;
} libsql_database_desc_t;

typedef struct {
    void (*logger)(libsql_log_t log);
    const char *version;
} libsql_config_t;

/** Setup some global info */
const libsql_error_t *libsql_setup(libsql_config_t config);

/** Get the error message from a error */
const char *libsql_error_message(libsql_error_t *self);

/** Create or open a database */
libsql_database_t libsql_database_init(libsql_database_desc_t desc);

/** Sync frames with the primary */
libsql_sync_t libsql_database_sync(libsql_database_t self);

/** Connect with the database */
libsql_connection_t libsql_database_connect(libsql_database_t self);

/** Begin a transaction */
libsql_transaction_t libsql_connection_transaction(libsql_connection_t self);

/** Send a batch statement in a connection */
libsql_batch_t
libsql_connection_batch(libsql_connection_t self, const char *sql);

/** Send a batch statement in a connection */
libsql_connection_info_t libsql_connection_info(libsql_connection_t self);

/** Send a batch statement in a transaction */
libsql_batch_t
libsql_transaction_batch(libsql_transaction_t self, const char *sql);

/** Prepare a statement in a connection */
libsql_statement_t
libsql_connection_prepare(libsql_connection_t self, const char *sql);
/** Prepare a statement in a transaction */
libsql_statement_t
libsql_transaction_prepare(libsql_transaction_t self, const char *sql);

/** Execute a statement */
libsql_execute_t libsql_statement_execute(libsql_statement_t self);
/** Query a statement */
libsql_rows_t libsql_statement_query(libsql_statement_t self);
/** Reset a statement */
void libsql_statement_reset(libsql_statement_t self);
/** Column count */
size_t libsql_statement_column_count(libsql_statement_t self);

/** Get the next row from rows */
libsql_row_t libsql_rows_next(libsql_rows_t self);
/** Get the column name at the index */
libsql_slice_t libsql_rows_column_name(libsql_rows_t self, int32_t index);
/** Get rows column count */
int32_t libsql_rows_column_count(libsql_rows_t self);

/** Get the value at the the index */
libsql_result_value_t libsql_row_value(libsql_row_t self, int32_t index);
/** Get the column name at the the index */
libsql_slice_t libsql_row_name(libsql_row_t self, int32_t index);
/** Get row column count */
int32_t libsql_row_length(libsql_row_t self);
/** Check if the row is empty, indicating the end of `libsql_rows_next` */
bool libsql_row_empty(libsql_row_t self);

/** Bind a named argument to a statement */
libsql_bind_t libsql_statement_bind_named(
    libsql_statement_t self,
    const char *name,
    libsql_value_t value
);
/** Bind a positional argument to a statement */
libsql_bind_t
libsql_statement_bind_value(libsql_statement_t self, libsql_value_t value);

/** Create a libsql integer value */
libsql_value_t libsql_integer(int64_t integer);
/** Create a libsql real value */
libsql_value_t libsql_real(double real);
/** Create a libsql text value */
libsql_value_t libsql_text(const char *ptr, size_t len);
/** Create a libsql blob value */
libsql_value_t libsql_blob(const uint8_t *ptr, size_t len);
/** Create a libsql null value */
libsql_value_t libsql_null();

/** Deallocate and close a error */
void libsql_error_deinit(libsql_error_t *self);
/** Deallocate and close a database */
void libsql_database_deinit(libsql_database_t self);
/** Deallocate and close a connection */
void libsql_connection_deinit(libsql_connection_t self);
/** Deallocate and close a statement */
void libsql_statement_deinit(libsql_statement_t self);
/** Deallocate and commit a transaction (transaction becomes invalid) */
void libsql_transaction_commit(libsql_transaction_t self);
/** Deallocate and rollback a transaction (transaction becomes invalid) */
void libsql_transaction_rollback(libsql_transaction_t self);
/** Deallocate and close rows */
void libsql_rows_deinit(libsql_rows_t self);
/** Deallocate and close a row */
void libsql_row_deinit(libsql_row_t self);
/** Deallocate a slice */
void libsql_slice_deinit(libsql_slice_t value);

#endif /* LIBSQL_H */
