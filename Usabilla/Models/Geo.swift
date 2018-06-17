import Foundation

struct Geo : Codable {
	let country : String?
	let region : String?
	let city : String?
	let lat : Double?
	let lon : Double?
    
    init(country: String? = nil, region: String? = nil, city: String? = nil, lat: Double? = nil, lon: Double? = nil) {
        self.country = country
        self.region = region
        self.city = city
        self.lat = lat
        self.lon = lon
    }

	enum CodingKeys: String, CodingKey {
		case country = "country"
		case region = "region"
		case city = "city"
		case lat = "lat"
		case lon = "lon"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		country = try values.decodeIfPresent(String.self, forKey: .country)
		region = try values.decodeIfPresent(String.self, forKey: .region)
		city = try values.decodeIfPresent(String.self, forKey: .city)
		lat = try values.decodeIfPresent(Double.self, forKey: .lat)
		lon = try values.decodeIfPresent(Double.self, forKey: .lon)
	}

}
