package riseup

class Room {
    Buyer owner
    Integer size
    List occupants
    String roomType
    Boolean full = false

    static hasMany = [occupants: Attendee]

    static constraints = {
        owner nullable: false
        size nullable: false
        occupants nullable: true
        roomType nullable: false, inList: [SINGLE, DOUBLE]
    }

    static String SINGLE = "One King Bed"
    static String DOUBLE = "Two Queen Beds"

    String toString(){
    	"Room ${id}, size: $size"
    }

    Integer vacancies(){
    	size - occupants.size()
    }
}
