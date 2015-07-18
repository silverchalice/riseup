import riseup.TicketType
import riseup.Attendee
import riseup.Buyer
import riseup.ConfOrder


class BootStrap {

    def init = { servletContext ->
        if(TicketType.count() == 0){
            println "loading data...."
            def t1 = new TicketType(description: 'Room by yourself', 
            	                    price: 399.00, roomSize: 1).save(failOnError: true)
            def t2 = new TicketType(description: 'Room with 1 other', 
            	                    price: 299.00, roomSize: 2).save(failOnError: true)
            def t3 = new TicketType(description: 'Room with 2 others',
            	                    price: 269.00, roomSize: 3).save(failOnError:true)
            def t4 = new TicketType(description: 'Room with 3 others',
            	                    price: 249.00, roomSize: 4).save(failOnError:true)
            def t5 = new TicketType(description: 'Family rate (adult)',
            	                    price: 299.00, roomSize: 5).save(failOnError:true)
            def t6 = new TicketType(description: 'Family rate (child 6-12)',
            	                    price: 99.00, roomSize: 5).save(failOnError:true)
            def t7 = new TicketType(description: 'Family rate (child 0-5)',
            	                    price: 0.00, roomSize: 5).save(failOnError:true)
            def t8 = new TicketType(description: 'Commuter rate',
            	                    price: 199.00).save(failOnError:true)
            def buyer1 = new Buyer(firstName: 'John', lastName: 'Doe', 
            	                   email: 'jdoe@mail.com', password:'5551212', 
            	                   address1: '123 Main Street', city: 'AnyTown', state: 'MO', 
            	                   zip: '63136', phone:'555-1212').save(failOnError:true)
            def confOrder1 = new ConfOrder(buyer:buyer1, paymentType: "Check").save(failOnError:true, flush:true)
            def a1 = new Attendee(
                firstName: 'John',
                lastName: 'Doe',
                age: 45,
                gender: "Male",
                church: "Grace Bible Chapel",
                city: 'Anytown',
                state: 'CA',
                ticketType: t5
            )
            def a2 = new Attendee(
                firstName: 'Jill',
                lastName: 'Doe',
                age: 42,
                gender: "Female",
                church: "Grace Bible Chapel",
                city: 'Anytown',
                state: 'CA',
                ticketType: t5
            )
            def a3 = new Attendee(
                firstName: 'Jim',
                lastName: 'Doe',
                age: 12,
                gender: "Male",
                church: "Grace Bible Chapel",
                city: 'Anytown',
                state: 'CA',
                ticketType: t6
            )
            def a4 = new Attendee(
                firstName: 'Jane',
                lastName: 'Doe',
                age: 8,
                gender: "Female",
                church: "Grace Bible Chapel",
                city: 'Anytown',
                state: 'CA',
                ticketType: t6
            )
            def a5 = new Attendee(
                firstName: 'Joey',
                lastName: 'Doe',
                age: 4,
                gender: "Male",
                church: "Grace Bible Chapel",
                city: 'Anytown',
                state: 'CA',
                ticketType: t7
            )
            confOrder1.addToAttendees(a1)
            confOrder1.addToAttendees(a2)
            confOrder1.addToAttendees(a3)
            confOrder1.addToAttendees(a4)
            confOrder1.addToAttendees(a5).save(failOnError:true)
             
        }

    }
    def destroy = {
    }
}
