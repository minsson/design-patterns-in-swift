//
//  main.swift
//  Facade-Minsson
//
//  Created by minsson on 2022/11/23.
//

import Foundation

let client = Client()
client.turnOnMovieMode()
client.turnOffMovieMode()

let clientWithFacade = ClientWithFacade()
clientWithFacade.siri.turnOnMovieMode()
clientWithFacade.siri.turnOffMovieMode()
