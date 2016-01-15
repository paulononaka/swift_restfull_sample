
import UIKit

class CellPhotoTableViewCell: UITableViewCell {
    
    @IBOutlet var photo: UIImageView!
    var indicatoOfActivity:UIActivityIndicatorView?
    var urlPhoto = ""
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func receiveUrl(url: String) {
        urlPhoto = url
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if photo != "" {
            self.showActivityIndicator()
            self.photo!.loadImageFromURLString(urlPhoto, placeholderImage: UIImage(named: "User")) {
                (finished, error) in
                self.hideActivityIndicator()
                if (!finished) {
                    NSLog("\(error)")
                }
            }
        } else {
            self.photo.image = UIImage(named: "User")
        }
    }
    
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
