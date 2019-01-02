//
//  HrsTableViewCell.swift
//  SchedulesView
//
//  Created by Isac Joseph on 02/01/19.
//  Copyright © 2019 Isac Joseph. All rights reserved.
//

import UIKit

class HrsTableViewCell: UITableViewCell
{
    @IBOutlet weak var lblTime: UILabel!
    
    let timeArray = ["12 AM","1 AM","2 AM","3 AM","4 AM","5 AM","6 AM","7 AM","8 AM","9 AM","10 AM","11 AM","Noon","1 PM","2 PM","3 PM","4 PM","5 PM","6 PM","7 PM","8 PM","9 PM","10 PM","11 PM","12 AM"]
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        // Initialization code
    }

    
    func configureCell(index:Int)
    {
        lblTime.text = timeArray[index]
    }

}
