import Foundation

struct ComputedBrowser : Codable {
	let browser : String?
	let version : String?
	let platform : String?
	let fullBrowser : String?
    
    init(browser: String? = nil, version: String? = nil, platform: String? = nil, fullBrowser: String? = nil) {
        self.browser = browser
        self.version = version
        self.platform = platform
        self.fullBrowser = fullBrowser
    }

	enum CodingKeys: String, CodingKey {

		case browser = "Browser"
		case version = "Version"
		case platform = "Platform"
		case fullBrowser = "FullBrowser"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		browser = try values.decodeIfPresent(String.self, forKey: .browser)
		version = try values.decodeIfPresent(String.self, forKey: .version)
		platform = try values.decodeIfPresent(String.self, forKey: .platform)
		fullBrowser = try values.decodeIfPresent(String.self, forKey: .fullBrowser)
	}

}
