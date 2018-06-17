import Foundation

struct Screen : Codable {
	let availWidth : Int?
	let availHeight : Int?
	let availTop : Int?
	let availLeft : Int?
	let pixelDepth : Int?
	let colorDepth : Int?
	let width : Int?
	let height : Int?

	enum CodingKeys: String, CodingKey {

		case availWidth = "availWidth"
		case availHeight = "availHeight"
		case availTop = "availTop"
		case availLeft = "availLeft"
		case pixelDepth = "pixelDepth"
		case colorDepth = "colorDepth"
		case width = "width"
		case height = "height"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		availWidth = try values.decodeIfPresent(Int.self, forKey: .availWidth)
		availHeight = try values.decodeIfPresent(Int.self, forKey: .availHeight)
		availTop = try values.decodeIfPresent(Int.self, forKey: .availTop)
		availLeft = try values.decodeIfPresent(Int.self, forKey: .availLeft)
		pixelDepth = try values.decodeIfPresent(Int.self, forKey: .pixelDepth)
		colorDepth = try values.decodeIfPresent(Int.self, forKey: .colorDepth)
		width = try values.decodeIfPresent(Int.self, forKey: .width)
		height = try values.decodeIfPresent(Int.self, forKey: .height)
	}

}
