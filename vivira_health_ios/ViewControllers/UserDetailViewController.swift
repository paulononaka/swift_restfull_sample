import UIKit
import KFSwiftImageLoader

class UserDetailViewController: UIViewController {
    
    @IBOutlet weak var photo: UIImageView?
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var desc: UITextView!
    @IBOutlet var buttonEdit: UIBarButtonItem!
    var user: User!
    var indicatoOfActivity:UIActivityIndicatorView?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = user.name
        addButtonSideRight(buttonEdit)
        self.name.text = user.name
        self.email.text = user.email
        self.desc.text = user.description
        
        if photo != "" {
            self.showActivityIndicator()
            self.photo!.loadImageFromURLString(user.photo_url, placeholderImage: UIImage(named: "User")) {
                (finished, error) in
                self.hideActivityIndicator()
                if (!finished) {
                    NSLog("\(error)")
                }
            }
        }else{
            self.photo?.image = UIImage(named: "User")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func addButtonSideRight(button: UIBarButtonItem) {
        var array = [UIBarButtonItem]()
        array.append(button)
        self.navigationItem.rightBarButtonItems = array
    }
    
    @IBAction func touchButtonEdit(sender: AnyObject) {
        
    }
    
    //MARK: - Activity Indicator
    func showActivityIndicator(){
        if self.indicatoOfActivity == nil{
            self.indicatoOfActivity = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.Gray)
            self.photo?.addSubview(self.indicatoOfActivity!)
            self.indicatoOfActivity!.center = self.photo!.center
            self.indicatoOfActivity?.startAnimating()
        }
    }
    
    func hideActivityIndicator(){
        self.indicatoOfActivity?.stopAnimating()
        self.indicatoOfActivity?.removeFromSuperview()
        self.indicatoOfActivity = nil
    }
}
