/* 
Copyright (c) 2018 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

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
