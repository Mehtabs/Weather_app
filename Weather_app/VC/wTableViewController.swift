////
////  wTableViewController.swift
////  Weather_app
////
////  Created by Mehtab Singh Sidhu on 2/12/19.
////  Copyright © 2019 Mehtab Singh Sidhu. All rights reserved.
////
//
//import UIKit
//import CoreLocation
//
//
//
//
////class wTableViewController: UITableViewController {
////
////    var cellViewModels = [WeatherCellViewModel]()
////
////    override func viewDidLoad() {
////        super.viewDidLoad()
////
////        let wapi = WeatherAPIClient()
////        let wep = WeatherEndpoint.currentForecast(latitude: "37.8267", longitude: "-122.4233")
////        wapi.weather(with: wep) { (either) in
////            switch either {
////            //case .value(let temp):
////            //    print(temp)
////            //    self.cellViewModels = temp.map {
////            //        WeatherCellViewModel(description: $0.description)
////            //    }
////            //    DispatchQueue.main.async {
////            //        self.tableView.reloadData()
////            //
////            //}
////            case .value(let daily):
////                print(daily)
////                self.cellViewModels = daily.data.map {
////                    WeatherCellViewModel(summary: $0.summary, temperatureHigh: $0.temperatureHigh, temperatureLow: $0.temperatureLow)
////                }
////                DispatchQueue.main.async {
////                    self.tableView.reloadData()
////                }
////            case .error(let error):
////                print(error)
////            }
////        }
////
////    }
////
////
////    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
////        // #warning Incomplete implementation, return the number of rows
////        return cellViewModels.count
////    }
////
////
////    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
////        let cell = tableView.dequeueReusableCell(withIdentifier: "wcell", for: indexPath)
////
////        // Configure the cell...
////        let cellViewModel = cellViewModels[indexPath.row]
////        //cell.textLabel?.text = cellViewModel.summary
////        cell.detailTextLabel?.text = cellViewModel.summary
////        cell.textLabel?.text = "High: " + String(format: "%0.0f", arguments:[cellViewModel.temperatureHigh]) + " Low: " + String(format: "%0.0f", arguments:[cellViewModel.temperatureLow])
////        //cell.textLabel?.text = String(format: "%0.2f", arguments:[cellViewModel.temperatureLow])
////
////        return cell
////    }
////
////}
//
//
//
//// location
//
////WORKING SET BRACE and this class declaration TOGETHER
////class wTableViewController: UITableViewController, CLLocationManagerDelegate {
//
//
////
////    var cellViewModels = [WeatherCellViewModel]()
////    //var locationManager:CLLocationManager!
////    var manager:CLLocationManager!
////
////   // override func viewDidLoad() {
////   //     super.viewDidLoad()
////   //     // Do any additional setup after loading the view, typically from a nib.
////   // }
////    override func viewDidLoad() {
////        super.viewDidLoad()
////
////
////        locationManager = CLLocationManager()
////        locationManager.delegate = self
////        locationManager.desiredAccuracy = kCLLocationAccuracyBest
////        locationManager.requestAlwaysAuthorization()
////        locationManager.startUpdatingLocation()
////        ////////////////////////////
////
////        let wapi = WeatherAPIClient()
////        let wep = WeatherEndpoint.currentForecast(latitude: "37.8267", longitude: "-122.4233")
////        wapi.weather(with: wep) { (either) in
////            switch either {
////                //case .value(let temp):
////                //    print(temp)
////                //    self.cellViewModels = temp.map {
////                //        WeatherCellViewModel(description: $0.description)
////                //    }
////                //    DispatchQueue.main.async {
////                //        self.tableView.reloadData()
////                //
////            //}
////            case .value(let daily):
////                print(daily)
////                self.cellViewModels = daily.data.map {
////                    WeatherCellViewModel(summary: $0.summary, temperatureHigh: $0.temperatureHigh, temperatureLow: $0.temperatureLow)
////                }
////                DispatchQueue.main.async {
////                    self.tableView.reloadData()
////                }
////            case .error(let error):
////                print(error)
////            }
////        }
////
////    }
////
////    func locationManager(manager:CLLocationManager, didUpdateLocations locations:AnyObject[]) {
////        println("locations = \(locations)")
////        gpsResult.text = "success"
////    }
////
////    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
////        // #warning Incomplete implementation, return the number of rows
////        return cellViewModels.count
////    }
////    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
////        let cell = tableView.dequeueReusableCell(withIdentifier: "wcell", for: indexPath)
////
////        // Configure the cell...
////        let cellViewModel = cellViewModels[indexPath.row]
////        //cell.textLabel?.text = cellViewModel.summary
////        cell.detailTextLabel?.text = cellViewModel.summary
////        cell.textLabel?.text = "High: " + String(format: "%0.0f", arguments:[cellViewModel.temperatureHigh]) + " Low: " + String(format: "%0.0f", arguments:[cellViewModel.temperatureLow])
////        //cell.textLabel?.text = String(format: "%0.2f", arguments:[cellViewModel.temperatureLow])
////
////        return cell
////    }
////
////    override func didReceiveMemoryWarning() {
////        super.didReceiveMemoryWarning()
////        // Dispose of any resources that can be recreated.
////    }
////
//////    override func viewWillAppear(_ animated: Bool) {
//////        super.viewWillAppear(animated)
//////
//////        determineMyCurrentLocation()
//////    }
//////
//////
//////    func determineMyCurrentLocation() {
//////        locationManager = CLLocationManager()
//////        locationManager.delegate = self
//////        locationManager.desiredAccuracy = kCLLocationAccuracyBest
//////        locationManager.requestAlwaysAuthorization()
//////
//////        if CLLocationManager.locationServicesEnabled() {
//////            locationManager.startUpdatingLocation()
//////            //locationManager.startUpdatingHeading()
//////        }
//////    }
//////
//////    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//////        let userLocation:CLLocation = locations[0] as CLLocation
//////
//////        // Call stopUpdatingLocation() to stop listening for location updates,
//////        // other wise this function will be called every time when user location changes.
//////
//////        // manager.stopUpdatingLocation()
//////
//////        print("user latitude = \(userLocation.coordinate.latitude)")
//////        print("user longitude = \(userLocation.coordinate.longitude)")
//////    }
//////
//////    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error)
//////    {
//////        print("Error \(error)")
//////    }
//    
//    
//    /******************************************************************************
//    // ******************************************************************************
//     // THIS WAS WORKING CHUNK
//    var locationManager: CLLocationManager!
//   
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        locationManager = CLLocationManager()
//        locationManager.delegate = self
//        switch CLLocationManager.authorizationStatus() {
//        case .authorizedWhenInUse, .authorizedAlways:
//            self.startMonitoringLocation()
//        case .notDetermined:
//            locationManager.requestWhenInUseAuthorization()
//        default:
//            print("permission denied")
//            break;
//        }
//        
//        // other things...
//    }
//    
//    func startMonitoringLocation() {
//        locationManager.desiredAccuracy = kCLLocationAccuracyBest
//        locationManager.startMonitoringSignificantLocationChanges()
//    }
//    
//    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
//        // The user has given permission to your app
//        if status == .authorizedWhenInUse || status == .authorizedAlways {
//            self.startMonitoringLocation()
//        }
//    }
//    
//    var cellViewModels = [WeatherCellViewModel]()
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        // download weather data here
//        let userLocation:CLLocation = locations[0] as CLLocation
//        print("user lat \(userLocation.coordinate.latitude)")
//        print("user lon \(userLocation.coordinate.longitude)")
//        let wapi = WeatherAPIClient()
//        let wep = WeatherEndpoint.currentForecast(latitude: "\(userLocation.coordinate.latitude)", longitude: "\(userLocation.coordinate.longitude)")
//        
//        /////////
//        wapi.weather_current(with: wep) { (either) in
//            switch either {
//                case .value(let curr):
//                    print(curr)
//                    self.cellViewModels = [curr].map {
//                        WeatherCellViewModel(summary: $0.summary, temperature: $0.temperature)
//                    }
////                    DispatchQueue.main.async {
////                        self.tableView.reloadData()
////
////                    }
////            case .value(let daily):
////                print(daily)
////                self.cellViewModels = daily.data.map {
////                    WeatherCellViewModel(summary: $0.summary, temperatureHigh: $0.temperatureHigh, temperatureLow: $0.temperatureLow)
////                }
////                DispatchQueue.main.async {
////                    self.tableView.reloadData()
////                }
//            case .error(let error):
//                print(error)
//            }
//        }
//        ////////
//        wapi.weather(with: wep) { (either) in
//            switch either {
//                //case .value(let temp):
//                //    print(temp)
//                //    self.cellViewModels = temp.map {
//                //        WeatherCellViewModel(description: $0.description)
//                //    }
//                //    DispatchQueue.main.async {
//                //        self.tableView.reloadData()
//                //
//            //}
//            case .value(let daily):
//                print(daily)
//                self.cellViewModels += daily.data.map {
//                    WeatherCellViewModel(summary: $0.summary, temperatureHigh: $0.temperatureHigh, temperatureLow: $0.temperatureLow)
//                }
//                DispatchQueue.main.async {
//                    self.tableView.reloadData()
//                }
//            case .error(let error):
//                print(error)
//            }
//        }
//    }
//    
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return cellViewModels.count
//    }
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
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
//    }
//     // ******************************************************************************
//     ******************************************************************************/
// 
// 
//// is WORKING SECTION is in use
//// uncomment this brace
//// rm everything after
//// call this WORKING SET BRACE
////}
//
//
//
//
//
///******************************************************************************/
///******************************************************************************/
//// start over clean
//
//class wTableViewController: UITableViewController, CLLocationManagerDelegate {
//    
//    var locationManager: CLLocationManager!
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        locationManager = CLLocationManager()
//        locationManager.delegate = self
//        switch CLLocationManager.authorizationStatus() {
//        case .authorizedWhenInUse, .authorizedAlways:
//            self.startMonitoringLocation()
//        case .notDetermined:
//            locationManager.requestWhenInUseAuthorization()
//        default:
//            print("permission denied")
//            break;
//        }
//        
//        // other things...
//    }
//    
//    func startMonitoringLocation() {
//        locationManager.desiredAccuracy = kCLLocationAccuracyBest
//        locationManager.startMonitoringSignificantLocationChanges()
//    }
//    
//    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
//        // The user has given permission to your app
//        if status == .authorizedWhenInUse || status == .authorizedAlways {
//            self.startMonitoringLocation()
//        }
//    }
//    
//    var cellViewModels = [WeatherCellViewModel]()
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        // download weather data here
//        let userLocation:CLLocation = locations[0] as CLLocation
//        print("user lat \(userLocation.coordinate.latitude)")
//        print("user lon \(userLocation.coordinate.longitude)")
//        let wapi = WeatherAPIClient()
//        let wep = WeatherEndpoint.currentForecast(latitude: "\(userLocation.coordinate.latitude)", longitude: "\(userLocation.coordinate.longitude)")
//        
//        /////////
//        wapi.weather_current(with: wep) { (either) in
//            switch either {
//            case .value(let curr):
//                print(curr)
//                self.cellViewModels = [curr].map {
//                    WeatherCellViewModel(summary: $0.summary, temperatureHigh: $0.temperature, temperatureLow: $0.temperature)
//                }
//                DispatchQueue.main.async {
//                    self.tableView.reloadData()
//                    
//                }
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
//                    WeatherCellViewModel(summary: $0.summary, temperatureHigh: $0.temperatureHigh, temperatureLow: $0.temperatureLow)
//                }
//                DispatchQueue.main.async {
//                    self.tableView.reloadData()
//                }
//            case .error(let error):
//                print(error)
//            }
//        }
//    }
//    
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return cellViewModels.count
//    }
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
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
//    }
//}

