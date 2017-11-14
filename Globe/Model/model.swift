//
//  model.swift
//  Globe
//
//  Created by zagid on 26.10.17.
//  Copyright © 2017 zagid. All rights reserved.
//

import Foundation
import Parse

class Globe {
    var countryName: String
    var codeNumber: Int
    var image: UIImage
    var capital: String
    var area: Int
    var population: Int
    
    
    init(countryName: String, codeNumber: Int, image: UIImage, capital: String, area: Int, population: Int) {
        self.countryName = countryName
        self.codeNumber = codeNumber
        self.image = image
        self.capital = capital
        self.area = area
        self.population = population
       
    }
    
}
    
  
    



