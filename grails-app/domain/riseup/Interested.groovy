package riseup

class Interested {
    String name
    String email

    static constraints = {
        name nullable: false, blank: false
        email nullable: false, blank: false, email: true, unique: true
    }
}
