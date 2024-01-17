//
//  ArticleViewModel.swift
//  GoodNews
//
//  Created by Saurabh Mirajkar on 17/01/24.
//

import Foundation

struct ArticleListViewModel {
    let articles: [Article]
    
    var numberOfSection: Int {
        return 1
    }
    
    func numberOfRowsInSection(_ section: Int) -> Int {
       return self.articles.count
    }
    
    func articleAtIndex(_ index: Int) -> ArticleViewModel {
        let article = self.articles[index]
        return ArticleViewModel(article)
    }
}

struct ArticleViewModel {
    private let article: Article
    
    init(_ article: Article) {
        self.article = article
    }
    
    var title: String {
        self.article.title
    }
    
    var description: String {
        self.article.description
    }
}

