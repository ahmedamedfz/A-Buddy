//
//  MyQRGenerator.swift
//  A-Buddy
//
//  Created by Ahmad Fariz on 25/03/23.
//

import SwiftUI
import CoreImage.CIFilterBuiltins

struct MyQRGenerator: View {
    let buddy: Buddy
    let context = CIContext()
    let filter = CIFilter.qrCodeGenerator()
    
    var body: some View {
        Image(uiImage: generateQRCode(from: "\(buddy.buddyName ?? "")\n\(buddy.buddyNick ?? "")\n\(formattedBirthday(buddy.buddyBirthday!))\n\(buddy.buddyPhoneNumber ?? "")"))
            .interpolation(.none)
            .resizable()
            .scaledToFit()
            .frame(width: 200, height: 200)
    }
    
    func generateQRCode(from string: String) -> UIImage {
        let data = Data(string.utf8)
        filter.setValue(data, forKey: "inputMessage")
        
        if let outputImage = filter.outputImage {
            if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
                return UIImage(cgImage: cgimg)
            }
        }
        
        return UIImage(systemName: "xmark.circle") ?? UIImage()
    }
    
    func formattedBirthday(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        return dateFormatter.string(from: date)
    }
}
