              <div class="attendeeForm">
              <h3>Attendee info &nbsp;&nbsp;<input id="addAttendee" type="submit" value="Add attendee" /></h3>
                <table class="attendeeForm" border="1">
                  <thead>
                    <th>Name</th>
                    <th>Ticket type</th>
                  </thead>
                  <tbody>
                    <g:each in="${attendees}" var="attendee">
                      <tr>
                        <td>${attendee?.firstName} ${attendee?.lastName}</td>
                        <td>${attendee?.ticketType}</td>
                      </tr>
                    </g:each>
                  </tbody>
                </table>
                <g:if test="${amount}">
                  <br />
                  <p id="r_amt"><strong>Total:</strong> ${amount}</p>
                </g:if>
              </div>
              <p id="r_end"><script src="/js/paypal-button.min.js?merchant=WJG3QCJ58UU98" data-button="buynow" data-name="Believers Bible Conf (${number} ${number > 1 ? 'tickets' : 'ticket'})" data-amount="${amount}" async></script></p>
