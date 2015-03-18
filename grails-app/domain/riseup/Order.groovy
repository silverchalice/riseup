package riseup

class Order {
    Buyer buyer
    String paymentType

    static hasMany = [attendees: Attendee]

    static constraints = {
        paymentType inList: ["PayPal", "Check"]
    }
}
