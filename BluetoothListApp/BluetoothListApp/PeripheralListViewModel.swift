//
//  PeripheralListViewModel.swift
//  BluetoothListApp
//
//  Created by HARRY G GOODWIN on 13/5/2024.
//

import CoreBluetooth
import Foundation
import SwiftUI

@Observable
final class PeripheralListViewModel: NSObject {
    private let bluetoothManager: CBCentralManager
    private(set) var state: CBManagerState = .unknown
    
    private var discoveredPeripherals: Set<CBPeripheral> = []
    private(set) var displayPeripherals: [CBPeripheral] = []
      
    init(
        bluetoothManager: CBCentralManager
    ) {
        self.bluetoothManager = bluetoothManager
        super.init()
        bluetoothManager.delegate = self
    }

    func scan() {
        bluetoothManager.scanForPeripherals(withServices: nil, options: nil)
    }
}

extension PeripheralListViewModel: CBCentralManagerDelegate {
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        state = central.state
    }
    
    func centralManager(
        _ central: CBCentralManager,
        didDiscover peripheral: CBPeripheral,
        advertisementData: [String : Any],
        rssi RSSI: NSNumber
    ) {
        if !discoveredPeripherals.contains(peripheral) {
            discoveredPeripherals.insert(peripheral)
            displayPeripherals.append(peripheral)
        }
    }
}
