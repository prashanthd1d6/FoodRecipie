//
//  TVCellTableViewCell.swift
//  foodrec
//
//  Created by Gugulavath prashanth kumar on 29/03/21.
//

import UIKit

class TVCellTableViewCell: UITableViewCell {
    
    
    var link:TVCTableViewController!
    @IBOutlet weak var lbl: UILabel!
    @IBOutlet weak var imgv: UIImageView!
    @IBOutlet weak var starButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imgv.layer.cornerRadius = 20
        imgv.clipsToBounds = true
    }
    
    
    @IBAction func asAddFav(_ sender: Any) {
        
        print("Marking As Favorite")
       // link.someMethodIWantToCall(cell: self)
        
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    
    required init?(coder aDecoder: NSCoder) {
        //fatalError("init(coder:) has not been implemented")
        super.init(coder: aDecoder)
    }
}
