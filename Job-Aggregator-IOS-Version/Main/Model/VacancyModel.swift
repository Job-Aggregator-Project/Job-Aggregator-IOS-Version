//
//  VacancyModel.swift
//  Job-Aggregator-IOS-Version
//
//  Created by Александр Сахнюков on 04/08/2018.
//  Copyright © 2018 Александр Сахнюков. All rights reserved.
//

import Foundation

struct Vacancy {
    var id: Int
    var name: String
    var area: String
    var url: String
    var salaryFrom: Double
    var salaryTo: Double
    var employer: String
    var experience:String
    var description:String
    var currency:String
    

  
    
    init (id: Int, name:String, area:String, url:String,salaryFrom: Double,salaryTo:Double, employer:String, experience:String,description:String, currency:String) {
        
        self.id = id
        self.name = name
        self.area = area
        self.url = url
        self.salaryTo = salaryTo
        self.salaryFrom = salaryFrom
        self.employer = employer
        self.experience = experience
        self.description = description
    self.currency = currency
    }
}
