//
//  ViewController.swift
//  WatchesExample
//
//  Created by HuuTaiVuong on 9/13/16.
//  Copyright © 2016 Huu Tai Vuong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tryWatches()
    }
    
    func tryWatches() {
        Watches.tick(label: "Playground")
        
        ///Chaining action tracking
        
        /**
         Track with default printing format
         */
        Watches.create(label: "1 million times loop").tick {
            for _ in 0...10000000 {
                
            }
        }.tock()
        
        
        /**
         Track with custom printing format
         */
        Watches.create(label: "2 million times loop").tick {
            for _ in 0...20000000 {
                
            }
        }.tock { debugPrint("Elapse time for \($0) is \($1)")}
        
        
        ///Separated action tracking
        
        let closure = {
            //Do something
            Watches.tock(label: "Closure")
        }
        
        //Start tracking here
        Watches.tick(label: "Closure")
        
        //Sleep for 2 second
        sleep(2)
        
        //Execute closure
        closure()
        
        func doSomething() {
            sleep(3)
        }
        
        //Track elapsed interval
        Watches.tick(label: "LoadProfile")
        
        doSomething()
        
        Watches.tock(label:"LoadProfile") { debugPrint("Time needed for \($0) is \($1)") }
        
        Watches.tock(label:"Playground") { debugPrint("Total time needed for this playground to finished is \($1)") }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

