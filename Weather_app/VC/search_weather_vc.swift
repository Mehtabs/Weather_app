//
//  search_weather_vc.swift
//  Weather_app
//
//  Created by Mehtab Singh Sidhu on 5/1/19.
//  Copyright © 2019 Mehtab Singh Sidhu. All rights reserved.
//

//
// refered to stack overflow to get help with async
// https://stackoverflow.com/questions/37167075/why-geocodeaddressstring-doesnt-change-external-variable
//


import UIKit
import CoreLocation

class search_weather_vc: UITableViewController, CLLocationManagerDelegate {

    var locationManager: CLLocationManager!
    
    
    
    var lat: String = ""
    var lon: String = ""
    var loc: String = ""
    var cellViewModels = [WeatherCellViewModel]()
    var current_s: String = ""
    var current_t: Double = 0
    //var current_cell_view_model = curr_wcell_vm
    var curr_cell = curr_wcell_vm(summary: "", temperature: 0)
    
    
    /*******************************/
    //var coordinate: CLLocationCoordinate2D? {
    
    
    
    
        
    

    
    //var coordinate: CLLocationCoordinate2D? {
        
//        getCoordinateFrom(address: self.loc) { coordinate, error in
//            guard let coordinate = coordinate, error == nil else { return }
//
//
//        }
       // didSet {
    
    
    
    
    /*******************************/
    
    
    
    
    
    
    var chooseCoordinates = CLLocationCoordinate2D()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager = CLLocationManager()
        locationManager.delegate = self
        
        
        
        ////////////
        
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(self.loc) { (placemarks, error) in
            
            //let geocoder = CLGeocoder()
            //geocoder.geocodeAddressString(self.loc!) { placemarks, error in
            if error != nil {
                print(error!)
            }
            
            if let placemark = placemarks?.first {
                let coordinates: CLLocationCoordinate2D = placemark.location!.coordinate
                self.chooseCoordinates = coordinates
                // call the method that uses `chooseCoordinates` here
                self.lat = String(format:"%.6f", (self.chooseCoordinates.latitude))
                self.lon = String(format:"%.6f", (self.chooseCoordinates.longitude))
                
                print("TTTTTTTTTTT", self.loc, self.lat, self.lon)
                //doSomethingWithCoordinates()
                
                let wapi = WeatherAPIClient()
                //let wep = WeatherEndpoint.currentForecast(latitude: "\(userLocation.coordinate.latitude)", longitude: "\(userLocation.coordinate.longitude)")
                let wep = WeatherEndpoint.currentForecast(latitude: self.lat, longitude: self.lon)
                
                /////////
                wapi.weather_current(with: wep) { (either) in
                    switch either {
                    case .value(let curr):
                        print(curr)
                        //var curr_cell = curr_wcell_vm(summary: curr.summary, temperature: curr.temperature)
                        self.curr_cell.summary = curr.summary
                        self.curr_cell.temperature = curr.temperature
                        //self.current_cell_view_model.summary = curr.summary
                        //self.current_cell_view_model.temperature = curr.temperature
                        
                        self.current_s = curr.summary
                        self.current_t = curr.temperature
                        
                        
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
                            WeatherCellViewModel(time: $0.time, summary: $0.summary, temperatureHigh: $0.temperatureHigh, temperatureLow: $0.temperatureLow)
                        }
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                        }
                    case .error(let error):
                        print(error)
                    }
                }
                
            }
        }
        
        
        
        
       
        
        // other things...
        
        
//        getLocation(from: loc) { location in
//            print("LOCATION", self.loc)
//            self.lat = String(format:"%.6f", (location?.latitude)!)
//            self.lon = String(format:"%.6f", (location?.longitude)!)
//
//
//        }
        
