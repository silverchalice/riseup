package riseup



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = false)
class RoomController {

    def roomService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Room.list(params), model:[roomInstanceCount: Room.count()]
    }

    def show(Room roomInstance) {
        respond roomInstance
    }

    def create() {
        respond new Room(params)
    }

    @Transactional
    def save(Room roomInstance) {
        if (roomInstance == null) {
            notFound()
            return
        }

        if (roomInstance.hasErrors()) {
            respond roomInstance.errors, view:'create'
            return
        }

        roomInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'room.label', default: 'Room'), roomInstance.id])
                redirect roomInstance
            }
            '*' { respond roomInstance, [status: CREATED] }
        }
    }

    def edit(Room roomInstance) {
        respond roomInstance
    }

    @Transactional
    def update(Room roomInstance) {
        if (roomInstance == null) {
            notFound()
            return
        }

        if (roomInstance.hasErrors()) {
            respond roomInstance.errors, view:'edit'
            return
        }

        roomInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Room.label', default: 'Room'), roomInstance.id])
                redirect roomInstance
            }
            '*'{ respond roomInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Room roomInstance) {

        if (roomInstance == null) {
            notFound()
            return
        }

        roomInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Room.label', default: 'Room'), roomInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'room.label', default: 'Room'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }

    def roomAssignment(){
        def confOrder = session.confOrder ? ConfOrder.get(session.confOrder.id) : ConfOrder.get(params.id)
        def buyer = confOrder.buyer
        def attendees = confOrder.attendees
        def roomsInUse = roomService.roomsUsedBy(attendees)
        return [confOrder: confOrder, buyer:buyer, attendees: attendees, roomsInUse: roomsInUse]
    }

    def loadRooms(){
        println "loadRooms called with id of ${params.id}"
        def attendee = Attendee.get(params.id)
        def ticketType = attendee?.ticketType
        println "ticketType for attendee: ${attendee.id} is ${ticketType.id}"
        def roomSize = ticketType?.roomSize
        println "roomSize is $roomSize"
        def rooms = roomService.availableRooms(roomSize)
        render(template:'roomList', collection:rooms)
    }
}






