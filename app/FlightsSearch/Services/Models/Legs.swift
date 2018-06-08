//  Generated

import Foundation
struct Legs : Codable {
	let id : String?
	let segmentIds : [Int]?
	let originStation : Int?
	let destinationStation : Int?
	let departure : String?
	let arrival : String?
	let duration : Int?
	let journeyMode : String?
	let stops : [String]?
	let carriers : [Int]?
	let operatingCarriers : [Int]?
	let directionality : String?
	let flightNumbers : [FlightNumbers]?

	enum CodingKeys: String, CodingKey {

		case id = "Id"
		case segmentIds = "SegmentIds"
		case originStation = "OriginStation"
		case destinationStation = "DestinationStation"
		case departure = "Departure"
		case arrival = "Arrival"
		case duration = "Duration"
		case journeyMode = "JourneyMode"
		case stops = "Stops"
		case carriers = "Carriers"
		case operatingCarriers = "OperatingCarriers"
		case directionality = "Directionality"
		case flightNumbers = "FlightNumbers"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(String.self, forKey: .id)
		segmentIds = try values.decodeIfPresent([Int].self, forKey: .segmentIds)
		originStation = try values.decodeIfPresent(Int.self, forKey: .originStation)
		destinationStation = try values.decodeIfPresent(Int.self, forKey: .destinationStation)
		departure = try values.decodeIfPresent(String.self, forKey: .departure)
		arrival = try values.decodeIfPresent(String.self, forKey: .arrival)
		duration = try values.decodeIfPresent(Int.self, forKey: .duration)
		journeyMode = try values.decodeIfPresent(String.self, forKey: .journeyMode)
		stops = try values.decodeIfPresent([String].self, forKey: .stops)
		carriers = try values.decodeIfPresent([Int].self, forKey: .carriers)
		operatingCarriers = try values.decodeIfPresent([Int].self, forKey: .operatingCarriers)
		directionality = try values.decodeIfPresent(String.self, forKey: .directionality)
		flightNumbers = try values.decodeIfPresent([FlightNumbers].self, forKey: .flightNumbers)
	}

}
