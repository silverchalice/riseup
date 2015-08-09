package riseup

class ConfOrder {
    Buyer buyer
    String paymentType

    static hasMany = [attendees: Attendee]

    static constraints = {
        paymentType inList: ["PayPal", "Check"], nullable: true
    }

    Long calcTotalPrice(){
    	def amt = 0
    	attendees.each{
    		amt += it.ticketType?.price
    	}
    	return amt
    }

    def getAllRoomNotes(){
        def result = ''
        attendees.each{
            result +=  it.roomNotes + '\n'
        }
    }
}
