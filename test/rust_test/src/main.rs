use std::sync::Arc;

fn main() {
    let s = "string".to_string();
    let v = Arc::new(s);
    println!("Hello, world!");
}
