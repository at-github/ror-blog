// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails" // with link method work but jQuery dont
import "controllers"
import * as jq from 'jquery';

window.addEventListener('load', function() {
  if (!window.jQuery)
    throw Error('/!\\ jQuery not defined')
})
