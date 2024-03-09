use std::env;
use build_target::{self, Family};

fn main() {
    if let Ok(Family::Wasm) = build_target::target_family() {
        println!("cargo:rustc-cfg=wasm");
        return;
    }

    let crate_dir = env::var("CARGO_MANIFEST_DIR").unwrap();
    
    cbindgen::Builder::new()
        .with_crate(crate_dir)
        .with_language(cbindgen::Language::C)
        .generate()
        .expect("Unable to generate bindings")
        .write_to_file("include/bindings.h");
}
