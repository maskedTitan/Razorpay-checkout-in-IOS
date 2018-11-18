//
//  ViewController.swift
//  Razorpay Checkout
//
//  Created by Harsha Marri on 10/10/18.
//  Copyright © 2018 Harsha M. All rights reserved.
//

import UIKit
import Razorpay


class ViewController: UIViewController , RazorpayPaymentCompletionProtocol {
    
    var razorpay : Razorpay!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        razorpay = Razorpay.initWithKey("rzp_test_IFMmoKlMshyTeL", andDelegate: self)
        
      //  showPaymentForm()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    internal func showPaymentForm() {

        let options : [String : Any] = [
            "amount" : 1000,
            "currency" : "INR",
            "description" : "Spiderman Funko",
            "image" : "https://images-na.ssl-images-amazon.com/images/I/511KrMXsnqL.jpg",
          
            
            
            "prefill" : [

            "contact" : "7019284852",
            "email" : "harsha.marri@razorpay.com" ,
           "method" : "emandate"

            ] ,

            "theme": [
                "color": "#F37254",
                "close_button" : false,
                "hide_topbar" : false
            ] 



        ]

  razorpay.open(options)
        
        
    }
    
    public func onPaymentError(_ code: Int32, description str: String){
        let alertController = UIAlertController(title: "FAILURE", message: str, preferredStyle: UIAlertController.Style.alert)
        let cancelAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: nil)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    public func onPaymentSuccess(_ payment_id: String){
        let alertController = UIAlertController(title: "SUCCESS", message: "Payment Id is \(payment_id)", preferredStyle: UIAlertController.Style.alert)
        let cancelAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: nil)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
    }

    
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        
       showPaymentForm()
       
        
    }
    

}

