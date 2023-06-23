//
//  NetworkManager.swift
//  H4X0R News
//
//  Created by Bryant Irawan on 3/24/23.
//

import Foundation

//ObservableObject protcol allows broadcasting of data from API
class NetworkManager: ObservableObject {
    
    @Published var posts = [Post]()
    
    func fetchData() {
        if let url = URL(string: "http://hn.algolia.com/api/v1/search?tags=front_page") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                            //decode can throw an error so need ot use try
                            let results = try decoder.decode(Results.self, from: safeData)
                            DispatchQueue.main.async {
                                //if no errors, we save results.hits to posts variable above
                                self.posts = results.hits
                            }
                        } catch {
                            print(error)
                        }
                    }
                }
            }
            //need to put this in to actually start task
           task.resume()
        }
    }
}
