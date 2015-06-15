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
    Room assignedRoom

    static constraints = {
        firstName nullable: true
        lastName nullable: true
        age nullable: true
        gender inList: ["Male", "Female"], nullable: true
        email nullable: true, blank: true
        phone nullable: true, blank: true
        church nullable: true
        email email: true, nullable: true
        phone nullable: true
        ticketType nullable: true
        seminar1 nullable: true
        seminar2 nullable: true
        seminar3 nullable: true
        seminar4 nullable: true
        seminar5 nullable: true
        seminar6 nullable: true
        assignedRoom nullable: true
    }

    String toString(){
        "$firstName $lastName - $id"
    }
}
