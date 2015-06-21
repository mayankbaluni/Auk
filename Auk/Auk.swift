import UIKit

final class Auk: AukInterface {
  private weak var scrollView: UIScrollView?
  var settings = AukSettings()

  init(scrollView: UIScrollView) {
    self.scrollView = scrollView
  }
  
  func setup() {
    scrollView?.showsHorizontalScrollIndicator = settings.showsHorizontalScrollIndicator
    scrollView?.pagingEnabled = settings.pagingEnabled
  }
  
  func show(#image: UIImage) {
    setup()
    
    let page = AukPage()
    
    if let scrollView = scrollView {
      scrollView.addSubview(page)
      
      AukScrollViewContent.layout(scrollView)
      
      page.show(image: image, settings: settings)
    }
  }
  
  func show(#url: String) {
    
  }
  
  var pageIndex: Int {
    if let scrollView = scrollView {
      return Int(scrollView.contentOffset.x / scrollView.bounds.size.width)
    }
    
    return 0
  }
  
  func changePage(toPageIndex: Int, pageWidth: CGFloat) {
    scrollView?.contentOffset.x = CGFloat(toPageIndex) * pageWidth
  }
}