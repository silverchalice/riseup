
<div style="border: 1px solid black;"
<h3>Seminar Selection for ${attendee.firstName} ${attendee.lastName}</h3>
<g:form name="seminar-selection-form" action="saveSeminarSelections">
    <input type="hidden" name="attendeeId" value="${attendee.id}" />
    <input type="hidden" name="orderId" value="${confOrder.id}" />
   	<table>
   		<tr>
   		<td>Seminar 1 (Wednesday 11:00 - 12:00)</td>
   		<td>
   		  <g:select from="${seminar1List}" name="seminar1" 
   			value="${attendee.seminar1}" noSelection="['':'Please make a selection']" />
   		 </td>
   		 </tr>
   		<tr>
   		<td>Seminar 2 (Wednesday 3:30 - 4:30)</td>
   		<td>
   		  <g:select from="${seminar2List}" name="seminar2" 
   			 value="${attendee.seminar2}" noSelection="['':'Please make a selection']" />
   		</td>
   		</tr>
   		<tr>
   		<td>Seminar 3 (Thursday 11:00 - 12:00)</td>
   		<td><g:select from="${seminar3List}" name="seminar3" 
   			value="${attendee.seminar3}" noSelection="['':'Please make a selection']" />
   		</td>
   		</tr>
   		<tr>
   		<td>Seminar 4 (Thursday 2:00 - 3:00)</td>
   		<td>
   		  <g:select from="${seminar4List}" name="seminar4" 
   			value="${attendee.seminar4}" noSelection="['':'Please make a selection']" />
   		</td>
   		</tr>
   	</table>
   	<input type="submit" value="Save Selections" />
</g:form>
