import Foundation

struct Feedback : Codable {
    let id : String?
    let siteId : String?
    let email : String?
    let rating : Int?
    let comment : String?
    let labels: [String]?
    let computedBrowser : ComputedBrowser?
    let computedLocation : String?
    let geo : Geo?
    let images : Images?
    let status : String?
    let creationDate: Date?
    
    
    init(id: String? = nil, siteId: String? = nil, status: String? = nil, rating: Int? = nil, images: Images? = nil, geo: Geo? = nil, email: String? = nil, computedLocation: String? = nil, computedBrowser: ComputedBrowser? = nil, comment: String? = nil, labels: [String]? = nil, creationDate: Date? = nil) {
        self.id = id
        self.siteId = siteId
        self.status = status
        self.rating = rating
        self.images = images
        self.geo = geo
        self.email = email
        self.computedLocation = computedLocation
        self.computedBrowser = computedBrowser
        self.comment = comment
        self.labels = labels
        self.creationDate = creationDate
    }
    
    enum CodingKeys: String, CodingKey {
        case comment = "comment"
        case computedBrowser = "computed_browser"
        case computedLocation = "computed_location"
        case email = "email"
        case geo
        case images
        case rating = "rating"
        case siteId = "site_id"
        case status = "status"
        case id = "id"
        case labels
        case creationDate = "creation_date"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        geo = try values.decodeIfPresent(Geo.self, forKey: .geo)
        images = try values.decodeIfPresent(Images.self, forKey: .images)
        computedBrowser = try values.decodeIfPresent(ComputedBrowser.self, forKey: .computedBrowser)
        
        labels = try values.decodeIfPresent([String].self, forKey: .labels)
        comment = try values.decodeIfPresent(String.self, forKey: .comment)
        computedLocation = try values.decodeIfPresent(String.self, forKey: .computedLocation)
        email = try values.decodeIfPresent(String.self, forKey: .email)
        rating = try values.decodeIfPresent(Int.self, forKey: .rating)
        siteId = try values.decodeIfPresent(String.self, forKey: .siteId)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        creationDate = try values.decodeIfPresent(Date.self, forKey: .creationDate)
    }
    
}
