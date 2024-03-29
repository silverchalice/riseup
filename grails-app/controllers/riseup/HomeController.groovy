package riseup

class HomeController {

    def index() { }

    def login() { }

    def log_user_in() {
      def email = params.email?.toLowerCase()
      println "Logging in: email is $email"
      def user = Buyer.findByEmail(email)
      if(!user || params.password != user?.password) {
        flash.message = "Oops! Incorrect email address or password. Please try again."
        redirect action: "login"
        return
      } else {
        println "Logging in: user id is: ${user.id}"
        session.buyer = user
        session.confOrder = ConfOrder.findByBuyer(user)

        if(user.password == "20believersconf15") {
          flash.message = "Please enter a new password."
          redirect action: "change_password"
          return
        }

        flash.message = "Welcome back, $user. You are now logged in."
        println "logged in.  redirecting to attendees."
        redirect controller: "order", action: "attendees", params:[orderId:session.confOrder?.id]
      }
    }

    def logout() {
      session.buyer = null
      session.confOrder = null
      //flash.message = "You are now logged out."
      redirect action: "index"
    }

    def forgot_password() { }

    def reset_password() {
      def email = params.email?.toLowerCase()
      def buyer = Buyer.findByEmail(email)
      if(buyer) {
        buyer.password = "20believersconf15"; buyer.save()
      
        sendMail {     
          to email
          subject "Resetting your password for bibleconferences.org"
          body """
Hello ${buyer?.firstName}!

Your password has been reset to the following:

20believersconf15

You can log in with this password now: http://bibleconferences.org/login

You'll have to change this password once you're logged in.
  """
        }
      }

      flash.message = "We've sent you an email on how to change your password."
      redirect action: "forgot_password"
    }

    def change_password() {
      if(!session.buyer){
        flash.message = "You must be logged in to access that page."
        redirect action: "index"
      }
    }

    def save_new_password() {
      if(params.password != params.confirm_password){
        flash.message = "Oops! Passwords do not match. Please try again."
        redirect action: "forgot_password"
      } else {
        def user = session.buyer
        user.password = params.password; user.save()
        flash.message = "Your password has been changed."
        redirect action: "index"
      }
    }

    def thanks() {
        println "params in the thanks action are " + params
    }

    def payPals() {
        [amount: 1.75]
    }
}
