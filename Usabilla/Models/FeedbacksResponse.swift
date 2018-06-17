import Foundation

struct FeedbacksResponse : Codable {
	let items : [Feedback]?
	let count : Int?
	let countNoLimit : Int?
	let total : Int?

	enum CodingKeys: String, CodingKey {

		case items = "items"
		case count = "count"
		case countNoLimit = "count_nolimit"
		case total = "total"
	}
}
