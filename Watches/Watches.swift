//
//  Watches.swift
//  WatchesExample
//
//  Created by HuuTaiVuong on 9/13/16.
//  Copyright © 2016 Huu Tai Vuong. All rights reserved.
//

import Foundation

@objc
public class Watches: NSObject {
    
    /**
     Callback closure type for tock function
     */
    public typealias TockCallbackClosure = ((String, TimeInterval) -> Void)
    
    /**
     Default callback in case no callback closure specified in tock function
     */
    public static var defaultTockCallbackClosure : TockCallbackClosure = { identifier , interval -> Void in
        if printElapsedTimeAutomatically {
            debugPrint("Elapsed interval for \(identifier) is \(interval)")
        }
    }
    
    /**
     Dictionary that saved tracked time stamps based on id
     */
    static var trackedTimeStamps = [String : Date]()
    
    public static var printElapsedTimeAutomatically = true
    
    var label : String
    
    var startTime : Date?
    
    init(label: String) {
        self.label = label
    }
}

// MARK: Instance's tracking
/**
 Chaining tracking
 e.g: 
        Watches.create("id")
               .tick { - closure to track - }
               .tock ()
 */
public extension Watches {
    
    /**
        Create watches instance with specific idenfitifer
     */
    public static func create(label: String) -> Watches {
        let watchesInstance = Watches(label: label)
        return watchesInstance
    }
    
    /**
        Start tracking execution time for closure
     */
    @discardableResult public func tick(closure: () -> Void) -> Watches {
        self.startTime = Date()
        closure()
        return self
    }
    
    /**
        Start collecting elapsed interval for specific watches's identifier
     */
    @discardableResult public func tock(callBack: TockCallbackClosure = defaultTockCallbackClosure) -> TimeInterval {
        guard let validTickTime = startTime else {
            callBack(label, 0)
            return 0
        }
        
        let elapsedTime = Date().timeIntervalSince(validTickTime)
        
        callBack(label, elapsedTime)
        
        return elapsedTime
    }
}

// MARK: Class's tracking
/**
    
 Use with async callback or delegate
 e.g:
        Watches.tick("id")

        <- Execution code ->

        Watches.tock("id")
*/
public extension Watches {
    
    /**
        Start tracking timestamp for specific watches's identifier
     */
    public static func tick(label: String) {
        trackedTimeStamps[label] = Date()
    }
    
    /**
        Collect elapsed interval for specific watches's identifier
    */
    @discardableResult public static func tock(label: String, callback: TockCallbackClosure = defaultTockCallbackClosure) -> TimeInterval {
        guard let validTickTime = trackedTimeStamps[label] else {
            callback(label, 0)
            return 0
        }
        
        let elapsedTime = Date().timeIntervalSince(validTickTime)
        
        trackedTimeStamps[label] = nil
        
        callback(label, elapsedTime)
        
        return elapsedTime
    }
}
