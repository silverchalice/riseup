package riseup

class Room {
    Attendee owner
    Integer size
    List occupants

    static hasMany = [occupants: Attendee]

    static constraints = {
        owner nullable: false
        size nullable: false
        occupants nullable: false
    }
}
