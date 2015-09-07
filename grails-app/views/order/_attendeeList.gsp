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
              ${amount}
          </div>

      <g:if test="${!confOrder.paid}">
        <div class="well" style="height:90px;">
            <div style="width:200px;float:left;">
            <form action="https://www.paypal.com/cgi-bin/webscr" method="post" target="_top">
                <input type="hidden" name="cmd" value="_xclick" />
                <input type="hidden" name="business" value="info@assemblycare.org">
                <input type="hidden" name="currency_code" value="USD">
                <input type="hidden" name="item_name" value="Believers Conference Registration">
                <input type="hidden" name="amount" value="${amount}" />
                <input type="image" src="https://www.paypalobjects.com/en_US/i/btn/btn_paynowCC_LG.gif" border="0" name="submit" alt="PayPal - The safer, easier way to pay online!">
                <img alt="" border="0" src="https://www.paypalobjects.com/en_US/i/scr/pixel.gif" width="1" height="1">
            </form>
            </div>
            <div style="width:200px; float:left; margin-top:20px;">
            <g:link action="thanks" id="${buyer?.id}" 
                     params="[paymentType:'check', orderId: confOrder.id]">
                <button type="button">Pay By Check</button>
            </g:link>
            </div>
        </div>
      </g:if>
      <g:else>
        <div class="well" style="height:70px;">
          <g:link controller='order' action="seminars" params="${[id: buyer?.id]}">
            Select or Change Seminars
          </g:link>
        </div>
      </g:else>


