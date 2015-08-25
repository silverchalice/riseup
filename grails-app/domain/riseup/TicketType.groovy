package riseup

class TicketType {
    String description
    Double price
    String comments
    Integer roomSize = 0

    static constraints = {
        comments nullable: true
    }

    String toString() {
        description
    }
}
