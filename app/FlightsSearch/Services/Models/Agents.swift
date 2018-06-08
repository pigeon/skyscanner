//  Generated

import Foundation
struct Agents : Codable {
	let id : Int?
	let name : String?
	let imageUrl : String?
	let status : String?
	let optimisedForMobile : Bool?
	let bookingNumber : String?
	let type : String?

	enum CodingKeys: String, CodingKey {

		case id = "Id"
		case name = "Name"
		case imageUrl = "ImageUrl"
		case status = "Status"
		case optimisedForMobile = "OptimisedForMobile"
		case bookingNumber = "BookingNumber"
		case type = "Type"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		imageUrl = try values.decodeIfPresent(String.self, forKey: .imageUrl)
		status = try values.decodeIfPresent(String.self, forKey: .status)
		optimisedForMobile = try values.decodeIfPresent(Bool.self, forKey: .optimisedForMobile)
		bookingNumber = try values.decodeIfPresent(String.self, forKey: .bookingNumber)
		type = try values.decodeIfPresent(String.self, forKey: .type)
	}

}
