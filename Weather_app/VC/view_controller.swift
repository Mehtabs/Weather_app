//
//  view_controller.swift
//  Weather_app
//
//  Created by Mehtab Singh Sidhu on 4/25/19.
//  Copyright © 2019 Mehtab Singh Sidhu. All rights reserved.
//

import UIKit
import CoreLocation



/******************************************************************************/
/******************************************************************************/
// start over clean

//class view_controller: UITableViewController, UITableViewDelegate, UITableViewDataSource, CLLocationManagerDelegate {

//dont need UITableViewDelegate and UITableViewDataSource - redundant

class view_controller: UITableViewController, CLLocationManagerDelegate {
    var locationManager: CLLocationManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager = CLLocationManager()
        locationManager.delegate = self
        switch CLLocationManager.authorizationStatus() {
        case .authorizedWhenInUse, .authorizedAlways:
            self.startMonitoringLocation()
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        default:
            print("permission denied")
            break;
        }
        
        // other things...
    }
    
    func startMonitoringLocation() {
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startMonitoringSignificantLocationChanges()
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        // The user has given permission to your app
        if status == .authorizedWhenInUse || status == .authorizedAlways {
            self.startMonitoringLocation()
        }
    }
    
    var cellViewModels = [WeatherCellViewModel]()
    var current_s: String = ""
    var current_t: Double = 0
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        // download weather data here
        let userLocation:CLLocation = locations[0] as CLLocation
        print("user lat \(userLocation.coordinate.latitude)")
        print("user lon \(userLocation.coordinate.longitude)")
        let wapi = WeatherAPIClient()
        let wep = WeatherEndpoint.currentForecast(latitude: "\(userLocation.coordinate.latitude)", longitude: "\(userLocation.coordinate.longitude)")
        
        /////////
        wapi.weather_current(with: wep) { (either) in
            switch either {
            case .value(let curr):
                print(curr)
                self.current_s = curr.summary
                self.current_t = curr.temperature
//                self.cellViewModels = [curr].map {
//                    WeatherCellViewModel(summary: $0.summary, temperatureHigh: $0.temperature, temperatureLow: $0.temperature)
//                }
//                DispatchQueue.main.async {
//                    self.tableView.reloadData()
//
//                }
                
            case .error(let error):
                print(error)
            }
        }
        ////////
        wapi.weather(with: wep) { (either) in
            switch either {
            case .value(let daily):
                print(daily)
                self.cellViewModels += daily.data.map {
                    WeatherCellViewModel(time: $0.time, summary: $0.summary, icon: $0.icon, temperatureHigh: $0.temperatureHigh, temperatureLow: $0.temperatureLow)
                }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            case .error(let error):
                print(error)
            }
        }
    }
    //////////////////////////////
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }
    
    ///////////////////////////////
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return cellViewModels.count
    }
    ////////////////////
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.row == 0{
            return 200.0
        
        }
        return 45.5
    }
    
    
    ///////////////////
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell: UITableViewCell = UITableViewCell(style:UITableViewCellStyle.value1, reuseIdentifier: "current_cell_view")
            
            
            cell.detailTextLabel?.text = current_s
            cell.textLabel?.text = String(format: "%0.0f", current_t)
            cell.textLabel?.font = UIFont.init(name: "Helvetica", size: 70)
            
            return cell
        }
        
        else {
            let cell: UITableViewCell = UITableViewCell(style:UITableViewCellStyle.subtitle, reuseIdentifier: "week_cell_view")
            let cellViewModel = cellViewModels[indexPath.row]
            //cell.textLabel?.text = cellViewModel.summary
            cell.detailTextLabel?.text = cellViewModel.summary
            
            let formatter = DateFormatter()
            formatter.dateFormat = "EEEE"
            let day = formatter.string(from: Date(timeIntervalSince1970: TimeInterval(cellViewModel.time)))
            
            cell.textLabel?.text =  day + " High: " + String(format: "%0.0f", arguments:[cellViewModel.temperatureHigh]) + " Low: " + String(format: "%0.0f", arguments:[cellViewModel.temperatureLow])
            //cell.textLabel?.text = String(format: "%0.2f", arguments:[cellViewModel.temperatureLow])
            
            cell.imageView?.image = UIImage(named: cellViewModel.icon)
            return cell
            
        }
        
        
        
        /////////////////////////////////////////////
//        let cell = tableView.dequeueReusableCell(withIdentifier: "wcell", for: indexPath)
//        
//        // Configure the cell...
//        let cellViewModel = cellViewModels[indexPath.row]
//        //cell.textLabel?.text = cellViewModel.summary
//        cell.detailTextLabel?.text = cellViewModel.summary
//        cell.textLabel?.text = "High: " + String(format: "%0.0f", arguments:[cellViewModel.temperatureHigh]) + " Low: " + String(format: "%0.0f", arguments:[cellViewModel.temperatureLow])
//        //cell.textLabel?.text = String(format: "%0.2f", arguments:[cellViewModel.temperatureLow])
//        
//        return cell
    }
}
