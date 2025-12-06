#[tokio::main]
async fn main() -> Result<(), Box<dyn std::error::Error>> {
    let emoji = reqwest::get("https://wttr.in/Pushkino?format=%c")
        .await?
        .text()
        .await?;

    let temperature = reqwest::get("https://wttr.in/Pushkino?format=%t")
        .await?
        .text()
        .await?;

    println!("{} {}", emoji.trim(), temperature);

    Ok(())
}
