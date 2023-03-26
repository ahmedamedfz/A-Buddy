
import SwiftUI

struct PersonalView : View{
    let tappedBuddy : Buddy
    var body: some View{
            if tappedBuddy.itsMe
            {
                MyQRGenerator(buddy:tappedBuddy)
            }
            else if tappedBuddy.isScanned
            {
                EntityDetail(buddy: tappedBuddy)
            }
            else
            {
                MyQRScanner(buddy: tappedBuddy)
            }
    }
}
