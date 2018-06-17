import Foundation

struct Browser : Codable {
    let onLine : Bool?
    let product : String?
    let appCodeName : String?
    let userAgent : String?
    let platform : String?
    let appVersion : String?
    let appName : String?
    let vendorSub : String?
    let vendor : String?
    let productSub : String?
    let cookieEnabled : Bool?
    let language : String?
    
    enum CodingKeys: String, CodingKey {
        
        case onLine = "onLine"
        case product = "product"
        case appCodeName = "appCodeName"
        case userAgent = "userAgent"
        case platform = "platform"
        case appVersion = "appVersion"
        case appName = "appName"
        case vendorSub = "vendorSub"
        case vendor = "vendor"
        case productSub = "productSub"
        case cookieEnabled = "cookieEnabled"
        case language = "language"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        onLine = try values.decodeIfPresent(Bool.self, forKey: .onLine)
        product = try values.decodeIfPresent(String.self, forKey: .product)
        appCodeName = try values.decodeIfPresent(String.self, forKey: .appCodeName)
        userAgent = try values.decodeIfPresent(String.self, forKey: .userAgent)
        platform = try values.decodeIfPresent(String.self, forKey: .platform)
        appVersion = try values.decodeIfPresent(String.self, forKey: .appVersion)
        appName = try values.decodeIfPresent(String.self, forKey: .appName)
        vendorSub = try values.decodeIfPresent(String.self, forKey: .vendorSub)
        vendor = try values.decodeIfPresent(String.self, forKey: .vendor)
        productSub = try values.decodeIfPresent(String.self, forKey: .productSub)
        cookieEnabled = try values.decodeIfPresent(Bool.self, forKey: .cookieEnabled)
        language = try values.decodeIfPresent(String.self, forKey: .language)
    }
    
}
