package riseup

class Order {
    User user
    String paymentType

    static hasMany = [attendees: Attendee]

    static constraints = {
        paymentType inList: ["PayPal", "Check"]
    }
}
