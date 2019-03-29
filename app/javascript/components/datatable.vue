<template>
  <div id="datatable">
    <p><button class="btn btn-outline-primary" v-on:click="jsonDebug = !jsonDebug">Toggle JSON</button></p>
    <div v-if="jsonDebug">
      <pre style="font-size: 9px">{{ tableData | pretty }}</pre>
    </div>
    <v-client-table 
      :data="tableData"
      :columns="columns"
      :options="options"
      ref="ct">
      <div slot="beforeLimit" class="p-3">
        <button type="button" class="btn btn-outline-primary" v-on:click="handleReset">
          Reset Filters
        </button>
      </div>
    </v-client-table>
  </div>
</template>

<script>
  export default {
    props: ['tableData'],
    filters: {
      pretty: function(value) {
        return JSON.stringify(value, null, 2);
      }
    },
    methods: {
      handleReset: function() {
        var query = this.$refs.ct.query
        for (var key in query) {
          this.$refs.ct.query[key] = '';
        }
      } 
    },
    data() {
      return {
        jsonDebug: false,
        columns: [ 'departure_airport', 'arrival_airport', 'carrier_upcase',
          'tp', 'human_price', 'price_tp_ratio', 'booking_class_capitalize'],
        options: {
          headings: {
            'departure_airport': 'Departure',
            'arrival_airport': 'Arrival',
            'tp': 'TP',
            'human_price': 'Price',
            'price_tp_ratio': '€/TP',
            'carrier_upcase': 'Carrier',
            'booking_class_capitalize' : 'Class'
          },
          sortable: ['tp', 'human_price', 'price_tp_ratio'],
          sortIcon: {
            is: 'fa-sort', base: 'fas',
            up: 'fa-sort-up', down: 'fa-sort-down'
          },
          filterByColumn: true,
          texts: {
            count: "Showing {from} to {to} of {count} runs",
            filter: "Filter:",
            limit: "",
            noResults: "No matching runs",
            filterBy: "Filter",
          },
          columnsDisplay: {
            human_price: 'not_mobile',
            arrival_airport: 'not_mobile',
            human_price: 'not_mobile',
            booking_class_capitalize: 'min_tabletL'
          },
          listColumns: {
            tp: 
              [{ id: '0_100', text: '0 to 100' },
              { id: '100_400', text: '101 to 400' },
              { id: '400_800', text: '401 to 800' },
              { id: '800_1200', text: '801 to 1200' },
              { id: '1200_+', text: '1201 or more' }],
            price_tp_ratio: 
              [{ id: '<1', text: '<1 €/TP' },
              { id: '<2', text: '<2 €/TP' },
              { id: '<3', text: '<3 €/TP' }],
            carrier_upcase: 
              [{ id: 'AA', text: 'AA'}, { id: 'AY', text: 'AY'},
              { id: 'BA', text: 'BA'}, { id: 'CX', text: 'CX'},
              { id: 'IB', text: 'IB'}, { id: 'JL', text: 'JL'},
              { id: 'LA', text: 'LA'}, { id: 'MH', text: 'MH'},
              { id: 'QF', text: 'QF'}, { id: 'QR', text: 'QR'},
              { id: 'RJ', text: 'RJ'}, { id: 'S7', text: 'S7'},
              { id: 'UL', text: 'UL'}]  
          },
          customFilters: [{ 
            name: 'tp',
            callback: function (row, query) {
              switch(query) {
                case "0_100":
                  return row.tp <= 100
                  break
                case "100_400":
                  return row.age > 100 && row.age <= 400
                  break
                case "400_800":
                  return row.age > 400 && row.age <= 800
                  break
                case "800_1200":
                  return row.age > 800 && row.age <= 1200
                  break
                case "1200_+":
                  return row.age > 1200
                  break
                default:
                  return false
              }
            }
          },
          { name: 'price_tp_ratio',
            callback: function (row, query) {
              switch(query) {
                case "<1":
                  return row.price_tp_ratio < 1
                  break
                case "<2":
                  return row.price_tp_ratio < 2
                  break
                case "<3":
                  return row.price_tp_ratio < 3
                  break
                default:
                  return false
              }
            }
          }]
        },
        theme: 'bootstrap4'
      }
    }
  }
</script>

<style>
.fa, .fas, .far, .fal, .fab {
  line-height: 1.5;
}
</style>