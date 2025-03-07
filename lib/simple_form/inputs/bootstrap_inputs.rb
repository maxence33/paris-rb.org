inputs = %w[ BooleanInput
             CollectionCheckBoxesInput
             CollectionRadioButtonsInput ]

inputs.each do |input_type|
  superclass = "SimpleForm::Inputs::#{input_type}".constantize

  new_class = Class.new(superclass) do
    def input_html_classes
      super - [ "form-control" ]
    end
  end

  Object.const_set(input_type, new_class)
end
