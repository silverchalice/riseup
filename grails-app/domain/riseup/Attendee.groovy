package riseup

class Attendee {
    String firstName
    String lastName
    Integer age
    String gender
    String church
    String city
    String state
    String email
    String phone
    TicketType ticketType
    String seminar1
    String seminar2
    String seminar3
    String seminar4
    Room assignedRoom
    String roomNotes

    static belongsTo = [confOrder: ConfOrder]
    
    static constraints = {
        firstName nullable: true
        lastName nullable: true
        age nullable: true
        gender inList: ["Male", "Female"], nullable: true
        email nullable: true, blank: true
        phone nullable: true, blank: true
        church nullable: true
        city nullable: true
        state nullable: true
        email email: true, nullable: true
        phone nullable: true
        ticketType nullable: true
        seminar1 nullable: true
        seminar2 nullable: true
        seminar3 nullable: true
        seminar4 nullable: true
        assignedRoom nullable: true
        roomNotes nullable:true, maxSize:5000
    }

    String toString(){
        "$firstName $lastName - $id"
    }
}
