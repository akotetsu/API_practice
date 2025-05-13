import Foundation

struct Country: Codable, Identifiable {
    let id = UUID() // ViewでList表示に必要な一意ID
    let name: Name
    let capital: [String]?
    let flags: Flags
    let region: String

    struct Name: Codable {
        let common: String
    }

    struct Flags: Codable {
        let png: String
    }
}
