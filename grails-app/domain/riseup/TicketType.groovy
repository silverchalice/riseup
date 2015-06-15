package riseup

class TicketType {
    String description
    Integer price
    String comments
    Integer roomSize = 0

    static constraints = {
        comments nullable: true
    }

    String toString() {
        description
    }
}
