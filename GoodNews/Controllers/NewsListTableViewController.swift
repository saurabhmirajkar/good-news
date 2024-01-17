//
//  NewsListTableViewController.swift
//  GoodNews
//
//  Created by Saurabh Mirajkar on 16/01/24.
//

import UIKit

class NewsListTableViewController: UITableViewController {
    
    private var articleListVW: ArticleListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setup() {
        DispatchQueue.main.async {
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            appDelegate.setupNavigationBar(navigationController: self.navigationController)
        }
        
        let url = URL(string: "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=fe03b5715ceb4d0b81a56a0eca2c8165")!
        
        WebService().getArticles(url: url) { articles in
            if let articles {
                self.articleListVW = ArticleListViewModel(articles: articles)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
           
        }
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.articleListVW == nil ? 0 :  self.articleListVW.numberOfSection
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articleListVW.numberOfRowsInSection(section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCell", for: indexPath) as? ArticleTableViewCell else {
            fatalError("ArticleTableViewCell not found")
        }
        
        let articleVM = self.articleListVW.articleAtIndex(indexPath.row)
        cell.titleLabel.text = articleVM.title
        cell.descriptionLabel.text = articleVM.description
        return cell
    }
    
}
