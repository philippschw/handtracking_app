//
//  ViewController.swift
//  Example
//
//  Created by Philipp Schwarz on 2021/08/27.
//  Copyright © 2021 Philipp Schwarz . All rights reserved.
//

import UIKit
import AVFoundation


class ViewController: UIViewController, AVCaptureVideoDataOutputSampleBufferDelegate {


    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var toggleView: UISwitch!
    var previewLayer: AVCaptureVideoPreviewLayer!
    @IBOutlet weak var xyLabel:UILabel!
    @IBOutlet weak var featurePoint: UIView!
    let camera = Camera()
    lazy var handTracker: HandTracker = HandTracker()

    override func viewDidLoad() {
        super.viewDidLoad()
        camera.setSampleBufferDelegate(self)
        camera.start()

      handTracker.startGraph()
      handTracker.delegate = self
    }
    
    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        let pixelBuffer = CMSampleBufferGetImageBuffer(sampleBuffer)
        handTracker.processVideoFrame(pixelBuffer)

        DispatchQueue.main.async {
            if !self.toggleView.isOn {
                self.imageView.image = UIImage(ciImage: CIImage(cvPixelBuffer: pixelBuffer!))
            }
        }
    }

}

extension ViewController : TrackerDelegate
{

  func handTracker(_ handTracker: HandTracker!, didOutputLandmarks landmarks: [Landmark]!)  {
    print (landmarks)
    
    
  }
    func handTracker(_ handTracker: HandTracker!, didOutputPixelBuffer pixelBuffer: CVPixelBuffer!) {
        DispatchQueue.main.async {
            if self.toggleView.isOn {
                self.imageView.image = UIImage(ciImage: CIImage(cvPixelBuffer: pixelBuffer))
            }
        }
  }
}

//extension Collection {
//    /// Returns the element at the specified index if it is within bounds, otherwise nil.
//    subscript (safe index: Index) -> Element? {
//        return indices.contains(index) ? self[index] : nil
//    }
//}
//
//extension CGFloat {
//    func ceiling(toDecimal decimal: Int) -> CGFloat {
//        let numberOfDigits = CGFloat(abs(pow(10.0, Double(decimal))))
//        if self.sign == .minus {
//            return CGFloat(Int(self * numberOfDigits)) / numberOfDigits
//        } else {
//            return CGFloat(ceil(self * numberOfDigits)) / numberOfDigits
//        }
//    }
//}
//
//extension Double {
//    func ceiling(toDecimal decimal: Int) -> Double {
//        let numberOfDigits = abs(pow(10.0, Double(decimal)))
//        if self.sign == .minus {
//            return Double(Int(self * numberOfDigits)) / numberOfDigits
//        } else {
//            return Double(ceil(self * numberOfDigits)) / numberOfDigits
//        }
//    }
//}
