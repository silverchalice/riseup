package riseup

import grails.transaction.Transactional

@Transactional
class RoomService {

    def createNewRoom(Integer size, String type, List occupants, Buyer owner) {
    	def room = new Room(size:size, roomType: type, owner:owner).save(failOnError: true)
    	log.info "Created $room"
    	occupants.each{attendee ->
    		if (room.occupants?.size() < room.size){
    			log.info "Adding ${attendee} to ${room}"
    			room.addToOccupants(attendee)
    			attendee.assignedRoom = room
    			attendee.save(failOnError:true)
    		}
    		if (room.occupants.size() == room.size){
    			room.full = true
    		}
    	}
    	room.save(failOnError:true, flush:true)
    	log.info "Saved room with ${occupants.size()} out of ${room.size} occupants."
    }

    List availableRooms(Integer roomSize, Integer minVacancies = 1){
    	def rooms = Room.findAllBySizeAndFull(roomSize, false)
    	def result = []
    	rooms.each{room ->
    		if (room.vacancies() >= minVacancies){
    			result << room
    		}
    	}
    	return result
    }

    def assignToRoom(Attendee attendee, Room room){
    	if (room.occupants.size() < room.size){
    		room.addToOccupants(attendee)
    		attendee.assignedRoom = room
    		attendee.save(failOnError:true)
    		if (room.occupants.size() == room.size){
    			room.full = true
    		}
    		room.save(failOnError:true, flush:true)
    	}
    }

    List roomsUsedBy(List attendees){
    	def result = []
    	def roomIds = attendees.collect{it.assignedRoom?.id}.unique() - null
    	if (roomIds){
    	    roomIds.each{id ->
    			result << Room.get(id)
    		}
    	}
    	return result
    }
}
