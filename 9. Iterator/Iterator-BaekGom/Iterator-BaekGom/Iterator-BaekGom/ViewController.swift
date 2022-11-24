//
//  ViewController.swift
//  Iterator-BaekGom
//
//  Created by Baek on 2022/11/16.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let map = MapCollection()
        let list = ListCollection()
        
        map.add(element: "1", for: "1")
        map.add(element: "2", for: "2")
        map.add(element: "3", for: "3")
        
        list.add(element: "11")
        list.add(element: "22")
        list.add(element: "33")
        
        let iterators = [map.makeIterator(), list.makeIterator()]
        
        for iterator in iterators {
            while iterator.hasNext() {
                print(iterator.next() ?? "0")
            }
            
        }
    }
}

