//
//  ButtonBoxFactory.swift
//  AbstractFactory_Sample
//
//  Created by Derrick kim on 2022/11/08.
//

protocol ButtonBoxFactory {
    func createView() -> View
    func createButton() -> Button
}
