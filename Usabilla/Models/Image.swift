import Foundation

struct Image : Codable {
    let uri : String?
    let width : Int?
    let height : Int?
    let url : String?
    
    init(uri: String? = nil, width: Int? = nil, height: Int? = nil, url: String? = nil) {
        self.uri = uri
        self.width = width
        self.height = height
        self.url = url
    }
    
    enum CodingKeys: String, CodingKey {
        
        case uri = "uri"
        case width = "width"
        case height = "height"
        case url = "url"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        uri = try values.decodeIfPresent(String.self, forKey: .uri)
        width = try values.decodeIfPresent(Int.self, forKey: .width)
        height = try values.decodeIfPresent(Int.self, forKey: .height)
        url = try values.decodeIfPresent(String.self, forKey: .url)
    }
    
}
