//  Generated

import Foundation
struct BookingDetailsLink : Codable {
	let uri : String?
	let body : String?
	let method : String?

	enum CodingKeys: String, CodingKey {

		case uri = "Uri"
		case body = "Body"
		case method = "Method"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		uri = try values.decodeIfPresent(String.self, forKey: .uri)
		body = try values.decodeIfPresent(String.self, forKey: .body)
		method = try values.decodeIfPresent(String.self, forKey: .method)
	}

}
