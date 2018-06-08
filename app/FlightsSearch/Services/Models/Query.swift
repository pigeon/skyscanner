//  Generated

import Foundation
struct Query : Codable {
	let country : String?
	let currency : String?
	let locale : String?
	let adults : Int?
	let children : Int?
	let infants : Int?
	let originPlace : String?
	let destinationPlace : String?
	let outboundDate : String?
	let inboundDate : String?
	let locationSchema : String?
	let cabinClass : String?
	let groupPricing : Bool?

	enum CodingKeys: String, CodingKey {

		case country = "Country"
		case currency = "Currency"
		case locale = "Locale"
		case adults = "Adults"
		case children = "Children"
		case infants = "Infants"
		case originPlace = "OriginPlace"
		case destinationPlace = "DestinationPlace"
		case outboundDate = "OutboundDate"
		case inboundDate = "InboundDate"
		case locationSchema = "LocationSchema"
		case cabinClass = "CabinClass"
		case groupPricing = "GroupPricing"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		country = try values.decodeIfPresent(String.self, forKey: .country)
		currency = try values.decodeIfPresent(String.self, forKey: .currency)
		locale = try values.decodeIfPresent(String.self, forKey: .locale)
		adults = try values.decodeIfPresent(Int.self, forKey: .adults)
		children = try values.decodeIfPresent(Int.self, forKey: .children)
		infants = try values.decodeIfPresent(Int.self, forKey: .infants)
		originPlace = try values.decodeIfPresent(String.self, forKey: .originPlace)
		destinationPlace = try values.decodeIfPresent(String.self, forKey: .destinationPlace)
		outboundDate = try values.decodeIfPresent(String.self, forKey: .outboundDate)
		inboundDate = try values.decodeIfPresent(String.self, forKey: .inboundDate)
		locationSchema = try values.decodeIfPresent(String.self, forKey: .locationSchema)
		cabinClass = try values.decodeIfPresent(String.self, forKey: .cabinClass)
		groupPricing = try values.decodeIfPresent(Bool.self, forKey: .groupPricing)
	}

}
