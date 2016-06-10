//
//  ToDo.swift
//  ToDo
//
//  Created by Olesia Kalashnik on 6/9/16.
//  Copyright © 2016 Michael Babiy. All rights reserved.
//

import Foundation

class ToDo: NSObject, NSCoding, Identity {
    var taskText : String
    var identity : String
    
    struct PropertyKey {
        static let task = "task"
    }
    
    // MARK: Archiving Paths
    static let DocumentsDirectory = NSFileManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.URLByAppendingPathComponent("tasks")
    
    init?(task: String) {
        self.taskText = task
        self.identity = NSUUID().UUIDString
        super.init()
        
        if task.isEmpty {
            return nil
        }
    }
    
    var taskDescription : String {
        return "\(self.taskText)"
    }
    
    // MARK: NSCoding
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(taskText, forKey: PropertyKey.task)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let task = aDecoder.decodeObjectForKey(PropertyKey.task) as! String
        self.init(task: task)
    }
}