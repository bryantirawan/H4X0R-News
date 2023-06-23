//
//  PostData.swift
//  H4X0R News
//
//  Created by Bryant Irawan on 3/24/23.
//

import Foundation

struct Results: Decodable {
    let hits: [Post]
}

//identifiable protocol requires id. We are taking objectID from API and using computed properties to make id == objectID
struct Post: Decodable, Identifiable {
    var id: String {
        return objectID
    }
    let objectID: String 
    let points: Int
    let title: String
    let url: String? //because sometimes an article does not have a url from the API
}
