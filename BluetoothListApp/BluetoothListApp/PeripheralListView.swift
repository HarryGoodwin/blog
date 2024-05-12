//
//  PeripheralListView.swift
//  BluetoothListApp
//
//  Created by HARRY G GOODWIN on 13/5/2024.
//

import SwiftUI
import CoreBluetooth

struct PeripheralListView: View {
    @State var viewModel: PeripheralListViewModel
    
    var body: some View {
        // 1
        switch viewModel.state {
        case .poweredOn:
            List {
                // 2
                ForEach(viewModel.displayPeripherals, id: \.identifier) { peripheral in
                    VStack(alignment: .leading) {
                        Text(peripheral.name ?? "No name")
                        Text(peripheral.identifier.uuidString)
                            .font(.caption)
                    }
                }
            }.task {
                // 3
                viewModel.scan()
            }
        default:
            Text("BLE not available")
        }
    }
}
