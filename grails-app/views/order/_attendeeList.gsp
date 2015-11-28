        <div class="well">
              <div class="attendeeForm">
              <table border="1" class="attendeeForm table table-striped table-hover">
                  <thead>
                    <th>Name</th>
                    <th>Ticket type</th>
                    <th>Price</th>
                    <th>Edit</th>
                    <th>Remove</th>
                  </thead>
                  <tbody>

                  <g:if test="${attendees?.size() < 1}">
                      <tr>
                          <td colspan="4">Please add each person who will be attending the conference under this registration.</td>
                      </tr>
                      <tr>
                          <td colspan="5">Adding attendees at a later time will require a new order with a new email address.</td>
                      </tr>

                  </g:if>
                  <g:else>
                      <g:each in="${attendees}" var="attendee">
                          <tr>
                              <td>${attendee?.firstName} ${attendee?.lastName}</td>
                              <td>${attendee?.ticketType}</td>
                              <td><g:formatNumber number="${attendee?.ticketType?.price}" format="\$###,##0.00" /></td>
                              <td><button>Change</button></td>
                              <g:if test="${!confOrder.paid}">
                                <td><g:link action="removeAttendee" id="${attendee.id}" params="${[orderId:confOrder?.id]}"><button>X</button></g:link></td>
                              </g:if>
                              <g:else>
                                <td>N/A</td>
                              </g:else>
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


        <g:if test="${confOrder?.attendees?.size() > 0}">
            <div class="well" style="height:90px;">
                <g:if test="${!confOrder.paid}">
                    <div style="width:200px;float:left;">
                    <form action="https://www.paypal.com/cgi-bin/webscr" method="post" target="_top">
                        <input type="hidden" name="cmd" value="_xclick" />
                        <input type="hidden" name="business" value="info@assemblycare.org">
                        <input type="hidden" name="currency_code" value="USD">
                        <input type="hidden" name="item_name" value="Believers Conference Registration">
                        <input type="hidden" name="amount" value="${amount}" />
                        <input type="hidden" name="return" value="http://bibleconferences.org:9090/thanks/${confOrder?.id}" />
                        <input type="image" src="https://www.paypalobjects.com/en_US/i/btn/btn_paynowCC_LG.gif" border="0" name="submit" alt="PayPal">
                        <img alt="" border="0" src="https://www.paypalobjects.com/en_US/i/scr/pixel.gif" width="1" height="1">
                    </form>
                    </div>
                    <div style="width:200px; float:left; margin-top:20px;">
                    <g:link action="thanks" id="${confOrder?.id}" onclick="return confirm('This will mark your registration as paid and awaiting check. You will not be able to add or remove attendees. Click OK to continue.');"
                             params="[paymentType:'check']">
                        <button type="button">Pay By Check</button>
                    </g:link>
                    </div>
                </g:if>
                <div style="width:200px; float:left; margin-top:20px;">
                    <g:link controller='order' action="seminars" params="${[id: confOrder?.id]}">
                        <button type="button">Select Seminars</button>
                    </g:link>
                </div>
            </div>
        </g:if>



