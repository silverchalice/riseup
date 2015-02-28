package riseup

class Speaker {
    String firstName
    String lastName
    String bio

    static constraints = {
        bio maxSize: 100000
    }
}
