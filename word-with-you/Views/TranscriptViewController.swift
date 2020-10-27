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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        convertToRich()
    }
    
    // Test rich txt format to textview
    func convertToRich() {
        do {
            let attrStr = try NSAttributedString(
                data: "<h1 style='text-align:center'>Test Title</h1><br><br><p></b>YOOOO</b>, this is some straight up <i>RICH TEXT</i></p><br><p>Check it out...</p>".data(using: String.Encoding.unicode, allowLossyConversion: true)!,
                options: [.documentType : NSAttributedString.DocumentType.html],
                documentAttributes: nil)
            textView.attributedText = attrStr
        } catch let err {
            print(err)
        }
    }
    
    

    
    
}
