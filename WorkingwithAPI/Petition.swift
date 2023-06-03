//
//  Petition.swift
//  WorkingwithAPI
//
//  Created by e.mubarakov on 29.05.2023.
//

import Foundation

struct Petitions: Codable {
    var results: [Petition]
}

struct Petition: Codable {
    var title: String
    var body: String
    var signatureCount: Int
}
