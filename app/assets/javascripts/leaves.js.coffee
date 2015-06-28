# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
Leave =
  #  validate leave date
  constructor:  ->
    @objValidation = {}

  validateDate: ->
    startDate =  new Date($("#leave_start_date_3i").val() + $("#leave_start_date_2i").val() + $("#leave_start_date_1i").val())
    endDate = new Date($("#leave_end_date_3i").val() + $("#leave_end_date_2i").val() + $("#leave_end_date_1i").val())
    days = this.totalDays startDate, endDate
    log(startDate, endDate)
    if days < 0
      @objValidation['date'] = {
        error: true
        msg: 'Invalid start date and end date!.'
      }
    else
      @objValidation['date'] = {
        error: false
        total_days: days
      }


  totalDays: (startDate, EndDate) ->
    DAY = 1000 * 60 * 60  * 24
    Math.round((endDate.getTime() - startDate.getTime()) / DAY)

  validateType: ->
    if $("#leave_leave_type").val().length > 0
      @objValidation["type"] =
      {
        error: false
      }
    else
      @objValidation["type"] =
      {
        error: true,
        msg: "Leave type not selected!."
      }
  validateMessage: ->
    if $("#leave_content").val().length > 0
      @objValidation["msg"] =
      {
        error: false
      }
    else
      @objValidation["msg"] =
      {
        error: true,
        msg: "Leave Message is Empty!."
      }

  validateLeave: ->
    this.validateDate()
    this.validateType()
    this.validateMessage()
    @objValidation

