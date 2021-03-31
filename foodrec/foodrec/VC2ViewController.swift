//
//  VC2ViewController.swift
//  foodrec
//
//  Created by Gugulavath prashanth kumar on 30/03/21.
//

import UIKit

class VC2ViewController: UIViewController {
    
    
    @IBOutlet weak var imgv2: UIImageView!
    
    @IBOutlet weak var lbl1: UILabel!
    
    @IBOutlet weak var lbl2: UILabel!
    var dishesDetails:Category!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.5499924057, green: 0.6847069301, blue: 0.2893622395, alpha: 1)
        // Do any additional setup after loading the view.
        var vc = TVCTableViewController()
        print(dishesDetails!)
        display()
    }
    func display(){
        if dishesDetails == nil{
            print("error")
        }else{
            DispatchQueue.main.async { [self] in
                lbl1.text = "\(dishesDetails!.strCategory!)"
                lbl2.numberOfLines = 0
                lbl2.text = "\(dishesDetails!.strCategoryDescription!)"
                var posters = URLRequest(url: URL(string: "\(dishesDetails!.strCategoryThumb!)")!)
                var posterObj = URLSession.shared.dataTask(with: posters) { (data, res, err) in
                    DispatchQueue.main.async {
                        imgv2.image = UIImage(data: data!)
                    }
                    
                    
                }
                posterObj.resume()
            }
            
        }
    }
    

   

}
