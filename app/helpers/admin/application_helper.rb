module Admin::ApplicationHelper

  def button_classes(additional = '', **options)
    classes = "btn btn-primary btn-xs #{additional}"
    classes += ' disabled' if options[:disabled]
    classes
  end

  def button_classes_danger(**options)
    classes = 'btn btn-danger btn-xs'
    classes += ' disabled' if options[:disabled]
    classes
  end

  def submit(form)
    form.button :submit,
                'Enregistrer',
                class: button_classes,
                form: form.options.dig(:html, :id)
  end

end