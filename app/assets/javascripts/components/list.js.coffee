$ ->
  Vue.component(
    "list"
    template: "#list"
    props:
      name: null
      members: null
    methods:
      isMember: (screenName) ->
        this.members.include(screenName)
  )
