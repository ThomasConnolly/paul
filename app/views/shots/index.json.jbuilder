# frozen_string_literal: true

json.array! @shots, partial: 'shots/shot', as: :shot
