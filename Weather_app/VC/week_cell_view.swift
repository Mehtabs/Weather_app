//
//  week_cell_view.swift
//  Weather_app
//
//  Created by Mehtab Singh Sidhu on 4/25/19.
//  Copyright © 2019 Mehtab Singh Sidhu. All rights reserved.
//

import UIKit
import CoreLocation

class week_cell_view: UITableViewCell {
    
    let time: Int = 0
    let summary: String = ""
    let temperatureHigh: Double = 0
    let temperatureLow: Double = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
