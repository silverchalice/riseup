<div class="modal fade" id="seminar-selection-modal">
<div class="modal-dialog">

    <g:form name="seminar-selection-form" action="saveSeminarSelections">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">Seminar Selection for ${attendee.firstName} ${attendee.lastName}</h4>
            </div>

            <div class="modal-body">

                <input type="hidden" name="attendeeId" value="${attendee.id}"/>
                <input type="hidden" name="orderId" value="${confOrder.id}"/>

                <div class="form-group">
                    <label>Seminar 1 (Wednesday 11:00 - 12:00)</label>
                    <g:select from="${seminar1List}" name="seminar1" value="${attendee.seminar1}"
                              noSelection="['': 'Please make a selection']" class="form-control"/>
                </div>

                <div class="form-group">
                    <label>Seminar 2 (Wednesday 3:30 - 4:30)</label>
                    <g:select from="${seminar2List}" name="seminar2" value="${attendee.seminar2}"
                              noSelection="['': 'Please make a selection']" class="form-control"/>
                </div>

                <div class="form-group">
                    <label>Seminar 3 (Thursday 11:00 - 12:00)</label>
                    <g:select from="${seminar3List}" name="seminar3"
                              value="${attendee.seminar3}" noSelection="['': 'Please make a selection']"
                              class="form-control"/>
                </div>

                <div class="form-group">
                    <label>Seminar 4 (Thursday 2:00 - 3:00)</label>
                    <g:select from="${seminar4List}" name="seminar4"
                              value="${attendee.seminar4}" noSelection="['': 'Please make a selection']"
                              class="form-control"/>
                </div>

            </div>


            <div class="modal-footer">
                <button type="button" class="btn btn-warning" data-dismiss="modal">Close</button>
                <input type="submit" value="Save Selections" class="btn btn-success"/>
            </div>
        </div><!-- /.modal-content -->
    </g:form>
</div><!-- /.modal-dialog -->
</div><!-- /.modal -->
