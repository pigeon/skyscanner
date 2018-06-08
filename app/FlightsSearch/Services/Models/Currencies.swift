//  Generated

import Foundation
struct Currencies : Codable {
	let code : String?
	let symbol : String?
	let thousandsSeparator : String?
	let decimalSeparator : String?
	let symbolOnLeft : Bool?
	let spaceBetweenAmountAndSymbol : Bool?
	let roundingCoefficient : Int?
	let decimalDigits : Int?

	enum CodingKeys: String, CodingKey {

		case code = "Code"
		case symbol = "Symbol"
		case thousandsSeparator = "ThousandsSeparator"
		case decimalSeparator = "DecimalSeparator"
		case symbolOnLeft = "SymbolOnLeft"
		case spaceBetweenAmountAndSymbol = "SpaceBetweenAmountAndSymbol"
		case roundingCoefficient = "RoundingCoefficient"
		case decimalDigits = "DecimalDigits"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		code = try values.decodeIfPresent(String.self, forKey: .code)
		symbol = try values.decodeIfPresent(String.self, forKey: .symbol)
		thousandsSeparator = try values.decodeIfPresent(String.self, forKey: .thousandsSeparator)
		decimalSeparator = try values.decodeIfPresent(String.self, forKey: .decimalSeparator)
		symbolOnLeft = try values.decodeIfPresent(Bool.self, forKey: .symbolOnLeft)
		spaceBetweenAmountAndSymbol = try values.decodeIfPresent(Bool.self, forKey: .spaceBetweenAmountAndSymbol)
		roundingCoefficient = try values.decodeIfPresent(Int.self, forKey: .roundingCoefficient)
		decimalDigits = try values.decodeIfPresent(Int.self, forKey: .decimalDigits)
	}

}
