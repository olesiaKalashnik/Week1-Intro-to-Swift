//
//  Savable.swift
//  ToDo
//
//  Created by Olesia Kalashnik on 6/9/16.
//  Copyright © 2016 Michael Babiy. All rights reserved.
//

import Foundation

protocol Savable : class {
    associatedtype Object : NSObject
    var path : String {get set}
    var objects : [Object] {get set}
    func saveObjects()
}

extension Savable {
    func saveObjects() {
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(objects, toFile: path)
        if !isSuccessfulSave {
            print("Failed to save objects...")
        }
    }
}