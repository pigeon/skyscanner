//  Generated

import Foundation
struct Itineraries : Codable {
	let outboundLegId : String?
	let inboundLegId : String?
	let pricingOptions : [PricingOptions]?
	let bookingDetailsLink : BookingDetailsLink?

	enum CodingKeys: String, CodingKey {

		case outboundLegId = "OutboundLegId"
		case inboundLegId = "InboundLegId"
		case pricingOptions = "PricingOptions"
		case bookingDetailsLink
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		outboundLegId = try values.decodeIfPresent(String.self, forKey: .outboundLegId)
		inboundLegId = try values.decodeIfPresent(String.self, forKey: .inboundLegId)
		pricingOptions = try values.decodeIfPresent([PricingOptions].self, forKey: .pricingOptions)
		bookingDetailsLink = try BookingDetailsLink(from: decoder)
	}

}
