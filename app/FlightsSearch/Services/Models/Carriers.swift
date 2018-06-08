//  Generated

import Foundation
struct Carriers : Codable {
	let id : Int?
	let code : String?
	let name : String?
	let imageUrl : String?
	let displayCode : String?

	enum CodingKeys: String, CodingKey {

		case id = "Id"
		case code = "Code"
		case name = "Name"
		case imageUrl = "ImageUrl"
		case displayCode = "DisplayCode"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		code = try values.decodeIfPresent(String.self, forKey: .code)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		imageUrl = try values.decodeIfPresent(String.self, forKey: .imageUrl)
		displayCode = try values.decodeIfPresent(String.self, forKey: .displayCode)
	}

}
