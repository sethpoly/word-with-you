//
//  TranscriptViewController.swift
//  word-with-you
//
//  Created by Seth Polyniak on 10/27/20.
//  Copyright © 2020 Seth Polyniak. All rights reserved.
//

import UIKit

class TranscriptViewController: UIViewController {
    
    @IBOutlet weak var textView: UITextView!
    
    let transparencyColor = UIColor(white: 1, alpha: 0.7)
    
    // Close transcript modal & return to devotion view
    @IBAction func closeTranscript(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        convertToRich()
        
        
        view.backgroundColor = transparencyColor
        textView.backgroundColor = UIColor(white: 1, alpha: 0.1)
    }
    
    // Test rich txt format to textview
    func convertToRich() {
        do {
            let attrStr = try NSAttributedString(
                data: "<style type='text/css'>p{font-size: 18px;}</style><body><h1 style='text-align:center'>Test Title</h1><br><br><p><b>YOOOO</b>, this is some straight up <i>RICH TEXT</i></p><p>Check it out...</p></body>".data(using: String.Encoding.unicode, allowLossyConversion: true)!,
                options: [.documentType : NSAttributedString.DocumentType.html],
                documentAttributes: nil)
            textView.attributedText = attrStr
        } catch let err {
            print(err)
        }
    }
    
    

    
    
}
