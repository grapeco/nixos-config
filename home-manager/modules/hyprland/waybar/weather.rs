use std::process::Command;

fn main() {
    let emoji = String::from_utf8(
    Command::new("curl")
            .arg("-s")
            .arg("https://wttr.in/Pushkino?format=%c")
            .output()
            .unwrap()
            .stdout
    ).unwrap();

    let temp = String::from_utf8(
    Command::new("curl")
            .arg("-s")
            .arg("https://wttr.in/Pushkino?format=%t")
            .output()
            .unwrap()
            .stdout
    ).unwrap();

    println!("{} {}", emoji.trim(), temp);
}
