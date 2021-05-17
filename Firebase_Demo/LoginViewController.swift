//
//  LoginViewController.swift
//  Firebase_Demo
//
//  Created by Sikandar Ali on 17/05/2021.
//

import UIKit
import FirebaseAuth
import Firebase
class LoginViewController: UIViewController {

    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var loginout: UIButton!
    @IBOutlet weak var createnew: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginaction(_ sender: Any) {
        validation()
        
    }
    
    @IBAction func createaccount(_ sender: Any) {
        let st  = UIStoryboard(name: "Main", bundle: nil)
        let vc = st.instantiateViewController(identifier: "signup")
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true)
    }
    func validation(){
        if username.text?.isEmpty == true && password.text?.isEmpty == true{
            print("must provide data")
        }
        login()
    }
    func login(){
        Auth.auth().signIn(withEmail: username.text!, password: password.text!) { [weak self] (authresult, error) in
            guard let strongself = self else{ return}
            if let err = error{
                print(err.localizedDescription)
            }
            self!.checkuserinfo()
        }
    }
    func checkuserinfo(){
       if Auth.auth().currentUser != nil  {
            print(Auth.auth().currentUser?.uid)
            let st  = UIStoryboard(name: "Main", bundle: nil)
            let vc = st.instantiateViewController(identifier: "welcome")
            vc.modalPresentationStyle = .overFullScreen
            present(vc, animated: true)
        }
    }
}
