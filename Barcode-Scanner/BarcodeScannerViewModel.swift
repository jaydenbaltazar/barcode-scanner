//
//  BarcodeScannerViewModel.swift
//  Barcode-Scanner
//
//  Created by Jayden Baltazar on 10/5/26.
//

import SwiftUI
import Combine

final class BarcodeScannerViewModel: ObservableObject{
    
    @Published var scannedCode = ""
    @Published var alertItem: AlertItem?
    
    var statusText: String {
        scannedCode.isEmpty ? "Not Yet Scanned" : scannedCode
    }
    
    var statusTextColor: Color {
        scannedCode.isEmpty ? Color(.red) : Color(.green)
    }
}

