//
//  Categires.swift
//  mealstrying
//
//  Created by Gugulavath prashanth kumar on 29/03/21.
//

import Foundation

struct Category : Codable {

        let idCategory : String?
        let strCategory : String?
        let strCategoryDescription : String?
        let strCategoryThumb : String?

        enum CodingKeys: String, CodingKey {
                case idCategory = "idCategory"
                case strCategory = "strCategory"
                case strCategoryDescription = "strCategoryDescription"
                case strCategoryThumb = "strCategoryThumb"
        }
    
        init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: CodingKeys.self)
                idCategory = try values.decodeIfPresent(String.self, forKey: .idCategory)
                strCategory = try values.decodeIfPresent(String.self, forKey: .strCategory)
                strCategoryDescription = try values.decodeIfPresent(String.self, forKey: .strCategoryDescription)
                strCategoryThumb = try values.decodeIfPresent(String.self, forKey: .strCategoryThumb)
        }

}
