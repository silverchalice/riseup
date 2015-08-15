              <div class="attendeeForm">
              <table border="1" class="attendeeForm table table-striped table-hover">
                  <thead>
                    <th>Name</th>
                    <th>Ticket type</th>
                    <th>Price</th>
                  </thead>
                  <tbody>

                  <g:if test="${attendees?.size() < 1}">
                      <tr>
                          <td colspan="3">Please add any additional persons who will be attending the conference under this registration</td>
                      </tr>

                  </g:if>
                  <g:else>
                      <g:each in="${attendees}" var="attendee">
                          <tr>
                              <td>${attendee?.firstName} ${attendee?.lastName}</td>
                              <td>${attendee?.ticketType}</td>
                              <td><g:formatNumber number="${attendee?.ticketType?.price}" format="\$###,##0.00" /></td>
                          </tr>
                      </g:each>
                  </g:else>

                  </tbody>
                </table>
                <g:if test="${amount}">
                  <br />
                  <p id="r_amt"><strong>Total:</strong> ${amount}</p>
                </g:if>
              </div>
              <input id="addAttendee" type="submit" value="Add attendee" class="btn btn-primary"/>

