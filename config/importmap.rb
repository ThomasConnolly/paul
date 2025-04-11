# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true  
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin "controllers", preload: true
pin "bootstrap"
pin "flatpickr"
pin "trix"
pin "@rails/actiontext"
pin "@rails/request.js", to: "request.js"
pin "sortablejs"
pin "@popperjs/core"
pin "@rails/actioncable"
