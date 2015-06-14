package riseup

class ConfOrder {
    Buyer buyer
    String paymentType

    static hasMany = [attendees: Attendee]

    static constraints = {
        paymentType inList: ["PayPal", "Check"], nullable: true
    }
}
