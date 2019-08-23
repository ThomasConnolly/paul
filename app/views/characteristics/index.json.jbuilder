# frozen_string_literal: true

json.array! @characteristics, partial: 'characteristics/characteristic', as: :characteristic
