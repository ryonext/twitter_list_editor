$ ->
  Vue.component(
    "list"
    template: "#list"
    props:
      list: null
      members: null
      checked: null
      user: null
    ready: ->
      this.checked = this.isMember()
    methods:
      isMember: ->
        this.members.includes(this.user.id_str)
      checkedChanged: ->
        data = {
          member:
            list: this.list.id_str
            user: this.user.id_str
        }

        unless this.checked
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
          this.$http(
            method: "DELETE"
            url: "/members/#{this.list.id_str}"
            data: data
            headers:
              "X-CSRF-Token": $('meta[name="csrf-token"]').attr('content')
          ).then( (response) ->
            alert("success")
          ).catch( (err) ->
            alert("error")
          )

  )
