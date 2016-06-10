//
//  ObjectStoreProtocol.swift
//  ToDo
//
//  Created by Olesia Kalashnik on 6/9/16.
//  Copyright © 2016 Michael Babiy. All rights reserved.
//

import Foundation

protocol ObjectStoreProtocol : class {
    associatedtype Object : Identity
    var objects : [Object] {get set }
    func add(object: Object)
    func remove(object: Object)
    func objectAtIndex(index: Int) -> Object
    func count() -> Int
    func allObjects() -> [Object]
    func clear()
}

extension ObjectStoreProtocol {
    
    func add(object: Object) {
        return self.objects.append(object)
    }
    
    func remove(object: Object) {
        self.objects = self.objects.filter {$0.identity != object.identity}
    }
    
    func objectAtIndex(index: Int) -> Object {
        return self.objects[index]
    }
    
    func count() -> Int {
        return self.objects.count
    }
    
    func allObjects() -> [Object] {
        return self.objects
    }
    
    func clear() {
        self.objects.removeAll()
    }
}
