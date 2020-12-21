//
//  ParksTableViewController.swift
//  app5
//
//  Created by Elias Chamariq on 12/21/20.
//  Copyright © 2020 Elias Chamariq. All rights reserved.
//

import UIKit
import Kingfisher
import Firebase


struct Park: Codable{
    let name: String
    let designation: String
    let images: [Image]
    let description: String
}
struct APIResponse: Codable{
    let data: [Park]
}

struct Image: Codable{
    let url: String
}

class ParksTableViewController: UITableViewController {

    
    var parksList = [Park]()
    var keyAPI = "u9AFNYEyXHQoryPaP75nVrSEyngKqUD8laFMbB66"
    var currPark : Park? = nil
    let database = Firestore.firestore()
    var data : [String : Any]?
    var doc : DocumentReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureRefreshControl()
    }
    
    func configureRefreshControl() {
        // Add the refresh control to your UIScrollView object.
        self.refreshControl = UIRefreshControl()
        self.refreshControl?.addTarget(self, action:
                                        #selector(handleRefreshControl),
                                       for: .valueChanged)
    }
    
    @objc func handleRefreshControl() {
        // Update your content…
        fetchParks()
        
        // Dismiss the refresh control.
        DispatchQueue.main.async {
            self.refreshControl?.endRefreshing()
        }
    }
    	
    
    private func fetchParks() {
        let urlString = "https://developer.nps.gov/api/v1/parks?limit=30&api_key=\(keyAPI)"
        
        guard let url = URL(string: urlString) else {return}
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let data = data {
                if let APIResponse = try? JSONDecoder().decode(APIResponse.self, from: data) {
                    DispatchQueue.main.async {
                        self.parksList = APIResponse.data
                        self.storeDB()
                        self.tableView.reloadData()
                    }
                } else {
                    print("not decoded")
                }
            }
        }
        task.resume()
    }
    
        func storeDB() {
            print("count is: ", parksList.count)
            for n in 0...parksList.count - 1{
                print("number is: ", n)
                let park = parksList[n]
                var image : String;
                if park.images.count > 0 {
                    image = park.images[0].url
                } else {
                    image = ""
                }
                
                let currData : [String: Any] = ["name": park.name, "designation": park.designation, "image": image, "description": park.description]
                
                database.collection("parks").document(String(n)).setData(
                    currData
                ) { err in
                    if let err = err {
                        print("Error writing document: \(err)")
                    } else {
                        print("Document successfully written!")
                    }
                }
            }
        }
        
        
        
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as UITableViewCell
            
            
            Firestore.firestore().collection("parks").document("\(indexPath.row)").getDocument{ (docSnapshot, error) in
                if let data = docSnapshot?.data() {
                    
                    if let name = cell.viewWithTag(2) as? UILabel {
                        name.text = data["name"] as! String

                    }
                    
                    if let desc = cell.viewWithTag(3) as? UILabel {
                        desc.text = data["designation"] as! String
                    }
                    
                    if let imageView = cell.viewWithTag(1) as? UIImageView {
                        if data["image"] as! String != ""{
                            let url = URL(string: data["image"] as! String)
                            imageView.kf.setImage(with: url)
                        }
                    }
                }
            }
            
            return cell
            
        }
        
        override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            tableView.deselectRow(at: indexPath, animated: false)
            Firestore.firestore().collection("parks").document("\(indexPath.row)").getDocument{ (docSnapshot, error) in
                if let data = docSnapshot?.data() {
                    self.data = data
                }
                self.performSegue(withIdentifier: "Description", sender: nil)
            }
        }
        
        // prepare for segue
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "Description" {
                let dvc = segue.destination as! DetailViewController
                dvc.data = self.data
            }
        }
        
        
        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return parksList.count
        }
        
        override func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }
        
        override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 90.0
        }
    
}
