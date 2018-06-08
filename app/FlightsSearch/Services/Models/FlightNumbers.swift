//  Generated

import Foundation
struct FlightNumbers : Codable {
	let flightNumber : String?
	let carrierId : Int?

	enum CodingKeys: String, CodingKey {

		case flightNumber = "FlightNumber"
		case carrierId = "CarrierId"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		flightNumber = try values.decodeIfPresent(String.self, forKey: .flightNumber)
		carrierId = try values.decodeIfPresent(Int.self, forKey: .carrierId)
	}

}
