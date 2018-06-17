import Foundation

struct Timing : Codable {
	let loadEventEnd : Int?
	let loadEventStart : Int?
	let domComplete : Int?
	let domContentLoadedEventEnd : Int?
	let domContentLoadedEventStart : Int?
	let domInteractive : Int?
	let domLoading : Int?
	let responseEnd : Int?
	let responseStart : Int?
	let requestStart : Int?
	let secureConnectionStart : Int?
	let connectEnd : Int?
	let connectStart : Int?
	let domainLookupEnd : Int?
	let domainLookupStart : Int?
	let fetchStart : Int?
	let redirectEnd : Int?
	let redirectStart : Int?
	let unloadEventEnd : Int?
	let unloadEventStart : Int?
	let navigationStart : Int?

	enum CodingKeys: String, CodingKey {

		case loadEventEnd = "loadEventEnd"
		case loadEventStart = "loadEventStart"
		case domComplete = "domComplete"
		case domContentLoadedEventEnd = "domContentLoadedEventEnd"
		case domContentLoadedEventStart = "domContentLoadedEventStart"
		case domInteractive = "domInteractive"
		case domLoading = "domLoading"
		case responseEnd = "responseEnd"
		case responseStart = "responseStart"
		case requestStart = "requestStart"
		case secureConnectionStart = "secureConnectionStart"
		case connectEnd = "connectEnd"
		case connectStart = "connectStart"
		case domainLookupEnd = "domainLookupEnd"
		case domainLookupStart = "domainLookupStart"
		case fetchStart = "fetchStart"
		case redirectEnd = "redirectEnd"
		case redirectStart = "redirectStart"
		case unloadEventEnd = "unloadEventEnd"
		case unloadEventStart = "unloadEventStart"
		case navigationStart = "navigationStart"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		loadEventEnd = try values.decodeIfPresent(Int.self, forKey: .loadEventEnd)
		loadEventStart = try values.decodeIfPresent(Int.self, forKey: .loadEventStart)
		domComplete = try values.decodeIfPresent(Int.self, forKey: .domComplete)
		domContentLoadedEventEnd = try values.decodeIfPresent(Int.self, forKey: .domContentLoadedEventEnd)
		domContentLoadedEventStart = try values.decodeIfPresent(Int.self, forKey: .domContentLoadedEventStart)
		domInteractive = try values.decodeIfPresent(Int.self, forKey: .domInteractive)
		domLoading = try values.decodeIfPresent(Int.self, forKey: .domLoading)
		responseEnd = try values.decodeIfPresent(Int.self, forKey: .responseEnd)
		responseStart = try values.decodeIfPresent(Int.self, forKey: .responseStart)
		requestStart = try values.decodeIfPresent(Int.self, forKey: .requestStart)
		secureConnectionStart = try values.decodeIfPresent(Int.self, forKey: .secureConnectionStart)
		connectEnd = try values.decodeIfPresent(Int.self, forKey: .connectEnd)
		connectStart = try values.decodeIfPresent(Int.self, forKey: .connectStart)
		domainLookupEnd = try values.decodeIfPresent(Int.self, forKey: .domainLookupEnd)
		domainLookupStart = try values.decodeIfPresent(Int.self, forKey: .domainLookupStart)
		fetchStart = try values.decodeIfPresent(Int.self, forKey: .fetchStart)
		redirectEnd = try values.decodeIfPresent(Int.self, forKey: .redirectEnd)
		redirectStart = try values.decodeIfPresent(Int.self, forKey: .redirectStart)
		unloadEventEnd = try values.decodeIfPresent(Int.self, forKey: .unloadEventEnd)
		unloadEventStart = try values.decodeIfPresent(Int.self, forKey: .unloadEventStart)
		navigationStart = try values.decodeIfPresent(Int.self, forKey: .navigationStart)
	}

}
