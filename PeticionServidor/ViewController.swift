//
//  ViewController.swift
//  PeticionServidor
//
//  Created by Luis Alejandro Villa Vargas on 23/04/16.
//  Copyright © 2016 Luis Alejandro Villa Vargas. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate  {

    
    @IBOutlet weak var ISBN: UITextField!
    @IBOutlet weak var textView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ISBN.delegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


   
    @IBAction func textFieldDoneEditing(sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    
    
    @IBAction func backgroundTap(sender: UIControl) {
          ISBN.resignFirstResponder()
    }
  
    
    
    @IBAction func textFieldDidEndEditing(textField: UITextField) {
        print("Inicia peticion al servidor...")
        sincrono()
        print(ISBN.text)
    }
    
    func sincrono(){
        
        if let isbn = ISBN.text {
        let baseURL = NSURL(string: "https://openlibrary.org/api/books?jscmd=data&format=json&bibkeys=ISBN:\(isbn)")
        
            
        let datos:NSData? = NSData(contentsOfURL: baseURL!)
        let texto = NSString(data:datos!, encoding: NSUTF8StringEncoding)
        print(texto)
        self.textView!.text = String(texto)
        }else{
            print("Error")
        }

    }
    
}

