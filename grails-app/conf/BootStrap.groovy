import riseup.TicketType

class BootStrap {

    def init = { servletContext ->

        if(TicketType.count() == 0){
            def t1 = new TicketType(description: 'Single', price: 399.00).save(failOnError: true)
            def t2 = new TicketType(description: 'Double', price: 299.00).save(failOnError: true)
        }

    }
    def destroy = {
    }
}
