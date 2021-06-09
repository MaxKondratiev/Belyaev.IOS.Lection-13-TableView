//
//  Tasks.swift
//  Belyaev.IOS.Lection-13 TableView
//
//  Created by максим  кондратьев  on 08.06.2021.
//

import Foundation

class Tasks: Codable {
    var title: String
    var description: String
    var id: String
    var isActiveSwitch : Bool
    init(title:String,description: String, isActiveSwitch:Bool) {
        self.title = title
        self.description = description
        self.id = UUID().uuidString
        self.isActiveSwitch = isActiveSwitch
    }
}
// Mark: --- USER Default
extension Tasks {
    static let userDefaultKey = "TaskKey"
    
    
    static func saveTask( _ task: [Tasks]){
        
        let data =  try? JSONEncoder().encode(task)
        UserDefaults.standard.set(data, forKey: userDefaultKey)
    }
        
        static func loadTask() -> [Tasks] {
            var returnValue : [Tasks] = []
            
            if let data = UserDefaults.standard.data(forKey: Tasks.userDefaultKey) ,
                let tasks =  try? JSONDecoder().decode([Tasks].self, from: data)
            {
              returnValue = tasks
            }
            return returnValue
        }
    }

