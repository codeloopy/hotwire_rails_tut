class Quote < ApplicationRecord
  validates :name, presence: true
  # after_create_commit -> { broadcast_prepend_to "quotes", partial: "quotes/quote", locals: { quote: self }, target: "quotes" }

  # By default, the target option will be equal to model_name.plural, which is equal to "quotes"
  # after_create_commit -> { broadcast_prepend_to "quotes", partial: "quotes/quote", locals: { quote: self } }

  # The partial default value is equal to calling to_partial_path on an instance of the model, which by default in Rails for our Quote model is equal to "quotes/quote".
  # The locals default value is equal to { model_name.element.to_sym => self } which, in in the context of our Quote model, is equal to { quote: self }.
  # after_create_commit -> { broadcast_prepend_to "quotes", partial: "quotes/quote", locals: { quote: self } }

  # after_create_commit -> { broadcast_prepend_later_to "quotes" }
  # after_update_commit -> { broadcast_prepend_later_to "quotes" }
  # after_destroy_commit -> { broadcast_remove_to "quotes" }
  # The three callbacks 👆 are equivalent to a single line of code.

  broadcasts_to ->(quote) { "quotes" }, inserts_by: :prepend

  scope :ordered, -> { order(updated_at: :desc) }
end
