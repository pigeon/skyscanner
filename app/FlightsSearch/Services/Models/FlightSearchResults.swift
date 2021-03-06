//  Generated

import Foundation

struct FlightSearchResults : Codable {
	let sessionKey : String?
	let query : Query?
	let status : String?
	let itineraries : [Itineraries]?
	let legs : [Legs]?
	let segments : [Segments]?
	let carriers : [Carriers]?
	let agents : [Agents]?
	let places : [Places]?
	let currencies : [Currencies]?
	let serviceQuery : ServiceQuery?

	enum CodingKeys: String, CodingKey {

		case sessionKey = "SessionKey"
		case query = "Query"
		case status = "Status"
		case itineraries = "Itineraries"
		case legs = "Legs"
		case segments = "Segments"
		case carriers = "Carriers"
		case agents = "Agents"
		case places = "Places"
		case currencies = "Currencies"
		case serviceQuery
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		sessionKey = try values.decodeIfPresent(String.self, forKey: .sessionKey)
		query = try values.decodeIfPresent(Query.self, forKey: .query)
		status = try values.decodeIfPresent(String.self, forKey: .status)
		itineraries = try values.decodeIfPresent([Itineraries].self, forKey: .itineraries)
		legs = try values.decodeIfPresent([Legs].self, forKey: .legs)
		segments = try values.decodeIfPresent([Segments].self, forKey: .segments)
		carriers = try values.decodeIfPresent([Carriers].self, forKey: .carriers)
		agents = try values.decodeIfPresent([Agents].self, forKey: .agents)
		places = try values.decodeIfPresent([Places].self, forKey: .places)
		currencies = try values.decodeIfPresent([Currencies].self, forKey: .currencies)
		serviceQuery = try ServiceQuery(from: decoder)
	}

}
