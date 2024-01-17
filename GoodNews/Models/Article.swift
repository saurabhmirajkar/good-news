//
//  Article.swift
//  GoodNews
//
//  Created by Saurabh Mirajkar on 17/01/24.
//

import Foundation

struct ArticleList: Decodable {
    let articles: [Article]
}

struct Article: Decodable {
    let title: String
    let description: String
}