//        let wapi = WeatherAPIClient()
//        //let wep = WeatherEndpoint.currentForecast(latitude: "\(userLocation.coordinate.latitude)", longitude: "\(userLocation.coordinate.longitude)")
//        let wep = WeatherEndpoint.currentForecast(latitude: self.lat, longitude: self.lon)
//
//        /////////
//        wapi.weather_current(with: wep) { (either) in
//            switch either {
//            case .value(let curr):
//                print(curr)
//                //var curr_cell = curr_wcell_vm(summary: curr.summary, temperature: curr.temperature)
//                self.curr_cell.summary = curr.summary
//                self.curr_cell.temperature = curr.temperature
//                //self.current_cell_view_model.summary = curr.summary
//                //self.current_cell_view_model.temperature = curr.temperature
//
//                self.current_s = curr.summary
//                self.current_t = curr.temperature
//
//
//            case .error(let error):
//                print(error)
//            }
//        }
//        ////////
//        wapi.weather(with: wep) { (either) in
//            switch either {
//            case .value(let daily):
//                print(daily)
//                self.cellViewModels += daily.data.map {
//                    WeatherCellViewModel(time: $0.time, summary: $0.summary, temperatureHigh: $0.temperatureHigh, temperatureLow: $0.temperatureLow)
//                }
//                DispatchQueue.main.async {
//                    self.tableView.reloadData()
//                }
//            case .error(let error):
//                print(error)
//            }
//        }
        
        
        
     // end of view did load
    }
    
    
    
    
    
//    func getLocation(from address: String, completion: @escaping (_ location: CLLocationCoordinate2D?)-> Void) {
//        let geocoder = CLGeocoder()
//        geocoder.geocodeAddressString(address) { (placemarks, error) in
//            guard let placemarks = placemarks,
//                let location = placemarks.first?.location?.coordinate else {
//                    return
//            }
//            completion(location)
//        }
//    }
    

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    
        
        
        
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
            let cell: UITableViewCell = UITableViewCell(style:UITableViewCellStyle.value1, reuseIdentifier: "s_w_curr_cell")
            
            
            //cell.detailTextLabel?.text = current_s
            cell.detailTextLabel?.text = curr_cell.summary
            
            cell.textLabel?.text = String(format: "%0.0f", current_t)
            cell.textLabel?.font = UIFont.init(name: "Helvetica", size: 70)
            
            return cell
        }
            
        else {
            let cell: UITableViewCell = UITableViewCell(style:UITableViewCellStyle.subtitle, reuseIdentifier: "s_w_week_cell")
            let cellViewModel = cellViewModels[indexPath.row]
            //cell.textLabel?.text = cellViewModel.summary
            cell.detailTextLabel?.text = cellViewModel.summary
            
            let formatter = DateFormatter()
            formatter.dateFormat = "EEEE"
            let day = formatter.string(from: Date(timeIntervalSince1970: TimeInterval(cellViewModel.time)))
            
            cell.textLabel?.text =  day + " High: " + String(format: "%0.0f", arguments:[cellViewModel.temperatureHigh]) + " Low: " + String(format: "%0.0f", arguments:[cellViewModel.temperatureLow])
            //cell.textLabel?.text = String(format: "%0.2f", arguments:[cellViewModel.temperatureLow])
            
            return cell
        }
        
        
        
        
    }
}

    
    
    
    
    
    
//    ////////////////////////////////
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Uncomment the following line to preserve selection between presentations
//        // self.clearsSelectionOnViewWillAppear = false
//
//        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
//        // self.navigationItem.rightBarButtonItem = self.editButtonItem
//    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//
//    // MARK: - Table view data source
//
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return 0
//    }
//
//    /*
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
//
//        // Configure the cell...
//
//        return cell
//    }
//    */
//
//    /*
//    // Override to support conditional editing of the table view.
//    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
//        // Return false if you do not want the specified item to be editable.
//        return true
//    }
//    */
//
//    /*
//    // Override to support editing the table view.
//    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
//            // Delete the row from the data source
//            tableView.deleteRows(at: [indexPath], with: .fade)
//        } else if editingStyle == .insert {
//            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
//        }
//    }
//    */
//
//    /*
//    // Override to support rearranging the table view.
//    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
//
//    }
//    */
//
//    /*
//    // Override to support conditional rearranging of the table view.
//    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
//        // Return false if you do not want the item to be re-orderable.
//        return true
//    }
//    */
//
//    /*
//    // MARK: - Navigation
//
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destinationViewController.
//        // Pass the selected object to the new view controller.
//    }
//    */
//
//}

