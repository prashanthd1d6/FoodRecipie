//
//  Detalis.swift
//  mealstrying
//
//  Created by Gugulavath prashanth kumar on 29/03/21.
//

import Foundation

struct details : Codable {

        var categories : [Category]?

        enum CodingKeys: String, CodingKey {
                case categories = "categories"
        }
    
        init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: CodingKeys.self)
                categories = try values.decodeIfPresent([Category].self, forKey: .categories)
        }

}
