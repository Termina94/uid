use uuid::Uuid;

fn main() {
    if let Some(arg) = std::env::args().nth(1) {
        if let Ok(num) = u32::from_str_radix(&arg, 10) {
            for _ in 0..num {
                println!("{}", Uuid::new_v4());
            }
        }
        return;
    }

    println!("{}", Uuid::new_v4().to_string());
}
