/* 
Copyright (c) 2018 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

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
		case query
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
		query = try Query(from: decoder)
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
