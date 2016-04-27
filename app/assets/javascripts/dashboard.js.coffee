$ ->
  new Vue(
    el: "#user-in-list"
    data:
      users: gon.friends
      listMembers: gon.list_members
  )
