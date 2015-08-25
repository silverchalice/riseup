        <div class="well">
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
              <g:if test="${!confOrder.paid}">
                <input id="addAttendee" type="submit" value="Add attendee" class="btn btn-primary"/>
              </g:if>
          </div>

      <g:if test="${!confOrder.paid}">
        <div class="well" style="height:70px;">
            <div style="width:150px;float:left;">
            <script src="/js/paypal-button.min.js?merchant=WJG3QCJ58UU98"
                    data-name="Believers Bible Conf (${number} ${number > 1 ? 'tickets' : 'ticket'})"
                    data-callback="http://bibleconferences.org/thanks/${buyer?.id}"
                    data-cancel_return="http://bibleconferences.org" data-return="http://bibleconferences.org/thanks"
                    data-amount="${amount}" async></script>
            </div>
            <div style="width:200px; float:left;">
            <g:link action="thanks" id="${buyer?.id}" 
                     params="[paymentType:'check', oderId: confOrder.id]">
                <button type="button">Pay By Check</button>
            </g:link>
            </div>
        </div>
      </g:if>
      <g:else>
        <div class="well" style="height:70px;">
          <g:link controller='order' action="seminars" params="${[id: buyer?.id]}">
            Select of Change Seminars - ${confOrder.paid}
          </g:link>
        </div>
      </g:else>


