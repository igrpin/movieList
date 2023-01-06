//
//  CheckInternetConnection.swift
//  movielist
//
//  Created by Igor Pino de Souza on 02/01/23.
//

import Foundation
import Network

class CheckInternetConnection {
    static let shared = CheckInternetConnection()

    let monitor = NWPathMonitor()
    private var status: NWPath.Status = .requiresConnection
    var isReachableOnCellular: Bool = true
    public var isConnected: Bool = false

    private init() {}
    
    func startMonitoring() {
        monitor.pathUpdateHandler = { [weak self] path in
            self?.status = path.status
            self?.isReachableOnCellular = path.isExpensive

            if path.status == .satisfied {
                print("Connected!")
                self?.isConnected = true
            } else {
                print("No connection!")
            }
        }
        let queue = DispatchQueue(label: "CheckInternetConnection")
        monitor.start(queue: queue)
        
    }

    func stopMonitoring() {
        monitor.cancel()
    }
}
