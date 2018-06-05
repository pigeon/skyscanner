/* 
Copyright (c) 2018 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

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
