import Foundation

struct Custom : Codable {
    let subject : String?
    
    enum CodingKeys: String, CodingKey {
        
        case subject = "subject"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        subject = try values.decodeIfPresent(String.self, forKey: .subject)
    }
    
}
