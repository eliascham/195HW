import UIKit

class NewsfeedTableViewController: UITableViewController {
    
    var newsItems = [NewsItem]()
    
    // MARK: IBAction
    @IBAction func didSelectAdd(_ sender: UIBarButtonItem) {
        // TODO: Present an alert view with a text field. When "Done" is pressed, a new NewsItem should be created and inserted at the START of your array of items, and the table view data should be reloaded
        let ac = UIAlertController(title: "Enter Text", message: nil, preferredStyle: .alert)
        ac.addTextField()

        let done = UIAlertAction(title: "Done", style: .default) { [unowned ac] _ in
            let answer = ac.textFields![0]
            let entry = NewsItem(answer.text!, false)
            self.newsItems.append(entry)
            self.tableView.reloadData()
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .default) { []
            _ in
            
        }

        ac.addAction(cancel)
        ac.addAction(done)

        present(ac, animated: true)
    }

    // MARK: - Basic table view methods
    override func numberOfSections(in tableView: UITableView) -> Int {
        // TODO: How many sections? (Hint: we have 1 section and x rows)
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // TODO: How many rows in our section?
        return newsItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // TODO: Deque a cell from the table view and configure its UI. Set the label and star image by using cell.viewWithTag(..)
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Top", for: indexPath)
        if let label = cell.viewWithTag(1) as? UILabel {
            label.text = newsItems[indexPath.row].title
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
    
    // MARK: - Handle user interaction
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        let cell = tableView.dequeueReusableCell(withIdentifier: "Top", for: indexPath)
        if let imageView = cell.viewWithTag(2) as? UIImageView {
            newsItems[indexPath.row].favorite.toggle()
            let check = newsItems[indexPath.row].favorite
            if check {
                imageView.image = UIImage(named: "star-filled")
                tableView.reloadData()
            } else {
                imageView.image = UIImage(named: "star-hollow")
                tableView.reloadData()
            }
        }
    }
    
    
    // MARK: - Swipe to delete functionality
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        // TODO: If the editing style is deletion, remove the newsItem from your model and then delete the rows. CAUTION: make sure you aren't calling tableView.reloadData when you update your model -- calling both tableView.deleteRows and tableView.reloadData will make the app crash.
        
        newsItems.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .fade)
        
    }

}

