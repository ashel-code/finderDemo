//
//  ViewController.swift
//  eScanner
//
//  Created by Алекс Ш on 01.10.2020.
//
import UIKit
import Vision
import VisionKit
import Foundation

var temp2 = ""

class ViewController: UIViewController {
    @IBOutlet weak var scanButton: UIButton!
    
    func testSegue() -> Void {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let preViewController = storyBoard.instantiateViewController(withIdentifier: "lvc") as! preViewController
        self.present(preViewController, animated: true, completion: nil)
    }
    private var ocrTextView = OcrTextView(frame: .zero, textContainer: nil)
    private var ocrRequest = VNRecognizeTextRequest(completionHandler: nil)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        configureOCR()
    }

    
    private func configure() {
        scanButton.addTarget(self, action: #selector(scanDocument), for: .touchUpInside)
    }
    
    
    @objc private func scanDocument() {
        let scanVC = VNDocumentCameraViewController()
        scanVC.delegate = self
        present(scanVC, animated: true)
    }
    
    
    private func processImage(_ image: UIImage) {
        guard let cgImage = image.cgImage else { return }
        // MARK: there
        scanButton.isEnabled = false
        
        let requestHandler = VNImageRequestHandler(cgImage: cgImage, options: [:])
        do {
            try requestHandler.perform([self.ocrRequest])
        } catch {
            print(error)
        }
    }

    
    private func configureOCR() {
        ocrRequest = VNRecognizeTextRequest { (request, error) in
            guard let observations = request.results as? [VNRecognizedTextObservation] else { return }
            
            var ocrText = ""
            for observation in observations {
                guard let topCandidate = observation.topCandidates(1).first else { return }
                
                ocrText += topCandidate.string + "\n"
            }
            
            
            DispatchQueue.main.async {
                
                // MARK: or there
                //self.ocrTextView.text = ocrText
                self.scanButton.isEnabled = true
                
                // проверка на наличие добавки
                
                // переход на другой storyboard
                let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let listCameraViewController = storyBoard.instantiateViewController(withIdentifier: "lvc2") as! listCameraViewController
                self.present(listCameraViewController, animated: true, completion: nil)
                // передача данных
                temp2 = ocrText
                // досюда
                // я не верю в код
                               
                }
            
            }
//        основные настройки
        ocrRequest.recognitionLevel = .accurate
        ocrRequest.recognitionLanguages = ["en-US", "en-GB"]
        ocrRequest.usesLanguageCorrection = true
    }
}


extension ViewController: VNDocumentCameraViewControllerDelegate {
    func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFinishWith scan: VNDocumentCameraScan) {
        guard scan.pageCount >= 1 else {
            controller.dismiss(animated: true)
            return
        }
        
        //scanImageView.image = scan.imageOfPage(at: 0)
        processImage(scan.imageOfPage(at: 0))
        controller.dismiss(animated: true)
    }
    
    func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFailWithError error: Error) {
        //Handle properly error
        controller.dismiss(animated: true)
    }
    
    func documentCameraViewControllerDidCancel(_ controller: VNDocumentCameraViewController) {
        controller.dismiss(animated: true)
    }
}

