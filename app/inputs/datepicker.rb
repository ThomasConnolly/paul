class DatepickerInput < SimpleForm::Inputs::Base
  def input
    template.content_tag(:div, class: 'input-group date form_date') do
      template.concat @sermon.date_field(:delivered_on, class: "datepicker")
  end
end
end
