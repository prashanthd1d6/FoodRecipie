//
//  TVCTableViewController.swift
//  foodrec
//
//  Created by Gugulavath prashanth kumar on 29/03/21.
//

import UIKit

class TVCTableViewController: UITableViewController,UISearchResultsUpdating
{
   
    //Properties
    var dataTaskObj:URLSessionDataTask!
    var urlReq:URLRequest!
    var sc = UISearchController()
    @IBOutlet var tableViewObj: UITableView!
    var convertedData:details!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        getData()
        var TableViewCell = UINib(nibName: "TVCellTableViewCell", bundle: nil)
        tableViewObj.register(TableViewCell, forCellReuseIdentifier: "TVC")
        tableViewObj.delegate = self
        tableViewObj.dataSource = self
        
        //Search
        sc = UISearchController(searchResultsController: nil)
        sc.searchResultsUpdater = self
        sc.searchBar.placeholder = "Search For Dishes"
        sc.searchBar.showsBookmarkButton = true
        sc.searchBar.showsCancelButton = true
        tableView.tableHeaderView = sc.searchBar
        view.backgroundColor = .systemYellow
        
        

       
        
    }
    func updateSearchResults(for searchController: UISearchController) {
    let searchTerm = searchController.searchBar.text!
    let predicateObj = NSPredicate(format: "self contains[c] %@", searchController.searchBar.text!)
    
//        filterArr = (filterArr as! NSArray).filtered(using: predicateObj) as! [String]
        tableView.reloadData()

        tableView.reloadData()
        
    }
    
    func someMethodIWantToCall(cell:UITableViewCell){
        print("InsideVC now...")
        let indexPathTapped = tableView.indexPath(for:cell)
        print(indexPathTapped)
       
        
    }
  
    
    
    // get data From API
    func getData(){
        urlReq = URLRequest(url:URL(string: "https://www.themealdb.com/api/json/v1/1/categories.php")!)
        dataTaskObj = URLSession.shared.dataTask(with: urlReq, completionHandler: { [self] (data, response, error) in
            print("Get Data From Server")
            print(data)
            if error == nil{
                
            do{
                let JsonDecoder = JSONDecoder()
                 convertedData = try
                    JsonDecoder.decode(details.self, from: data!)
            DispatchQueue.main.async {
                  tableViewObj.reloadData()
            }
            }catch
            {
                print("Something Went Wrong")
                
            }
            }else{
                print(error!.localizedDescription)
            }
        })
        //Connecting To Server
        dataTaskObj.resume()
    }


    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if convertedData != nil{
            
            return convertedData.categories!.count
            
             }
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "TVC", for: indexPath) as! TVCellTableViewCell
        cell.backgroundColor = #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)
        
        if convertedData == nil{
            print("Error")
        }else{
            cell.lbl!.text = "\(convertedData.categories![indexPath.row].strCategory!)"
            
            var posters = URLRequest(url: URL(string: "\(convertedData.categories![indexPath.row].strCategoryThumb!)")!)
            var posterObj = URLSession.shared.dataTask(with: posters) { (data, res, err) in
                DispatchQueue.main.async {
                    cell.imgv.image = UIImage(data: data!)
                }
            }
            posterObj.resume()
        }
        
//
        
        cell.lbl.numberOfLines = 0
       
        
        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var newScreen = storyboard?.instantiateViewController(identifier: "vc2") as! VC2ViewController
        newScreen.dishesDetails = convertedData!.categories![indexPath.row]
        navigationController?.pushViewController(newScreen, animated: true)
//        newScreen.lbl2.text = "\(convertedData!.categories![indexPath.row].strCategory)"
        //newScreen.display()
        
        
        
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
}
