//
//  Facade.swift
//  Facade-Judy
//
//  Created by Judy on 2022/11/23.
//

class Facade {
    private let firebase = FirebaseLibrary()
    private let coredata = CoreDataFramework()
    
    func save() {
        firebase.save()
        coredata.save()
    }
    
    func fetch() {
        firebase.fetch()
        coredata.fetch()
    }
    
    func delete() {
        firebase.delete()
        coredata.delete()
    }
}
