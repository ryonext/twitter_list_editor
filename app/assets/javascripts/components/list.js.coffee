$ ->
  Vue.component(
    "list"
    template: "#list"
    props:
      name: null
      members: null
      checked: null
      user: null
    ready: ->
      this.checked = this.isMember()
    methods:
      isMember: ->
        this.members.includes(this.user)
  )
