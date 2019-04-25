//
//  week_cell_model.swift
//  Weather_app
//
//  Created by Mehtab Singh Sidhu on 4/25/19.
//  Copyright © 2019 Mehtab Singh Sidhu. All rights reserved.
//

import UIKit

import CoreLocation

class week_cell_model: UITableViewCell {
    
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

struct week_cell {
    let summary: String
    let temperatureHigh: Double
    let temperatureLow: Double
}
