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
      checkedChanged: ->
        unless this.checked
          data = {
            member:
              list: this.name
              user: this.user
          }

          this.$http(
            method: "POST"
            url: "/members"
            data: data
            headers:
              "X-CSRF-Token": $('meta[name="csrf-token"]').attr('content')
          ).then( (response) ->
            alert("success")
          ).catch( (err) ->
            alert("error")
          )
        else
          # TODO implement destroy
          console.log("unchecked")
  )
