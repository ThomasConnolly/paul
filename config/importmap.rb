# Pin npm packages by running ./bin/importmap pin npm:PACKAGE_NAME

pin "application", preload: true
pin "bootstrap" # @5.3.5
pin "@popperjs/core", to: "@popperjs--core.js" # @2.11.8
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true  
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin "controllers", preload: true
pin "flatpickr", to: "https://ga.jspm.io/npm:flatpickr@4.6.13/dist/esm/index.js"
pin "trix"
pin "@rails/actiontext"
pin "@rails/request.js", to: "request.js"
pin "sortablejs"
pin "@rails/actioncable"

