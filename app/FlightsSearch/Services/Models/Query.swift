/* 
Copyright (c) 2018 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Query : Codable {
	let country : String?
	let currency : String?
	let locale : String?
	let adults : Int?
	let children : Int?
	let infants : Int?
	let originPlace : Int?
	let destinationPlace : Int?
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
		originPlace = try values.decodeIfPresent(Int.self, forKey: .originPlace)
		destinationPlace = try values.decodeIfPresent(Int.self, forKey: .destinationPlace)
		outboundDate = try values.decodeIfPresent(String.self, forKey: .outboundDate)
		inboundDate = try values.decodeIfPresent(String.self, forKey: .inboundDate)
		locationSchema = try values.decodeIfPresent(String.self, forKey: .locationSchema)
		cabinClass = try values.decodeIfPresent(String.self, forKey: .cabinClass)
		groupPricing = try values.decodeIfPresent(Bool.self, forKey: .groupPricing)
	}

}
