/**
* Copyright (c) 2015-present, Parse, LLC.
* All rights reserved.
*
* This source code is licensed under the BSD-style license found in the
* LICENSE file in the root directory of this source tree. An additional grant
* of patent rights can be found in the PATENTS file in the same directory.
*/

import UIKit
import Parse

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        /* Save user in Parse
            let users = PFObject(className: "Users")
            users["name"] = "Douglas"
            users.saveInBackground { (success, error) -> Void in
            
            
            if success {
                
                print("User name has been saved.")
                
            } else {
                
                if error != nil {
                    
                    print (error)
                    
                } else {
                    
                    print ("Error")
                }
                
            }
            
        }
        */
        
        //Query Parse to retrieve data
        
        let query = PFQuery(className: "Users")
        query.getObjectInBackground(withId: "XDvqeagvFA") { (object, error) in
            
            if error != nil {
                print("Error w/PFQuery", error)
                
            } else {
                if let user = object {
                    print("Queried user = ", user)
                    print("Queried user name =", user["name"])
                    
                    user["name"] = "Doug"
                    user.saveInBackground(block: { (success, error) in
                        if error != nil {
                            print("Error re-saving user", error!)
                        } else if success {
                            print("User name re-saved", user["name"])
                        }
                    })
                }
            }
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
