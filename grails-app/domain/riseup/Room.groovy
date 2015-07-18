package riseup

class Room {
    Buyer owner
    Integer roomSize
    List occupants
    String roomType
    Boolean filled = false

    static hasMany = [occupants: Attendee]

    static constraints = {
        owner nullable: false
        roomSize nullable: false
        occupants nullable: true
        roomType nullable: false, inList: [SINGLE, DOUBLE, FAMILY]
    }

    static String SINGLE = "One King Bed"
    static String DOUBLE = "Two Queen Beds"
    static String FAMILY = "Two Queen Beds - Family"

    String toString(){
    	"Room ${id}, size: $size"
    }

    Integer vacancies(){
    	roomSize - occupants.size()
    }
}
