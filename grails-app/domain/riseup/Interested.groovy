package riseup

class Interested {
    String name
    String email

    static constraints = {
        name nullable: true, blank: true
        email nullable: false, blank: false, email: true, unique: true
    }
}
