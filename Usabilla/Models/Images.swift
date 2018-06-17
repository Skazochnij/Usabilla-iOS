import Foundation

struct Images : Codable {
    let screenshot : Image?
    let thumbnail : Image?
    let cropped : Image?
    let grid : Image?
    let list : Image?
    let detail : Image?
    
    init(screenshot : Image? = nil, thumbnail : Image? = nil, cropped : Image? = nil, grid : Image? = nil, list : Image? = nil, detail : Image? = nil) {
        self.screenshot = screenshot
        self.thumbnail = thumbnail
        self.cropped = cropped
        self.grid = grid
        self.list = list
        self.detail = detail
    }
    
    enum CodingKeys: String, CodingKey {
        
        case screenshot
        case thumbnail
        case cropped
        case grid
        case list
        case detail
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        screenshot = try values.decodeIfPresent(Image.self, forKey: .screenshot)
        thumbnail = try values.decodeIfPresent(Image.self, forKey: .thumbnail)
        cropped = try values.decodeIfPresent(Image.self, forKey: .cropped)
        grid = try values.decodeIfPresent(Image.self, forKey: .grid)
        list = try values.decodeIfPresent(Image.self, forKey: .list)
        detail = try values.decodeIfPresent(Image.self, forKey: .detail)
    }
}
