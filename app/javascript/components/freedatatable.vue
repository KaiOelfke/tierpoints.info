<template>
  <div id="freedatatable">
    <v-client-table 
      :data="tableData"
      :columns="columns"
      :options="options"
      @row-click="rowClick"
      ref="ct">
      <template slot="child_row" slot-scope="props">
        <p> {{props.row.itinerary}} </p>
        <p> {{props.row.human_price}} </p>
      </template>
    </v-client-table>
  </div>
</template>

<script>
  export default {
    props: ['tableData'],
    methods: {
      rowClick: function(event) {
        if (this.$refs.ct.openChildRows.includes(event.row.id)) {
          this.$refs.ct.openChildRows = []
        } else {
          this.$refs.ct.openChildRows = [event.row.id]
        }
      }  
    },
    data() {
      return {
        columns: [ 'departure_airport', 'arrival_airport', 'carrier_upcase',
          'tp', 'human_price', 'price_tp_ratio', 'booking_class_capitalize', 'human_expire_date'],
        options: {
          perPage: 10,
          perPageValues: [10, 25, 50, 100],
          filterable: false,
          headings: {
            'departure_airport': 'Departure',
            'arrival_airport': 'Arrival',
            'tp': 'TP',
            'human_price': 'Price',
            'price_tp_ratio': '€/TP',
            'carrier_upcase': 'Carrier',
            'booking_class_capitalize' : 'Class',
            'human_expire_date': 'Expires'
          },
          texts: {
            count: "Showing {from} to {to} of {count} runs",
            limit: "",
            noResults: "No matching runs",
          },
          columnsDisplay: {
            human_price: 'not_mobile',
            arrival_airport: 'not_mobile',
            departure_airport: 'not_mobile',
            booking_class_capitalize: 'min_tabletL'
          },
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

.VueTables__child-row-toggler {
    width: 16px;
    height: 16px;
    line-height: 16px;
    display: block;
    margin: auto;
    text-align: center;
}

.VueTables__child-row-toggler--closed::before {
    content: "+";
}

.VueTables__child-row-toggler--open::before {
    content: "-";
}
</style>