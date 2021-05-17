//
//  SignupViewController.swift
//  Firebase_Demo
//
//  Created by Sikandar Ali on 17/05/2021.
//

import UIKit
import FirebaseAuth
import Firebase
 
class SignupViewController: UIViewController {

    @IBOutlet weak var firstname: UITextField!
    @IBOutlet weak var lastname: UITextField!
    @IBOutlet weak var usernameo: UITextField!
    @IBOutlet weak var passswordsign: UITextField!
    @IBOutlet weak var alreadylogin: UIButton!
    @IBOutlet weak var signupoutlet: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func alreadyaction(_ sender: Any) {
        let st  = UIStoryboard(name: "Main", bundle: nil)
        let vc = st.instantiateViewController(identifier: "login")
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true)
    }
    @IBAction func signupaction(_ sender: Any) {
        if usernameo.text?.isEmpty ==  true && passswordsign.text?.isEmpty == true{
            print("No Data")
            return
        }
        signup()
        
        
    }
    
    func signup(){
        Auth.auth().createUser(withEmail: usernameo.text!, password: passswordsign.text!) { (authresult, error) in
            guard let user = authresult?.user,error == nil else{
                print(error?.localizedDescription)
                return
            }
            let st  = UIStoryboard(name: "Main", bundle: nil)
            let vc = st.instantiateViewController(identifier: "welcome")
            vc.modalPresentationStyle = .overFullScreen
            self.present(vc, animated: true)
        }
    }

}
