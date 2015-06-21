package riseup

class Buyer {
    String firstName
    String lastName
    String email
    String password
    String address1
    String address2
    String city
    String state
    String zip
    String phone

    static constraints = {
        address2 nullable: true
    }

    String toString(){
        "$firstName $lastName"
    }
}
