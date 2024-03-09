use std::ffi::{c_char, CStr, CString};

use once_cell::sync::OnceCell;

/// Helper function to log errors instead of panicking or returning a result.
pub fn log_on_error<F, R, EF>(f: F, context: &str, on_error: EF) -> R
where
    F: FnOnce() -> anyhow::Result<R>,
    EF: FnOnce(anyhow::Error) -> R,
{
    f().unwrap_or_else(|e| {
        log::error!("Error {}: {:?}", context, e);
        on_error(e)
    })
}

/// Initializes the logging system, writing all logs to stdout/err.
pub fn init_logging(level: log::Level) {
    static LOGGING: OnceCell<()> = OnceCell::new();
    LOGGING.get_or_init(|| {
        simple_logger::init_with_level(level).unwrap();
    });
}

/// Converts a C string to a Rust string reference.
pub fn string_from_c<'a>(name: &'static str, c_str: *const c_char) -> anyhow::Result<&'a str> {
    anyhow::ensure!(!c_str.is_null(), format!("{name} is null"));
    let c_str = unsafe { CStr::from_ptr(c_str) };
    let str = c_str.to_str()?;
    Ok(str)
}

/// Converts a nullable C string to a Rust [Option<&str>].
pub fn nullable_string_from_c<'a>(c_str: *const c_char) -> anyhow::Result<Option<&'a str>> {
    if c_str.is_null() {
        return Ok(None);
    }
    let c_str = unsafe { CStr::from_ptr(c_str) };
    let str = c_str.to_str()?;
    Ok(Some(str))
}

/// Converts a Rust string to a C string.
pub fn string_to_c<S>(s: S) -> anyhow::Result<*const c_char>
where
    S: Into<Vec<u8>>,
{
    Ok(CString::new(s)?.into_raw() as *const _)
}
