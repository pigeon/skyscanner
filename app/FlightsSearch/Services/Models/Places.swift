//  Generated

import Foundation
struct Places : Codable {
	let id : Int?
	let parentId : Int?
	let code : String?
	let type : String?
	let name : String?

	enum CodingKeys: String, CodingKey {

		case id = "Id"
		case parentId = "ParentId"
		case code = "Code"
		case type = "Type"
		case name = "Name"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		parentId = try values.decodeIfPresent(Int.self, forKey: .parentId)
		code = try values.decodeIfPresent(String.self, forKey: .code)
		type = try values.decodeIfPresent(String.self, forKey: .type)
		name = try values.decodeIfPresent(String.self, forKey: .name)
	}

}
