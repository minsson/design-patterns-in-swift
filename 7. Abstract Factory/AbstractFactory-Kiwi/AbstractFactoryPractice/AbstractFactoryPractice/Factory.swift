//
//  Factory.swift
//  AbstractFactoryPractice
//
//  Created by Kiwon Song on 2022/11/09.
//


import UIKit

protocol Factory {
    func createButton() -> UIButton
    func createView() -> UIView
}
