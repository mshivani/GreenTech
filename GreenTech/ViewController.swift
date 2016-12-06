//
//  ViewController.swift
//  GreenTech
//
//  Created by Shivani Murali on 9/26/16.
//  Copyright © 2016 Shivani Murali. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
import Firebase

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    
    @IBOutlet weak var mapView: MKMapView!
    
    var locationManager: CLLocationManager!
    
    var longPressRecogniser:UILongPressGestureRecognizer!//(target: self, action: "handleLongPress:")
    
    var lat = 0.0
    var long = 0.0
    var name = ""
    var type = ""
    var status = ""
    var power = ""
    var fuel = ""
    var secondaryFuel = ""
    
    
    var ref: FIRDatabaseReference!
    var sitesRef: FIRDatabaseReference!
    
    var sites: [FIRDataSnapshot]! = []
    var _refHandle: FIRDatabaseHandle!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        longPressRecogniser = UILongPressGestureRecognizer(target: self, action: #selector(ViewController.handleLongPress(_:)))
        longPressRecogniser!.minimumPressDuration = 1.0
        mapView.addGestureRecognizer(longPressRecogniser!)

        
        locationManager = CLLocationManager()
        locationManager.requestAlwaysAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.delegate = self
        locationManager.startUpdatingLocation()
        
        mapView.showsUserLocation = true
        mapView.delegate = self
        
        //ref = FIRDatabase.database().reference()
        //sitesRef = ref.child("sites")
    
        
        if(lat != 0.0 && long != 0.0){
            let annotation = MKPointAnnotation()
            let coordinate = CLLocationCoordinate2D(latitude: lat, longitude: long)
            annotation.coordinate = coordinate
            annotation.title = name
            annotation.subtitle = type
            mapView.addAnnotation(annotation)
        }

        
    }
    
    /*
    deinit {
        self.ref.child("messages").removeObserverWithHandle(_refHandle)
    }
    
    
    func configureDatabase() {
        ref = FIRDatabase.database().reference()
        // Listen for new messages in the Firebase database
        _refHandle = self.ref.child("messages").observe(.childAdded, with: { [weak self] (snapshot) -> Void in
            guard let strongSelf = self else { return }
            strongSelf.messages.append(snapshot)
            strongSelf.clientTable.insertRows(at: [IndexPath(row: strongSelf.messages.count-1, section: 0)], with: .automatic)
            })
    }
 */

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    @IBAction func leftSideButtonTapped(sender: AnyObject) {
        let appDelegate:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        appDelegate.centerContainer!.toggleDrawerSide(MMDrawerSide.Left, animated: true, completion: nil)
    }

    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations.last
        let center = CLLocationCoordinate2D(latitude: location!.coordinate.latitude, longitude: location!.coordinate.longitude)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta:    0.1))
        
        mapView.setRegion(region, animated: true)
        
        locationManager.stopUpdatingLocation()
        
    }
    
    func handleLongPress(getstureRecognizer : UIGestureRecognizer){
        
        // -------------- Expected Steps ---------------
        //
        // Change view to Add Entry
        // Allow them to enter all required information
        // Send that data to database
        // Pin will be set based off entries in database
        //
        // ---------------------------------------------
        
        if getstureRecognizer.state != .Began { return }
        
        let touchPoint = getstureRecognizer.locationInView(self.mapView)
        let touchMapCoordinate = mapView.convertPoint(touchPoint, toCoordinateFromView: mapView)
        
        //let annotation = MKPointAnnotation()
        //annotation.coordinate = touchMapCoordinate
        
        //mapView.addAnnotation(annotation)
        
        
        let addEntryViewController = self.storyboard?.instantiateViewControllerWithIdentifier("AddEntryViewController") as! AddEntryViewController
        
        addEntryViewController.lat = touchMapCoordinate.latitude
        addEntryViewController.long = touchMapCoordinate.longitude
       
        
        self.presentViewController(addEntryViewController, animated:true, completion:nil)
        
                
    }
    
    
   /* override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "AddEntrySegue" {
            if let destination = segue.destinationViewController as? AddEntryViewController {
                destination.lat = self.lat
                destination.long = self.long
                destination.titleTextField.text! = self.name
            }
        }
    }*/

    
    
}

