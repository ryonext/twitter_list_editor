$ ->
  new Vue(
    el: "#user-in-list"
    data:
      currentUserId: gon.current_user_id
      users: gon.friends
      listMembers: gon.list_members
    ready: ->
      for list in this.listMembers
        this.fetchMembers(list)
    methods:
      fetchMembers: (list) ->
        this.$http(
          method: "GET"
          url: "/members?list_id=#{list.list.id_str}&owner_id=#{this.currentUserId}"
          headers:
            "X-CSRF-Token": $('meta[name="csrf-token"]').attr('content')
        ).then( (response) ->
          list.members = response.data
        ).catch( (err) ->
          alert("error")
        )
  )
