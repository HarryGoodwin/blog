//
//  BluetoothListAppApp.swift
//  BluetoothListApp
//
//  Created by HARRY G GOODWIN on 13/5/2024.
//

import CoreBluetooth
import SwiftUI

@main
struct BluetoothListApp: App {
    var body: some Scene {
        WindowGroup {
            PeripheralListView(
                viewModel: PeripheralListViewModel(
                    bluetoothManager: CBCentralManager()
                )
            )
        }
    }
}
