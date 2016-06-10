//
//  Store.swift
//  ToDo
//
//  Created by Olesia Kalashnik on 6/9/16.
//  Copyright © 2016 Michael Babiy. All rights reserved.
//

import Foundation

class Store : ObjectStoreProtocol, Savable {
    typealias Object = ToDo
    
    var path = ToDo.ArchiveURL.path! // TODO: avoid using optional
    
    var objects : [Object]
    static let shared = Store()
    private init() {
        self.objects = NSKeyedUnarchiver.unarchiveObjectWithFile(self.path) as? [Object] ?? [Object]()
    }
}