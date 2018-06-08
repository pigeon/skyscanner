//  Generated

import Foundation
struct PricingOptions : Codable {
	let agents : [Int]?
	let quoteAgeInMinutes : Int?
	let price : Double?
	let deeplinkUrl : String?

	enum CodingKeys: String, CodingKey {

		case agents = "Agents"
		case quoteAgeInMinutes = "QuoteAgeInMinutes"
		case price = "Price"
		case deeplinkUrl = "DeeplinkUrl"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		agents = try values.decodeIfPresent([Int].self, forKey: .agents)
		quoteAgeInMinutes = try values.decodeIfPresent(Int.self, forKey: .quoteAgeInMinutes)
		price = try values.decodeIfPresent(Double.self, forKey: .price)
		deeplinkUrl = try values.decodeIfPresent(String.self, forKey: .deeplinkUrl)
	}

}
