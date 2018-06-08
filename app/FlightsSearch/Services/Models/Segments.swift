//  Generated

import Foundation
struct Segments : Codable {
	let id : Int?
	let originStation : Int?
	let destinationStation : Int?
	let departureDateTime : String?
	let arrivalDateTime : String?
	let carrier : Int?
	let operatingCarrier : Int?
	let duration : Int?
	let flightNumber : String?
	let journeyMode : String?
	let directionality : String?

	enum CodingKeys: String, CodingKey {

		case id = "Id"
		case originStation = "OriginStation"
		case destinationStation = "DestinationStation"
		case departureDateTime = "DepartureDateTime"
		case arrivalDateTime = "ArrivalDateTime"
		case carrier = "Carrier"
		case operatingCarrier = "OperatingCarrier"
		case duration = "Duration"
		case flightNumber = "FlightNumber"
		case journeyMode = "JourneyMode"
		case directionality = "Directionality"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		originStation = try values.decodeIfPresent(Int.self, forKey: .originStation)
		destinationStation = try values.decodeIfPresent(Int.self, forKey: .destinationStation)
		departureDateTime = try values.decodeIfPresent(String.self, forKey: .departureDateTime)
		arrivalDateTime = try values.decodeIfPresent(String.self, forKey: .arrivalDateTime)
		carrier = try values.decodeIfPresent(Int.self, forKey: .carrier)
		operatingCarrier = try values.decodeIfPresent(Int.self, forKey: .operatingCarrier)
		duration = try values.decodeIfPresent(Int.self, forKey: .duration)
		flightNumber = try values.decodeIfPresent(String.self, forKey: .flightNumber)
		journeyMode = try values.decodeIfPresent(String.self, forKey: .journeyMode)
		directionality = try values.decodeIfPresent(String.self, forKey: .directionality)
	}

}
