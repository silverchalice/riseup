              <div class="attendeeForm">
              <h3>Attendee info &nbsp;&nbsp;<input id="addAttendee" type="submit" value="Add attendee" /></h3>
                <table class="attendeeForm" border="1">
                  <thead>
                    <th>Name</th>
                    <th>Ticket type</th>
                    <th>Price</th>
                  </thead>
                  <tbody>
                    <g:each in="${attendees}" var="attendee">
                      <tr>
                        <td>${attendee?.firstName} ${attendee?.lastName}</td>
                        <td>${attendee?.ticketType}</td>
                        <td><g:formatNumber number="${attendee?.ticketType?.price}" format="\$###,##0.00" /></td>
                      </tr>
                    </g:each>
                  </tbody>
                </table>
                <g:if test="${amount}">
                  <br />
                  <p id="r_amt"><strong>Total:</strong> ${amount}</p>
                </g:if>
              </div>
              <p id="r_end"><script src="/js/paypal-button.min.js?merchant=WJG3QCJ58UU98" data-button="buynow" data-name="Believers Bible Conf (${number} ${number > 1 ? 'tickets' : 'ticket'})" data-callback="http://bibleconferences.org:9090/thanks/${buyer.id}" data-cancel_return="http://bibleconferences.org:9090" data-return="http://bibleconferences.org:9090/thanks" data-amount="${amount}" async></script></p>
              <div>
                <g:link controller='order' action="selectSeminars" params="${[id: confOrder?.id]}">
                    <button>Select Seminars</button>
                </g:link>
              </div>

              
