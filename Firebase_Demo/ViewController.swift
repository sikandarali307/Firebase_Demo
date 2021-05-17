//
//  ViewController.swift
//  Firebase_Demo
//
//  Created by Sikandar Ali on 17/05/2021.
//

import UIKit
import FirebaseAuth
import Firebase
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func signout(_ sender: Any) {
        try! Auth.auth().signOut()
            let st  = UIStoryboard(name: "Main", bundle: nil)
            let vc = st.instantiateViewController(identifier: "login")
            vc.modalPresentationStyle = .overFullScreen
            present(vc, animated: true)
        
    }
    

}

