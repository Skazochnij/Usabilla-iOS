import Foundation

struct Viewport : Codable {
    let width : Int?
    let height : Int?
    
    enum CodingKeys: String, CodingKey {
        
        case width = "width"
        case height = "height"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        width = try values.decodeIfPresent(Int.self, forKey: .width)
        height = try values.decodeIfPresent(Int.self, forKey: .height)
    }
    
}
