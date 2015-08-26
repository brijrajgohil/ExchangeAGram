//
//  MapViewController.swift
//  ExchangeAGram
//
//  Created by Beetu on 8/26/15.
//  Copyright (c) 2015 Brijrajsinh Gohil. All rights reserved.
//

import UIKit
import MapKit
import CoreData

class MapViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
//        let location = CLLocationCoordinate2D(latitude: 48.868639224587, longitude: 2.37119161036255)
//        let span = MKCoordinateSpanMake(0.05, 0.05)
//        let region = MKCoordinateRegion(location, span)
//        mapView.setRegion(region, animated: true)
//        let annotation = MKPointAnnotation()
//        annotation.setCoordinate(location)
//        annotation.title = "Canal Saint-Martin"
//        annotation.subtitle = "Paris"
//        
//        mapView.addAnnotation(annotation)
        
        let request = NSFetchRequest(entityName: "FeedItem")
        let appDelegate: AppDelegate = (UIApplication.sharedApplication().delegate as AppDelegate)
        let context = appDelegate.managedObjectContext!
        var error: NSError?
        let itemArray = context.executeFetchRequest(request, error: &error)
        println(error)
        
        if itemArray!.count > 0 {
            for item in itemArray! {
                let location = CLLocationCoordinate2D(latitude: Double(item.latitude), longitude: Double(item.longitude))
                let span = MKCoordinateSpanMake(0.05, 0.05)
                let region = MKCoordinateRegion(center: location, span: span)
                mapView.setRegion(region, animated: true)
                let annotation = MKPointAnnotation()
                annotation.setCoordinate(location)
                annotation.title = item.caption
                mapView.addAnnotation(annotation)
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
