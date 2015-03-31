package riseup

class TicketType {
    String description
    Integer price
    String comments

    static constraints = {
        comments nullable: true
    }

    String toString() {
        description
    }
}
