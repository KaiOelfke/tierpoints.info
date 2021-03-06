// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("local-time").start()

window.Rails = Rails

import 'bootstrap'
import 'data-confirm-modal'

$(document).on("turbolinks:load", () => {
  $('[data-toggle="tooltip"]').tooltip()
  $('[data-toggle="popover"]').popover()
})

import TurbolinksAdapter from 'vue-turbolinks'
import Vue from 'vue/dist/vue.esm'

Vue.use(TurbolinksAdapter)

import { library, config, dom } from '@fortawesome/fontawesome-svg-core'
import { FontAwesomeIcon } from '@fortawesome/vue-fontawesome'
import { faSort, faSortAlphaDown, faSortAlphaUp } from '@fortawesome/free-solid-svg-icons'
library.add( faSort, faSortAlphaDown, faSortAlphaUp)

/**
 * Setting this config so that Vue-tables-2 will be able to replace sort icons with chevrons
 * https://fontawesome.com/how-to-use/with-the-api/setup/configuration
 */
config.autoReplaceSvg = 'nest'
Vue.component('fa', FontAwesomeIcon)

import Datatable from '../components/datatable'
Vue.component('datatable', Datatable)
import Freedatatable from '../components/freedatatable'
Vue.component('freedatatable', Freedatatable)

import Jsondebug from '../components/jsondebug'
Vue.component('jsondebug', Jsondebug)

import { ClientTable } from 'vue-tables-2';
Vue.use(ClientTable, {}, false, 'bootstrap4', 'default');



document.addEventListener('turbolinks:load', () => {

  const vueElement = document.querySelector('[data-behavior="vue"]');
  if (vueElement != null) {
    const app = new Vue({
      el: '[data-behavior="vue"]',
    })
  }
})

import Subscriptions from 'subscriptions'
document.addEventListener('turbolinks:load', () => {
  const stripeScriptElement = document.getElementById('stripe-script')
  const cardElement = document.getElementById('card-element');

  if (stripeScriptElement != null && cardElement != null) {
    stripeScriptElement.addEventListener('load', Subscriptions.addStripe)
  }
});

// Stimulus
import { Application } from "stimulus"
// import { definitionsFromContext } from "stimulus/webpack-helpers"

const application = Application.start()
// const context = require.context("./controllers", true, /\.js$/)

// application.load(definitionsFromContext(context))

import Flatpickr from "stimulus-flatpickr";
application.register("flatpickr", Flatpickr);
import "flatpickr/dist/flatpickr.min.css";

