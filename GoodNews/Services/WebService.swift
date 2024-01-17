//
//  WebService.swift
//  GoodNews
//
//  Created by Saurabh Mirajkar on 16/01/24.
//

import Foundation

class WebService {
    
    func getArticles(url: URL, completion: @escaping([Article]?) -> ()) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error {
                print(error.localizedDescription)
                completion(nil)
            } else if let data {
                let articleList = try? JSONDecoder().decode(ArticleList.self, from: data)
                
                if let articleList {
                    completion(articleList.articles)
                }
                
            }
        }.resume()
    }
}
