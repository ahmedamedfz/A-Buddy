////
////  ScannerView.swift
////  A-Buddy
////
////  Created by Ahmad Fariz on 25/03/23.
////
//
//import SwiftUI
//import AVFoundation
//
//struct ScannerView: UIViewControllerRepresentable {
//    let buddy: Buddy
//    
//    func makeCoordinator() -> Coordinator {
//        Coordinator(self)
//    }
//    
//    func makeUIViewController(context: Context) -> ScannerViewController {
//        let scannerViewController = ScannerViewController()
//        scannerViewController.delegate = context.coordinator
//        return scannerViewController
//    }
//    
//    func updateUIViewController(_ uiViewController: ScannerViewController, context: Context) {}
//    
//    class Coordinator: NSObject, AVCaptureMetadataOutputObjectsDelegate {
//        let parent: ScannerView
//        
//        init(_ parent: ScannerView) {
//            self.parent = parent
//        }
//        
//        func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
//            if let metadataObject = metadataObjects.first {
//                guard let readableObject = metadataObject as? AVMetadataMachineReadableCodeObject else { return }
//                guard let stringValue = readableObject.stringValue else { return }
//                
//                let components = stringValue.components(separatedBy: "\n")
//                if components.count == 3 {
//                    parent.buddy.buddyNick = components[0]
//                    parent.buddy.buddyBirthday = Date() // You'll need to convert the string to a Date object here
//                    parent.buddy.buddyPhoneNumber = components[2]
//                }
//            }
//        }
//    }
//}
//
//class ScannerViewController: UIViewController {
//    var delegate: AVCaptureMetadataOutputObjectsDelegate?
//    
//    var captureSession: AVCaptureSession!
//    var previewLayer: AVCaptureVideoPreviewLayer!
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        view.backgroundColor = UIColor.black
//        captureSession = AVCaptureSession()
//        
//        guard let videoCaptureDevice = AVCaptureDevice.default(for: .video) else { return }
//        let videoInput: AVCaptureDeviceInput
//        
//        do {
//            videoInput = try AVCaptureDeviceInput(device: videoCaptureDevice)
//        } catch {
//            return
//        }
//        
//        if (captureSession.canAddInput(videoInput)) {
//            captureSession.addInput(videoInput)
//        } else {
//            failed()
//            return
//        }
//        
//        let metadataOutput = AVCaptureMetadataOutput()
//        
//        if (captureSession.canAddOutput(metadataOutput)) {
//            captureSession.addOutput(metadataOutput)
//            
//            metadataOutput.setMetadataObjectsDelegate(delegate, queue: DispatchQueue.main)
//            metadataOutput.metadataObjectTypes = [.qr]
//        } else {
//            failed()
//            return
//        }
//        
//        previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
//        previewLayer.frame = view.layer.bounds
//        previewLayer.videoGravity = .resizeAspectFill
//        view.layer.addSublayer(previewLayer)
//        
//        captureSession.startRunning()
//    }
//    
//    func failed() {
//        let ac = UIAlertController(title: "Scanning not supported", message: "Your device does not support scanning a code from an item. Please use a device with a camera.", preferredStyle: .alert)
//        ac.addAction(UIAlertAction(title: "OK", style: .default))
//        present(ac, animated: true)
//        captureSession = nil
//    }
//    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        
//        if (captureSession?.isRunning == false) {
//            captureSession.startRunning()
//        }
//    }
//    
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//        
//        if (captureSession?.isRunning == true) {
//            captureSession.stopRunning()
//        }
//    }
//}
