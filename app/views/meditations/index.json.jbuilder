# frozen_string_literal: true

json.array! @meditations, partial: 'meditations/meditation', as: :meditation
