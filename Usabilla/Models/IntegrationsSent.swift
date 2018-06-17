import Foundation

struct IntegrationsSent : Codable {
    let desk : Int?
    
    enum CodingKeys: String, CodingKey {
        
        case desk = "desk"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        desk = try values.decodeIfPresent(Int.self, forKey: .desk)
    }
    
}
