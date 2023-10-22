//
//  DetailViewController.swift
//  ios101-project6-tumblr
//
//  Created by Lucy Lu on 10/22/23.
//

import UIKit
import Nuke

var post: Post!
class DetailViewController: UIViewController {

    @IBOutlet weak var photoView: UIImageView!
    
    @IBOutlet weak var textView: UITextView!
    
    var post: Post!
    
    override func viewDidLoad() {
           super.viewDidLoad()
           navigationItem.largeTitleDisplayMode = .never

           // Ensure that the post is not nil
           guard let post = post else {
               return
           }

           // Load the image from the post's URL using Nuke
           if let photoURL = post.photos.first?.originalSize.url {
               Nuke.loadImage(with: photoURL, into: photoView)
           }

           // Set the text view's text after trimming HTML tags
           textView.text = post.caption.trimHTMLTags() ?? ""
       }
   }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


