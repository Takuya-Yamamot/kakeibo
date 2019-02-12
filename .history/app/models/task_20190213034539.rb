class Task < ApplicationRecord
    scope :date_between, -> from, to {
        if from.present? && to.present?
          where(date: from..to)
        elsif from.present?
          where('date >= ?', from)
        elsif to.present?
          where('date <= ?', to)
        end
      }

      validates :date, presence: true
      validates :date, date: true
      validates :price, presence: true, integer: true
end
