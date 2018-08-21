//
//  File.swift
//  Job-Aggregator-IOS-Version
//
//  Created by Александр Сахнюков on 10/08/2018.
//  Copyright © 2018 Александр Сахнюков. All rights reserved.
//


import Foundation
import RealmSwift

class VacancyRealm: Object {
    @objc dynamic var id: Int = 0
    @objc dynamic var name: String = ""
    @objc dynamic var area: String = ""
    @objc dynamic var url: String = ""
     @objc dynamic var salaryFrom: Double = 0
     @objc dynamic var salaryTo: Double = 0
    @objc dynamic var employer: String = ""
    @objc dynamic var experience:String = ""
    @objc dynamic var descriptionVacancy:String = ""
    
    convenience init(name: String,id:Int, area:String,url:String,salaryFrom:Double,salaryTo:Double,employer:String,experience:String,descriptionVacancy:String) {
        self.init()
          self.id = id
        self.name = name
          self.area = area
          self.url = url
          self.salaryFrom = salaryFrom
          self.salaryTo = salaryTo
          self.employer = employer
          self.experience = experience
          self.descriptionVacancy = descriptionVacancy
    }
    
    
override static func primaryKey() -> String? {
     return "id"}
}
