package riseup

class Seminar {
    String title
    String description
    Speaker speaker
    Integer slot1
    Integer slot2
    String room1
    String room2

    static constraints = {
        description maxSize: 5000
    }
}
