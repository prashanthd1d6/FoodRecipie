//
//  ViewController2.swift
//  foodrec
//
//  Created by Gugulavath prashanth kumar on 29/03/21.
//

import UIKit

class ViewController2: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var tableview = UITableView()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
        
        tableview.delegate = self
        tableview.dataSource = self
        
        createUI()
        
        
    }
    
    func createUI(){
        
        
        
        
    }
    
    
    
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }

    

}
