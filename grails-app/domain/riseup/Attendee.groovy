package riseup

class Attendee {
    String firstName
    String lastName
    Integer age
    String gender
    String church
    String email
    String phone
    TicketType ticketType
    Seminar seminar1
    Seminar seminar2
    Seminar seminar3
    Seminar seminar4
    Seminar seminar5
    Seminar seminar6

    static constraints = {
        gender inList: ["Male", "Female"]
        email nullable: true, blank: true
        phone nullable: true, blank: true
    }
}
