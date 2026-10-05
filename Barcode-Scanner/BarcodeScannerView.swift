//
//  ContentView.swift
//  Barcode-Scanner
//
//  Created by Jayden Baltazar on 9/27/26.
//

import SwiftUI

struct BarcodeScannerView: View {
    
    @StateObject var viewModel = BarcodeScannerViewModel() // creating a new view model stateobject passing one in observedobject
    
    var body: some View {
        NavigationView {
            VStack{
                
                //Camera
                ScannerView(scannedCode: $viewModel.scannedCode, alertItem: $viewModel.alertItem)
                    .frame(maxWidth: .infinity, maxHeight: 300)
                
                Spacer().frame(height: 60)
                
                // Label for barcode scanner
                Label("Scanned Barcode:", systemImage: "barcode.viewfinder")
                    .font(.system(size: 30))
                    .foregroundStyle(Color(.label))
                
                // Current Barcode
                Text(viewModel.statusText)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundStyle(viewModel.statusTextColor)
                    .padding()
                                
            }
            .navigationTitle("Barcode Scanner")
            .alert(item: $viewModel.alertItem) { alertItem in
                Alert(title: Text(alertItem.title),
                      message: Text(alertItem.message),
                      dismissButton: alertItem.dismissButton)
            }

            
        }
    }
}

#Preview {
    BarcodeScannerView()
}
