package riseup

class ConfOrder {
    Buyer buyer
    String paymentType = "PayPal"
    Boolean paid = false
    Boolean checkReceived = false
    
    static hasMany = [attendees: Attendee]

    static constraints = {
        paymentType inList: ["PayPal", "Check"], nullable: true
        checkReceived nullable: true
    }

    Double calcTotalPrice(){
        println "calcTotalPrice called and attendees.size is ${attendees?.size()}"
    	def amt = 0
    	attendees.each{
    		amt += it.ticketType?.price
    	}
        println "amount is $amt"
    	return amt
    }

    def getAllRoomNotes(){
        def result = ''
        attendees.each{
            result +=  it.roomNotes + '\n'
        }
    }
}
