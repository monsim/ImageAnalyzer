//
//  ViewController.swift
//  calhacks1
//
//  Created by Monsi Magal on 10/7/17.
//  Copyright © 2017 Monsi Magal. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {

  
    @IBOutlet weak var apiButton: UIButton!
    
    @IBAction func sendRequest(_ sender: UIButton) {
        print("in the method")
//        let config = URLSessionConfiguration.default // Session Configuration
//        let session = URLSession(configuration: config) // Load configuration into Session
        //let url = URL(string: "https://vision.googleapis.com/v1/images:annotate?key=AIzaSyAKTabFxyAbqV8W1zSVa-I9SN2HTowL3kE")!

        let jsonObject: [String: Any] = [
            "requests": [
                "image": [
                    "source": [
                        "imageUri": "https://gfp-2a3tnpzj.stackpathdns.com/wp-content/uploads/2017/06/Blaze-m1-300x300.jpg"
                    ]
                ],
                "features": [
                    "type": "LABEL_DETECTION"
                ]
            ]
    
        ]
        
//        let trimmed = jsonObject.stringByTrimmingCharactersInSet(NSCharacterSet.whitespacesAndNewlineCharacterSet())
        let jsonData = try? JSONSerialization.data(withJSONObject: jsonObject)
        let url = URL(string: "https://vision.googleapis.com/v1/images:annotate?key=AIzaSyAKTabFxyAbqV8W1zSVa-I9SN2HTowL3kE")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        request.httpBody = jsonData
        
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                return
            }
            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
            if let responseJSON = responseJSON as? [String: Any] {
                print(responseJSON)
            }
        }
        task.resume()
        
//        print("one")
//        let task = session.dataTask(with: url, completionHandler: {
//            (data, response, error) in
//            print("two")
//            if error != nil {
//                print("three")
//                print(error!.localizedDescription)
//
//            } else {
//
//                do {
//                    print("four")
//                    if let json = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? [String: Any]
//                    {
//                        print("five")
//                        print(json)
//
//                    }
//
//                } catch {
//
//                    print("error in JSONSerialization")
//                    print(error)
//
//                }
//
//
//            }
//
//        })
//        task.resume()
        
//        let urlOne = URL(string: "https://vision.googleapis.com/v1/images:annotate?key=AIzaSyAKTabFxyAbqV8W1zSVa-I9SN2HTowL3kE")!
//        var request = URLRequest(url: urlOne)
//        request.httpMethod = "POST"
//        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//        request.addValue(Bundle.main.bundleIdentifier ?? "", forHTTPHeaderField: "X-Ios-Bundle-Identifier")
//
//        // Build our API request
//        let jsonRequest = [
//            "requests": [
//                "image": [
//                    "content": "https://gfp-2a3tnpzj.stackpathdns.com/wp-content/uploads/2017/06/Blaze-m1-300x300.jpg"
//                ],
//                "features": [
//                    [
//                        "type": "LABEL_DETECTION",
//                        "maxResults": 10
//                    ],
//                    [
//                        "type": "FACE_DETECTION",
//                        "maxResults": 10
//                    ]
//                ]
//            ]
//        ]
//        //let jsonObject = JSON(jsonDictionary: jsonRequest)
//        let json = try? JSONSerialization.jsonObject(jsonRequest)
//
//        if let data = data,
//            let json = try? JSONSerialization.jsonObject(with: #imageLiteral(resourceName: <#T##String#>), options: []) as? [String: Any] {
//            for case let result in json["results"] {
//                if let restaurant = Restaurant(json: result) {
//                    restaurants.append(restaurant)
//                }
//            }
//        }
//
//        // Serialize the JSON
//        guard let data = try? jsonObject.rawData() else {
//            return
//        }
//
//        request.httpBody = data
//
//        // Run the request on a background thread
//        DispatchQueue.global().async { self.runRequestOnBackgroundThread(request) }
    }
    
    @IBAction func apiButton(_ sender: Any) {
        let config = URLSessionConfiguration.default // Session Configuration
        let session = URLSession(configuration: config) // Load configuration into Session
        let url = URL(string: "https://language.googleapis.com/v1/documents:analyzeSentiment?key=AIzaSyAKTabFxyAbqV8W1zSVa-I9SN2HTowL3kE")!
        
        let task = session.dataTask(with: url, completionHandler: {
            (data, response, error) in
            
            if error != nil {
                
                print(error!.localizedDescription)
                
            } else {
                
                do {
                    
                    if let json = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? [String: Any]
                    {
                        
                        //Implement your logic
                        print(json)
                        
                    }
                    
                } catch {
                    
                    print("error in JSONSerialization")
                }
            }
        })
        task.resume()
    }
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("view loaded")
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


   
}

