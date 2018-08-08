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
    var salaryTo: Double
    var salaryFrom: Double

    

  
    
    init (id: Int, name:String, area:String, url:String, salaryTo:Double, salaryFrom: Double) {
        
        self.id = id
        self.name = name
        self.area = area
        self.url = url
        self.salaryTo = salaryTo
        self.salaryFrom = salaryFrom

       
        
    }
}
