
<h3>Seminar Selection for ${attendee.firstName} ${attendee.lastName}</h3>
<g:form name="seminar-selection-form" action="saveSeminarSelections">
    <input type="hidden" name="attendeeId" value="${attendee.id}" />
    <input type="hidden" name="orderId" value="${confOrder.id}"
   	<ul>
   		<li><label>Seminar 1 (Wednesday 11:00 - 12:00)</label>
   			<g:select from="${seminar1List}" name="seminar1" 
   			     value="${attendee.seminar1}" noSelection="['':'Please make a selection']" />
   		</li>
   		<li><label>Seminar 2 (Wednesday 3:30 - 4:30)</label></td>
   			<g:select from="${seminar2List}" name="seminar2" 
   			     value="${attendee.seminar2}" noSelection="['':'Please make a selection']" />
   		</li>
   		<li><label>Seminar 3 (Thursday 11:00 - 12:00)</label></td>
   			<g:select from="${seminar3List}" name="seminar3" 
   			     value="${attendee.seminar3}" noSelection="['':'Please make a selection']" />
   		</li>
   		<li><label>Seminar 4 (Thursday 2:00 - 3:00)</label></td>
   			<g:select from="${seminar4List}" name="seminar4" 
   			     value="${attendee.seminar4}" noSelection="['':'Please make a selection']" />
   		</li>
   	</ul>
   	<input type="submit" value="Save Selections" />
</g:form>
