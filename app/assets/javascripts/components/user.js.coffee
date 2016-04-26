$ ->
  Vue.component(
    "user-table"
    template: "#user-table"
    props:
      users:
        type: Array
        default: []
  )

  Vue.component(
    "user"
    template: "#user"
    props:
      user: null
  )
