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
        zip nullable: true
        phone nullable:true
        address1 nullable:true
        address2 nullable: true
        city nullable:true
        state nullable:true
    }

    String toString(){
        "$firstName $lastName"
    }
}
