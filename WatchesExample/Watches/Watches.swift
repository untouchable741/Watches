//
//  Watches.swift
//  WatchesExample
//
//  Created by HuuTaiVuong on 9/13/16.
//  Copyright © 2016 Huu Tai Vuong. All rights reserved.
//

import Foundation

public class Watches {
    
    /**
     Callback closure type for tock function
     */
    public typealias TockCallbackClosure = ((String, NSTimeInterval) -> Void)
    
    /**
     Default callback in case no callback closure specified in tock function
     */
    public static var defaultTockCallbackClosure : TockCallbackClosure = { identifier , interval in
        debugPrint("Elapsed interval for \(identifier) is \(interval)")
    }
    
    /**
     Dictionary that saved tracked time stamps based on id
     */
    static var trackedTimeStamps = [String : NSDate]()
    
    var identifier : String
    
    var startTime : NSDate?
    
    init(identifier: String) {
        self.identifier = identifier
    }
    
    deinit {
        debugPrint("Deinit watches \(identifier)")
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
        Create watches instance with idenfitifer
     */
    public static func create(identifier: String) -> Watches {
        let watchesInstance = Watches(identifier: identifier)
        return watchesInstance
    }
    
    /**
        Start tracking time and execute closure
     */
    public func tick(closure: Void -> Void) -> Watches {
        self.startTime = NSDate()
        closure()
        return self
    }
    
    /**
        Collect elapsed time
     */
    public func tock(callBack: TockCallbackClosure = defaultTockCallbackClosure) {
        guard let validTickTime = startTime else {
            callBack(identifier, 0)
            return
        }
        callBack(identifier, NSDate().timeIntervalSinceDate(validTickTime))
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
        Start tracking timestamp with provided identifier
     */
    public static func tick(identifier: String) {
        trackedTimeStamps[identifier] = NSDate()
    }
    
    /**
        Collect elapse time for requested identifier
    */
    public static func tock(identifier: String, callback: TockCallbackClosure = defaultTockCallbackClosure) {
        guard let validTickTime = trackedTimeStamps[identifier] else {
            callback(identifier, 0)
            return
        }
        
        callback(identifier, NSDate().timeIntervalSinceDate(validTickTime))
        
        trackedTimeStamps[identifier] = nil
    }
}