              <div class="attendeeForm">
                <table border="1">
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
              </div>
